view: products {
  sql_table_name: "PUBLIC"."PRODUCTS"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}."BRAND";;
    link: {
      label: "Drill by Brand"
      url: "https://looker.bytecode.io/dashboards-next/D7uvVi6C30amW11FMWLM4w?Brand={{ value }}"
    }
  }

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
    drill_fields: [brand]
  }

  dimension: cost {
    type: number
    sql: ${TABLE}."COST" ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}."DEPARTMENT" ;;
  }

  dimension: distribution_center_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."DISTRIBUTION_CENTER_ID" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}."RETAIL_PRICE" ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}."SKU" ;;
  }

  # dimension: brand_filter {
  #   type: string
  #   hidden: yes
  #   sql: ${TABLE}.brand ;;
  # }

  filter: brand_select {
    suggest_dimension: brand

  }

  # dimension: brand_comparitor {
  #   type: string
  #   sql:
  #   CASE
  #     WHEN {% condition brand_select %} ${brand} {% endcondition %} AND ${num.n} = 1
  #         THEN ${brand}
  #       ELSE 'Total Of Population'
  #     END ;;
  # }


  # filter: filter_on_brand_filter {
  #   type: string
  #   sql: {% condition filter_on_foo %} ${foo} {% endcondition %} ;;
  # }

  measure: count {
    type: count
    drill_fields: [id, name, distribution_centers.name, distribution_centers.id, inventory_items.count]
  }
}
