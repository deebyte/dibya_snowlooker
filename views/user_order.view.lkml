view: user_order {
  derived_table: {
    sql: SELECT
          users."ID"  AS "users.id",
          COUNT( users."ID" ) AS "users.lifetime_items",
          COUNT(DISTINCT ( order_items."ORDER_ID"  ) ) AS "users.lifetime_orders"
      FROM "PUBLIC"."USERS"
           AS users
      LEFT JOIN "PUBLIC"."ORDER_ITEMS"
           AS order_items ON (users."ID") = (order_items."USER_ID")
      GROUP BY
          1
      ORDER BY
          2 DESC
      FETCH NEXT 500 ROWS ONLY
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: users_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."users.id" ;;
  }

  dimension: lifetime_items {
    type: number
    sql: ${TABLE}."users.count" ;;
  }

  dimension: users_lifetime_orders {
    type: number
    sql: ${TABLE}."users.lifetime_orders" ;;
  }

  dimension: lifetime_orders_tiered {
    type: tier
    style: integer
    tiers: [0,1,2,3,5,10]
    sql: ${users_lifetime_orders} ;;
  }

  set: detail {
    fields: [users_id, lifetime_items, users_lifetime_orders]
  }
}
