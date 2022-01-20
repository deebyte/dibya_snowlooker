view: users {
  sql_table_name: "PUBLIC"."USERS"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}."AGE" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: age_tier {
    type:  tier
    tiers: [15, 25, 35, 45, 55, 65]
    style: integer
    sql: ${age} ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }

  # dimension: state {
  #   map_layer_name: us_states
  #   sql: ${TABLE}.state ;;
  # }

  dimension_group: created {
    type: time
    convert_tz: no
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension_group: since_signup {
    type: duration
    intervals: [
      day,
      month
    ]
    sql_start: ${created_raw} ;;
    sql_end: current_date() ;;
  }

  dimension: signup_date_tier{
    type:  tier
    tiers: [10, 20, 30, 40, 50, 60]
    style: integer
    sql: ${months_since_signup} ;;
  }

  dimension: user_signup_last_month{
    type: yesno
    sql: ADD_MONTHS(${created_raw} ,-1);;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FIRST_NAME" ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}."GENDER" ;;
  }

  # dimension: is_new_user_yesterday {
  #   type: yesno
  #   sql: ${created_date} = DATEADD(Day ,-1, getdate()) ;;
  # }

  dimension: yesterday {
    #hidden: yes
    type: date
    sql: dateadd(day, -1, getdate());;
  }

  dimension: is_created_yesterday {
    type: yesno
    sql: ${yesterday} = ${created_date} ;;
  }

  dimension: is_user_active {
    type: yesno
    sql: ${created_date} >= DATEADD(Day ,-90, current_date) ;;
  }

  dimension: is_new_user{
    type: yesno
    sql: ${created_date} >= DATEADD(Day ,-90, current_date);;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}."LATITUDE" ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}."LONGITUDE" ;;
  }

  dimension: location {
    type:  location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."STATE" ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}."TRAFFIC_SOURCE" ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}."ZIP" ;;
  }

  measure: lifetime_items {
    type: count
  }

  # measure: lifetime_orders {
  #   type: count_distinct
  #   sql: ${order_items.order_id} ;;
  # }

  # measure: lifetime_revenue {
  #   type: number
  #   value_format_name: usd
  #   sql: ${lifetime_orders} * ${order_items.total_sales_price} ;;
  # }

  measure: count {
    type: count
    drill_fields: [id, last_name, first_name, events.count, order_items.count]
  }

}
