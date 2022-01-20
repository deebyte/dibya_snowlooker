view: product_selected {
    derived_table:{

      sql:  SELECT *
      FROM products p
      WHERE {% condition product_brand %} p.product_brand {% endcondition %} ;;

    }

  dimension: product_name {
    suggest_dimension: products.name

 }

  dimension: product_brand {
    suggest_dimension: products.brand

  }


  dimension: comparison{
    sql:

    CASE
    WHEN  ${products.name} = ${product_selected.product_name}
    THEN '(1) '||${products.name}
    WHEN  ${products.brand} = ${product_selected.product_brand}
    THEN '(2) Rest of '||${products.brand}
    ELSE '(3) Rest Of Population'
    END ;;
  }

  # measure: total_sale_price_this_item {
  #   type: sum
  #   sql: ${TABLE}.retail_price
  #   filters: ${product_selected.comparison}: '(1)%'
  # }


}
