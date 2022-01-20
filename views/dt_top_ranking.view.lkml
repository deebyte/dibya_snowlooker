view: dt_top_ranking {
  view_label: " TOTT | Top N Ranking"
  derived_table: {
    #parameter value specifies which of the rankings from the inner table to use
    explore_source: order_items {
      bind_all_filters: yes
      column: brand_name { field: products.brand }
      column: order_items_count { field: order_items.count}
      column: total_gross_revenue { field: order_items.total_gross_revenue }
      # column: order_items_gross_margin { field: order_items.total_gross_margin }
      column: order_items_returned_count { field: order_items.returned_items }
      derived_column: ranking {
        sql: rank() over (order by {% parameter brand_rank_measure_selection %} desc) ;;
      }
      # derived_column: total_gross_revenue_d {
      #   sql: sum() over (order_items.total_gross_revenue);;
      # }
    }
  }

  dimension: brand_name {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  dimension: brand_rank {
    hidden: yes
    type: string
    sql: ${TABLE}.ranking ;;
  }

#### This parameter will allow a user to select a Top N ranking limit for bucketing the brands
  parameter: top_rank_limit {
    view_label: " TOTT | Top N Ranking"
    type: unquoted
    default_value: "1"
    allowed_value: {
      label: "Top Rank"
      value: "1"
    }
    allowed_value: {
      label: "Top 5"
      value: "5"
    }
    allowed_value: {
      label: "Top 10"
      value: "10"
    }
    allowed_value: {
      label: "Top 20"
      value: "20"
    }
    allowed_value: {
      label: "Top 50"
      value: "50"
    }
  }

  dimension: brand_name_top_brands {
    view_label: " TOTT | Top N Ranking"
    label: "Brands (Top {% if top_rank_limit._is_filtered %}{% parameter top_rank_limit %}{% else %}N{% endif %})"
    order_by_field: brand_rank_top_brands
    type: string
    sql:
      CASE
        WHEN ${brand_rank}<={% parameter top_rank_limit %} THEN ${brand_name}
        ELSE 'Other'
      END
    ;;
  }

  dimension: brand_rank_top_brands {
    view_label: " TOTT | Top N Ranking"
    label_from_parameter: top_rank_limit
    type: string
    sql:
      CASE
        WHEN ${brand_rank}<={% parameter top_rank_limit %}
          THEN
            CASE
              WHEN ${brand_rank}<10 THEN 0 || cast(${brand_rank} as varchar)
              ELSE to_char(${brand_rank})
            END
        ELSE 'Other Brands'
      END
    ;;
  }

  parameter: brand_rank_measure_selection {
    view_label: " TOTT | Top N Ranking"
    description: "Specify which metric to rank Brands by"
    type: unquoted
    default_value: "order_items_count"
    allowed_value: {
      label: "Order Items Count"
      value: "order_items_count"
    }
    allowed_value: {
      label: "Order Items Total Gross Revenue"
      value: "total_gross_revenue"
    }
    # allowed_value: {
    #   label: "Order Items Gross Margin"
    #   value: "total_gross_margin_amount"
    # }
    allowed_value: {
      label: "Order Items Returned Count"
      value: "returned_items"
    }
  }

  measure: dynamic_measure {
    view_label: " TOTT | Top N Ranking"
    label_from_parameter: brand_rank_measure_selection
    type: number
    sql:
      {% if brand_rank_measure_selection._parameter_value == 'order_items_count' %} ${order_items.count}
      {% elsif brand_rank_measure_selection._parameter_value == 'total_gross_revenue' %} ${order_items.total_gross_revenue}
      {% elsif brand_rank_measure_selection._parameter_value == 'returned_items' %} ${order_items.returned_items}
      {% else %}  ${order_items.count}
      {% endif %}
    ;;
    html:
      {% if brand_rank_measure_selection._parameter_value == 'order_items_count' %}  {{ order_items.count._rendered_value }}
      {% elsif brand_rank_measure_selection._parameter_value == 'total_gross_revenue' %}  {{ order_items.total_gross_revenue._rendered_value }}
      {% elsif brand_rank_measure_selection._parameter_value == 'returned_items' %}  {{ order_items.returned_items._rendered_value }}
      {% else %} {{ count._rendered_value }}
      {% endif %}
    ;;
  }

  # measure: total_gross_revenue_d {
  #   view_label: " TOTT | Top N Ranking"
  #   type: sum
  #   sql: ${total_gross_revenue_d} ;;
  # }

  }
