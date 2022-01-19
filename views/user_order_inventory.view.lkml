view: user_order_inventory {
  view_label: "Order Items"

  measure: total_gross_margin_amount {
    label: "Total Gross Margin Amount"
    type: number
    value_format_name: usd
    drill_fields: [total_gross_margin_amount_set*]
    sql: ${order_items.total_gross_revenue} - ${inventory_items.total_cost} ;;
  }

  measure: avg_sale_price {
    type: average
    value_format_name: usd
    sql: ${order_items.sale_price} ;;
  }

  # measure: lifetime_orders {
  #   type: count_distinct
  #   sql: ${order_items.order_id} ;;
  # }

  measure: avg_spend_per_customer{
    type: number
    value_format_name: usd
    sql: ${order_items.total_gross_revenue}/${users.count};;
  }

  measure: gross_margin_percent {
    type: number
    sql: 1.0 * ${total_gross_margin_amount}/ nullif(${order_items.total_gross_revenue},0);;
    value_format_name: percent_2
  }

  # measure: lifetime_revenue_calc {
  #   type: number
  #   value_format_name: usd
  #   sql: ${lifetime_orders} * ${order_items.total_sales_price} ;;
  # }

  # dimension: lifetime_revenue {
  #   type: number
  #   value_format_name: usd
  #   sql: ${lifetime_orders} * ${order_items.total_sales_price} ;;
  # }


  # dimension: lifetime_revenue_tiered12 {
  #   type: tier
  #   value_format_name: usd
  #   style: integer
  #   tiers: [0, 5, 20,50,100,500,1000]
  #   sql: ${lifetime_revenue} ;;
  # }

  measure: total_first_purchase_revenue {
    type: sum
    value_format_name: usd
    sql: ${order_items.total_gross_revenue} where ${dt_order_sequence.is_first_purchase} = 'yes'  ;;
  }

  parameter: metric_selector {
    type: string
    allowed_value: {
      label: "Total Revenue"
      value: "total_gross_revenue"
    }
    allowed_value: {
      label: "Average Sale Price"
      value: "avg_sale_price"
    }
    allowed_value: {
      label: "Average Spend Per Customer"
      value: "avg_spend_per_customer"
    }
    }

    measure: metric {
      label_from_parameter: metric_selector
      type: number
      value_format: "$0.0,\"K\""
      sql:
          CASE
            WHEN {% parameter metric_selector %} = 'total_gross_revenue'
              THEN ${order_items.total_gross_revenue}
            WHEN {% parameter metric_selector %} = 'avg_sale_price'
              THEN ${user_order_inventory.avg_sale_price}
            WHEN {% parameter metric_selector %} = 'avg_spend_per_customer'
              THEN ${user_order_inventory.avg_spend_per_customer}
            ELSE NULL
          END ;;
    }


# Profit
  measure: profit {
    type: number
    value_format_name: usd
    sql: ${order_items.total_sales_price} - ${inventory_items.total_cost} ;;
  }

  measure: avg_profit {
    type: average
    value_format_name: usd
    sql: ${profit} ;;
  }

  set: total_gross_margin_amount_set {
    fields: [
      order_items.order_id,
      inventory_items.id,
      inventory_items.product_category,
      inventory_items.product_brand
    ]
  }

}
