view: dt_user_order {
    derived_table: {
      explore_source: users {
        column: id {}
        column: count_of_users {field: users.count}
        column:order_count { field: order_items.count }
      }
    }
    dimension: id {
      hidden: yes
      type: number
    }
    dimension: order_count {
      label: "Total Orders"
      type: number
    }
    dimension: lifetime_orders_tiered {
      type: tier
      style: integer
      tiers: [2,3,5,10,15,30]
      sql: ${order_count} ;;
    }
    measure: count_of_users {
      type: count
      sql: ${id} ;;
    }
    measure: percent_of_total_users {
      type: percent_of_total
      sql: ${count_of_users} ;;
    }

  }
