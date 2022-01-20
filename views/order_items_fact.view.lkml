view: order_items_fact {
  derived_table: {
    sql: SELECT
            order_items.user_id as user_id
            , COUNT(*) as lifetime_items
            , COUNT(DISTINCT order_items.order_id) as lifetime_orders
            , MIN(order_items.created_at) as first_order
            , MAX(order_items.created_at) as latest_order
            , SUM(order_items.sale_price) as lifetime_revenue
          FROM order_items
          GROUP BY user_id ;;
    #  sortkeys: [user_id]
    #  sql_trigger_value: SELECT MAX(id) FROM orders ;;
    }

    dimension: user_id {
      primary_key: yes
      hidden: yes
    }

    dimension: lifetime_items {
      type: number
      sql: COALESCE(${TABLE}.lifetime_items,0) ;;
    }

    dimension: lifetime_orders {
      type: number
      sql: COALESCE(${TABLE}.lifetime_orders,0) ;;
    }

    dimension: lifetime_orders_tiered {
      type: tier
      style: integer
      tiers: [0,1,2,3,5,10]
      sql: ${lifetime_orders} ;;
    }

    dimension: lifetime_revenue {
      type: number
      sql: COALESCE(${TABLE}.lifetime_revenue,0) ;;
    }

    dimension: lifetime_revenue_tiered {
      type: tier
      value_format_name: usd
      style: integer
      tiers: [20,50,100,500,1000]
      sql: ${lifetime_revenue} ;;
    }


  }
