view: dt_order_sequence{
    derived_table: {
      explore_source: order_items {
        column: user_id {}
        column: order_id {}
        column: created_date {}
        derived_column: order_sequence_number {
          sql: row_number() over (partition by user_id ORDER BY created_date) ;;
        }
        derived_column: days_between_orders {
          sql: DATEDIFF(day, LAG(created_date, 1) OVER (PARTITION BY user_id ORDER BY created_date), created_date) ;;
        }
      }
    }
    dimension: user_id {
      type: number
    }
    dimension: order_id {
      primary_key: yes
      type: number
    }
    dimension: created_date {
      type: date
    }

  dimension: order_sequence_number {
    type: number
    sql: ${TABLE}.order_sequence_number ;;
  }

  dimension: days_between_orders {
    type: number
    sql: ${TABLE}.days_between_orders ;;
  }

  dimension: is_first_purchase {
    type: yesno
    sql: ${order_sequence_number} = 1 ;;
  }

  dimension: has_subsequent_purchase {
    type: yesno
    sql: ${order_sequence_number} > 1 ;;
  }

  measure: avg_days_between_orders {
    type: average
    precision: 2
    sql: ${days_between_orders} ;;
  }



  }
