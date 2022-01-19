# # include: "/views/*.view"
# include: "/views/**/*.view"


# explore: users{
#   view_name: users
#   join: order_items {
#     type: left_outer
#     sql_on: ${users.id} = ${order_items.user_id} ;;
#     relationship: one_to_many
#   }

#   join: dt_user_order {
#     type: left_outer
#     view_label: "Users"
#     sql_on: ${users.id} = ${dt_user_order.id} ;;
#     relationship: one_to_one
#   }

#   join: dt_time_since_signup {
#     type: left_outer
#     view_label: "Users"
#     sql_on: ${users.id} = ${dt_time_since_signup.id} ;;
#     relationship: one_to_one
#   }

#   join: events {
#     type: left_outer
#     view_label: "Users"
#     sql_on: ${users.id} = ${events.user_id} ;;
#     relationship: one_to_one
#   }

#   join: order_items_fact {
#     type: left_outer
#     view_label: "Users"
#     sql_on: ${users.id} = ${order_items_fact.user_id};;
#     relationship: one_to_one
#   }


# }
