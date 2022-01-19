view: dt_time_since_signup{
  derived_table: {
    explore_source: users {
      column: days_since_signup {}
      column: months_since_signup {}
      column: id {}
    }
  }
  dimension: days_since_signup {
    value_format: "0"
    type: number
  }
  dimension: months_since_signup {
    value_format: "0"
    type: number
  }
  dimension: id {
    type: number
  }
  measure: distinct_users {
    type:  count_distinct
    sql: ${id} ;;
  }
  measure: sum_days_since_signup {
    type: sum
    sql: ${days_since_signup} ;;
  }

  measure: sum_months_since_signup {
    type: sum
    sql: ${months_since_signup};;
  }
  measure: average_days_since_signup {
    type: number
    precision: 2
    sql: ${sum_days_since_signup}/${distinct_users}  ;;
  }

  measure: average_months_since_signup {
    type: number
    precision: 2
    sql: ${sum_months_since_signup}/${distinct_users}  ;;
  }

}
