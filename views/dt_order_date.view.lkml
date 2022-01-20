view: dt_order_date {
    derived_table: {
      explore_source: order_items {
        column: order_id {}
        column: user_id {}
        column: created_date {}
        column: inventory_item_id {field: order_items.inventory_item_id}
        column: category {field: products.category}
      }
    }
    dimension: user_id {
      type: number
    }
    dimension: order_id {
      type: number
    }
    dimension: created_date {
      type: date
    }

  dimension: inventory_item_id {
    type: number
  }
  dimension: category {
    type: string
  }

  # dimension_group: days_since_last_order {
  #   type: duration
  #   intervals: [
  #     day,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql_start:${last_order_date} ;;
  #   sql_end: current_date() ;;
  # }

  measure: first_order_date {
    label: "First Order Date"
    type: date
    sql: MIN(${created_date}) ;;
    convert_tz: no
  }
  measure: latest_order_date {
    label: "Latest Order Date"
    type: date
    sql: MAX(${created_date}) ;;
    convert_tz: no
  }

  measure: days_since_last_order {
    type: number
    sql: DATEDIFF( day,${latest_order_date},GETDATE()) ;;
  }


  measure: repeat_customer {
    type: yesno
    sql: ${first_order_date} != ${latest_order_date} ;;
  }


  }
