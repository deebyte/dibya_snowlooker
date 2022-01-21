connection: "snowlooker"

# include all the views
# include: "/views/**/*.view"
include: "/views/*.view"

include: "/explores/*.explore"

datagroup: dibya_snowlooker_case_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dibya_snowlooker_case_default_datagroup

# explore: distribution_centers {}

# explore: etl_jobs {}

explore: events {

}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

# explore: order_items {
#   join: inventory_items {
#     type: left_outer
#     sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
#     relationship: many_to_one
#   }

#   join: total_gross_revenue {
#     type: left_outer
#     sql_on: ;;
#   relationship: one_to_one
#   }

#   # join: dt_order_patterns {
#   #   type: left_outer
#   #   view_label: "Users"
#   #   sql_on: ${order_items.order_id} = ${dt_order_patterns.order_id} ;;
#   #   relationship: one_to_many
#   # }

#   join:   dt_order_sequence {
#     type: left_outer
#     view_label: "Users"
#     sql_on: ${order_items.order_id} = ${dt_order_sequence.order_id} ;;
#     relationship: one_to_many
#   }

#   # join: users {
#   #   type: left_outer
#   #   sql_on: ${order_items.user_id} = ${users.id} ;;
#   #   relationship: many_to_one
#   # }


#   join: dt_top_ranking {
#     view_label: "TOTT - Top N Ranking"
#     type: inner
#     relationship: many_to_one
#     sql_on: ${products.brand} = ${dt_top_ranking.brand_name} ;;
#   }

# }

explore: products {
  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }

  # join: product_selected {
  #   type: cross
  #   relationship: one_to_one
  # }

  # join: status {
  #   from: order_items
  #   type: left_outer
  #   relationship: many_to_one
  # }


}

explore: users{
  view_name: users
  join: order_items {
    type: left_outer
    sql_on: ${users.id} = ${order_items.user_id} ;;
    relationship: one_to_many
  }

  join: dt_user_order {
    type: left_outer
    view_label: "Users"
    sql_on: ${users.id} = ${dt_user_order.id} ;;
    relationship: one_to_one
  }

  join: dt_time_since_signup {
    type: left_outer
    view_label: "Users"
    sql_on: ${users.id} = ${dt_time_since_signup.id} ;;
    relationship: one_to_one
  }

  join: events {
    type: left_outer
    view_label: "Users"
    sql_on: ${users.id} = ${events.user_id} ;;
    relationship: one_to_one
  }

  join: order_items_fact {
    type: left_outer
    view_label: "Users"
    sql_on: ${users.id} = ${order_items_fact.user_id};;
    relationship: one_to_one
  }
  }
