view: average_calculation {
  derived_table: {
    sql: SELECT
          order_items."USER_ID"  AS "order_items.user_id",
          order_items."ORDER_ID" AS "order_id",
          order_items."SALE_PRICE"  AS "sales_price"
      FROM "PUBLIC"."ORDER_ITEMS"
           AS order_items
       ;;
  }

  measure: count {
    type: count
    #drill_fields: [detail*]
  }

  dimension: order_items_user_id {
    label: "User Id"
    type: number
    sql: ${TABLE}."order_items.user_id" ;;
  }

#lifetime orders
  dimension: Order_Id {
    primary_key: yes
    type: number
    sql: ${TABLE}."order_id" ;;
  }

  dimension: order_items_total_sales_price {
    label: "Total Sales Price"
    type: number
    sql: ${TABLE}."sales_price" ;;
  }


  measure: total_lifetime_revenue {
    type: sum
    value_format_name: usd
    sql: ${order_items_total_sales_price} ;;
    link: {
      label: "Drilling into MOM Total Gross Revenue"
      url: "{% assign vis_config= '{\"x_axis_gridlines\":false,
\"y_axis_gridlines\":true,
\"show_view_names\":false,
\"show_y_axis_labels\":true,
\"show_y_axis_ticks\":true,
\"y_axis_tick_density\":\"default\",
\"y_axis_tick_density_custom\":5,
\"show_x_axis_label\":true,
\"show_x_axis_ticks\":true,
\"y_axis_scale_mode\":\"linear\",
\"x_axis_reversed\":false,
\"y_axis_reversed\":false,
\"plot_size_by_field\":false,
\"trellis\":\"\",
\"stacking\":\"\",
\"limit_displayed_rows\":false,
\"legend_position\":\"center\",
\"point_style\":\"none\",
\"show_value_labels\":false,
\"label_density\":25,
\"x_axis_scale\":\"auto\",
\"y_axis_combined\":true,
\"show_null_points\":true,
\"interpolation\":\"linear\",
\"y_axes\":[{\"label\":\"\",
\"orientation\":\"left\",
\"series\":[{\"axisId\":\"order_items.Total_Gross_Revenue\",
\"id\":\"2021 - order_items.Total_Gross_Revenue\",
\"name\":\"2021\"},
{\"axisId\":\"order_items.Total_Gross_Revenue\",
\"id\":\"2020 - order_items.Total_Gross_Revenue\",
\"name\":\"2020\"},
{\"axisId\":\"order_items.Total_Gross_Revenue\",
\"id\":\"2019 - order_items.Total_Gross_Revenue\",
\"name\":\"2019\"},
{\"axisId\":\"order_items.Total_Gross_Revenue\",
\"id\":\"2018 - order_items.Total_Gross_Revenue\",
\"name\":\"2018\"},
{\"axisId\":\"order_items.Total_Gross_Revenue\",
\"id\":\"2017 - order_items.Total_Gross_Revenue\",
\"name\":\"2017\"}],
\"showLabels\":true,
\"showValues\":true,
\"valueFormat\":\"0\",
\"unpinAxis\":false,
\"tickDensity\":\"default\",
\"tickDensityCustom\":5,
\"type\":\"linear\"}],
\"label_value_format\":\"\",
\"type\":\"looker_line\",
\"defaults_version\":1,
\"hidden_fields\":[\"order_items.CreatedMonth\"]}' %}

{{mom_revenue_drill_dummy._link}}&pivots=order_items.created_year&vis_config={{vis_config | encode_uri}}"
    }
  }


  measure: mom_revenue_drill_dummy {
    hidden: yes
    type: number
    sql:  1  ;;
    drill_fields: [order_items.Total_Gross_Revenue,
order_items.created_year,
order_items.CreatedMonth_MMM,
order_items.CreatedMonth]
  }


  measure: count_orders {
    label: "Total Lifetime Orders"
    type: count_distinct
    sql: ${Order_Id} ;;
  }
# average lifetime revenue
  measure: average_lifetime_revenue {
    label: "Average Lifetime Spending"
    type:  number
    value_format_name: usd
    sql: ${total_lifetime_revenue}/${count_orders};;
  }

  measure: count123 {
    type: count
  }
 }

# The average number of orders that a customer places over the course of their lifetime as a customer.
#   measure: average_orders {
#     type: average
#     sql: ${order_items_count}/${order_items_user_id} ;;
#   }


#   set: detail {
#     fields: [order_items_user_id, order_items_count, order_items_total_sales_price]
#   }
