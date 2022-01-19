view: order_items {
  sql_table_name: "PUBLIC"."ORDER_ITEMS"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
  }


  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DELIVERED_AT" ;;
  }

  dimension_group: fulfillment {
    type: duration
    intervals: [
      hour,
      day,
      week
    ]
    sql_start: ${created_raw} ;;
    sql_end: ${shipped_raw} ;;
  }

  dimension: long_shipping_time {
    type:  yesno
    sql: ${days_fulfillment} > 7;;
  }


  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."INVENTORY_ITEM_ID" ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."RETURNED_AT" ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}."SALE_PRICE" ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."SHIPPED_AT" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."USER_ID" ;;
  }



# creating fields for comparison between a brand and others
  # filter: selected_brand {
  #   type:  string
  #   suggest_dimension: inventory_items.product_brand
  # }

  # dimension: is_selected_brand {
  #   type: yesno
  #   sql: {% condition selected_brand %} ${inventory_items.product_brand} {% endcondition %} ;;
  # }

  measure: count_orders {
    type: count
    # sql: ${order_id} ;;
  }

  measure: count {
    type: count
    drill_fields: [orders.id, inventory_items.product_name, users.id, order_detail*]
  }

  measure: total_sales_price {
    label: "Revenue"
    type: sum
    #drill_fields: [detail*]
    value_format_name: usd
    sql: ${sale_price};;
  }

  measure: last_order_date {
    type: date
    sql: MAX(${created_raw}) ;;
    convert_tz: no
  }

# total gross revenue
  measure: total_gross_revenue {
    label: "Total Gross Revenue"
    type: sum
    filters: [status: "-cancelled", returned_date: "NULL"]
    value_format_name: usd
    sql: ${sale_price} ;;
  }

  # measure: total_gross_margin_amount {
  #   label: "Total Gross Margin Amount"
  #   type: number
  #   value_format_name: usd
  #   drill_fields: [total_gross_margin_amount_set*]
  #   sql: ${total_gross_revenue} - ${inventory_items.total_cost} ;;
  # }

# measure: gross_margin_percent {
#   type: number
#   sql: 1.0 * ${total_gross_margin_amount}/ nullif(${total_gross_revenue},0);;
#   value_format_name: percent_2
# }

measure: percent_of_total_revenue {
  type: percent_of_total
  sql: ${total_gross_revenue} ;;
}


  set: total_gross_margin_amount_set {
    fields: [
      order_id,
      inventory_items.id,
      inventory_items.product_category,
      inventory_items.product_brand
    ]
  }

  measure: returned_items {
    type: count
    filters: [returned_date: "NOT NULL"]
    #sql: ${COUNT inventory_item_id} ;;
  }

  #total items sold

  measure: item_return_rate {
    type: number
    sql: ${returned_items}/  ${inventory_item_id} ;;
  }

  measure: customers_who_have_returned_items {
    type: count_distinct
    filters: [returned_date: "NOT NULL"]
    sql: ${user_id} ;;
  }

  measure: distinct_customers {
    type: count_distinct
    sql: ${user_id}  ;;
  }

  measure: Percentage_of_users_with_returns {
    type: number
    value_format: "0.000\%"
    sql: ${customers_who_have_returned_items}/${distinct_customers} ;;
  }

  measure: average_spend_per_customer {
    description: "Total Sale Price divided by Total Number of Customers"
    type: number
    value_format_name: usd
    sql: sum(${total_gross_revenue}) / count(distinct ${user_id}) ;;
  }

  measure: count_distinct_user {
    type: number
    sql: ${user_id} ;;
  }

  measure: average_sale_price {
    type: average
    value_format_name: usd
    sql: ${sale_price} ;;
  }

  # parameter: metric_selector {
  #   type: string
  #   allowed_value: {
  #     label: "Total Revenue"
  #     value: "total_gross_revenue"
  #   }
  #   allowed_value: {
  #     label: "Average Sale Price"
  #     value: "average_sale_price"
  #   }
  #   allowed_value: {
  #     label: "Average Spend Per Customer"
  #     value: "average_spend_per_customer"
  #   }
  #   allowed_value: {
  #     label: "Item Return Rate"
  #     value: "item_return_rate"
  #   }
  # }

  # measure: metric {
  #   label_from_parameter: metric_selector
  #   type: number
  #   value_format: "[<1]0.0000%;[>1]$0.00"
  #   sql: case when {% parameter metric_selector %} = 'total_gross_revenue' then ${total_gross_revenue}
  #             when {% parameter metric_selector %} = 'average_sale_price' then ${average_sale_price}
  #             when {% parameter metric_selector %} = 'average_spend_per_customer' then ${average_spend_per_customer}
  #             when {% parameter metric_selector %} = 'item_return_rate' then ${item_return_rate};;
  # }





# Profit
  # measure: profit {
  #   type: number
  #   value_format_name: usd
  #   sql: ${total_sales_price} - ${inventory_items.total_cost} ;;
  # }

  # ----- Sets of fields for drilling ------

  set: order_detail {
    fields: [
      id,
      orders.id,
      users.id,
      users.first_name,
      users.last_name,
      inventory_items.id,
      inventory_items.product_name
    ]
  }

  set: detail {
    fields: [
      id,
      inventory_items.product_name,
      inventory_items.id,
      users.last_name,
      users.first_name,
      users.id
    ]
  }
}
