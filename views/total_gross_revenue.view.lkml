view: total_gross_revenue {
  derived_table: {
    explore_source: order_items {
      column: total_gross_revenue {}
    }
  }
  measure: total_gross_revenue {
    value_format: "$#,##0.00"
    type: sum
  }
}
