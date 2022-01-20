---
title: Issues - 48⛔ 164⚠️  
navigation: true
---

<p style="text-align:right;color:#cccs">
Generated Thu, 20 Jan 2022 20:01:21 GMT
</p>

<details style="margin-left: 3em" open="open">
<summary style="margin-left:-1em;border-bottom:solid 1px #333;font-size:200%;">Issues (48⛔164⚠️)</summary>

<details style="margin-left: 3em" open="open">
<summary style="margin-left:-1em;border-bottom:solid 1px #333;font-size:170%;"><a href="https://looker-open-source.github.io/look-at-me-sideways/rules.html#e2">E2</a>. Primary keys used (12⛔)</summary>

<table>
<thead><tr>
<th>Level</th>
<th>Location</th>
<th>Description</th>
</tr></thead>
<tbody>
<tr>
<td>⛔</td>
<td>model:dibya_snowlooker_case&#47;explore:inventory_items&#47;join:products </td>
<td>No PKs dimensions used for products in products join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:dibya_snowlooker_case&#47;explore:inventory_items&#47;join:distribution_centers </td>
<td>No PKs dimensions used for distribution_centers in distribution_centers join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:dibya_snowlooker_case&#47;explore:products&#47;join:distribution_centers </td>
<td>No PKs dimensions used for distribution_centers in distribution_centers join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:dibya_snowlooker_case&#47;explore:users&#47;join:order_items </td>
<td>No PKs dimensions used for users in order_items join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:dibya_snowlooker_case&#47;explore:users&#47;join:dt_user_order </td>
<td>No PKs dimensions used for dt_user_order in dt_user_order join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:dibya_snowlooker_case&#47;explore:users&#47;join:dt_user_order </td>
<td>No PKs dimensions used for users in dt_user_order join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:dibya_snowlooker_case&#47;explore:users&#47;join:dt_time_since_signup </td>
<td>No PKs dimensions used for dt_time_since_signup in dt_time_since_signup join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:dibya_snowlooker_case&#47;explore:users&#47;join:dt_time_since_signup </td>
<td>No PKs dimensions used for users in dt_time_since_signup join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:dibya_snowlooker_case&#47;explore:users&#47;join:events </td>
<td>No PKs dimensions used for events in events join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:dibya_snowlooker_case&#47;explore:users&#47;join:events </td>
<td>No PKs dimensions used for users in events join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:dibya_snowlooker_case&#47;explore:users&#47;join:order_items_fact </td>
<td>No PKs dimensions used for order_items_fact in order_items_fact join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:dibya_snowlooker_case&#47;explore:users&#47;join:order_items_fact </td>
<td>No PKs dimensions used for users in order_items_fact join</td>
</tr></tbody></table></details>
<details style="margin-left: 3em" open="open">
<summary style="margin-left:-1em;border-bottom:solid 1px #333;font-size:170%;"><a href="https://looker-open-source.github.io/look-at-me-sideways/rules.html#f1">F1</a>. No inter-view dependencies (3⛔)</summary>

<table>
<thead><tr>
<th>Level</th>
<th>Location</th>
<th>Description</th>
</tr></thead>
<tbody>
<tr>
<td>⛔</td>
<td>view:dt_top_ranking&#47;field:dynamic_measure </td>
<td>dynamic_measure references another view, if brand_rank_measure_selection,  via {% if brand_rank_measure_selection._parameter_value == 'order_items_count' %}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:dt_top_ranking&#47;field:dynamic_measure </td>
<td>dynamic_measure references another view, if brand_rank_measure_selection,  via {% if brand_rank_measure_selection._parameter_value == 'order_items_count' %}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:product_selected&#47;field:comparison </td>
<td>comparison references another view, products,  via ${products.name}</td>
</tr></tbody></table></details>
<details style="margin-left: 3em" open="open">
<summary style="margin-left:-1em;border-bottom:solid 1px #333;font-size:170%;"><a href="https://looker-open-source.github.io/look-at-me-sideways/rules.html#f2">F2</a>. No view-labeled fields (5⚠️)</summary>

<table>
<thead><tr>
<th>Level</th>
<th>Location</th>
<th>Description</th>
</tr></thead>
<tbody>
<tr>
<td>⚠️</td>
<td>view:dt_top_ranking&#47;field:brand_name_top_brands </td>
<td>view:dt_top_ranking/field:brand_name_top_brands contains a field-level view_label " TOTT | Top N Ranking"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_top_ranking&#47;field:brand_rank_top_brands </td>
<td>view:dt_top_ranking/field:brand_rank_top_brands contains a field-level view_label " TOTT | Top N Ranking"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_top_ranking&#47;field:dynamic_measure </td>
<td>view:dt_top_ranking/field:dynamic_measure contains a field-level view_label " TOTT | Top N Ranking"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_top_ranking&#47;field:undefined </td>
<td>view:dt_top_ranking/field:undefined contains a field-level view_label " TOTT | Top N Ranking"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_top_ranking&#47;field:undefined </td>
<td>view:dt_top_ranking/field:undefined contains a field-level view_label " TOTT | Top N Ranking"</td>
</tr></tbody></table></details>
<details style="margin-left: 3em" open="open">
<summary style="margin-left:-1em;border-bottom:solid 1px #333;font-size:170%;"><a href="https://looker-open-source.github.io/look-at-me-sideways/rules.html#f3">F3</a>. Count fields filtered (13⛔)</summary>

<table>
<thead><tr>
<th>Level</th>
<th>Location</th>
<th>Description</th>
</tr></thead>
<tbody>
<tr>
<td>⛔</td>
<td>view:average_calculation&#47;field:count </td>
<td>Type:count measure at view:average_calculation/field:count does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:average_calculation&#47;field:count123 </td>
<td>Type:count measure at view:average_calculation/field:count123 does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:distribution_centers&#47;field:count </td>
<td>Type:count measure at view:distribution_centers/field:count does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:dt_user_order&#47;field:count_of_users </td>
<td>Type:count measure at view:dt_user_order/field:count_of_users does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:etl_jobs&#47;field:count </td>
<td>Type:count measure at view:etl_jobs/field:count does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:events&#47;field:count </td>
<td>Type:count measure at view:events/field:count does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:inventory_items&#47;field:count </td>
<td>Type:count measure at view:inventory_items/field:count does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:order_items&#47;field:count_orders </td>
<td>Type:count measure at view:order_items/field:count_orders does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:order_items&#47;field:count </td>
<td>Type:count measure at view:order_items/field:count does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:products&#47;field:count </td>
<td>Type:count measure at view:products/field:count does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:user_order&#47;field:count </td>
<td>Type:count measure at view:user_order/field:count does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:users&#47;field:lifetime_items </td>
<td>Type:count measure at view:users/field:lifetime_items does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:users&#47;field:count </td>
<td>Type:count measure at view:users/field:count does not have a filter applied</td>
</tr></tbody></table></details>
<details style="margin-left: 3em" open="open">
<summary style="margin-left:-1em;border-bottom:solid 1px #333;font-size:170%;"><a href="https://looker-open-source.github.io/look-at-me-sideways/rules.html#f4">F4</a>. Description or hidden (159⚠️)</summary>

<table>
<thead><tr>
<th>Level</th>
<th>Location</th>
<th>Description</th>
</tr></thead>
<tbody>
<tr>
<td>⚠️</td>
<td>view:average_calculation&#47;field:order_items_user_id </td>
<td>view:average_calculation/field:order_items_user_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:average_calculation&#47;field:Order_Id </td>
<td>view:average_calculation/field:Order_Id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:average_calculation&#47;field:order_items_total_sales_price </td>
<td>view:average_calculation/field:order_items_total_sales_price is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:average_calculation&#47;field:count </td>
<td>view:average_calculation/field:count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:average_calculation&#47;field:total_lifetime_revenue </td>
<td>view:average_calculation/field:total_lifetime_revenue is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:average_calculation&#47;field:count_orders </td>
<td>view:average_calculation/field:count_orders is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:average_calculation&#47;field:average_lifetime_revenue </td>
<td>view:average_calculation/field:average_lifetime_revenue is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:average_calculation&#47;field:count123 </td>
<td>view:average_calculation/field:count123 is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:distribution_centers&#47;field:id </td>
<td>view:distribution_centers/field:id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:distribution_centers&#47;field:latitude </td>
<td>view:distribution_centers/field:latitude is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:distribution_centers&#47;field:longitude </td>
<td>view:distribution_centers/field:longitude is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:distribution_centers&#47;field:name </td>
<td>view:distribution_centers/field:name is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:distribution_centers&#47;field:count </td>
<td>view:distribution_centers/field:count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_order_date&#47;field:user_id </td>
<td>view:dt_order_date/field:user_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_order_date&#47;field:order_id </td>
<td>view:dt_order_date/field:order_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_order_date&#47;field:created_date </td>
<td>view:dt_order_date/field:created_date is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_order_date&#47;field:inventory_item_id </td>
<td>view:dt_order_date/field:inventory_item_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_order_date&#47;field:category </td>
<td>view:dt_order_date/field:category is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_order_date&#47;field:first_order_date </td>
<td>view:dt_order_date/field:first_order_date is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_order_date&#47;field:latest_order_date </td>
<td>view:dt_order_date/field:latest_order_date is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_order_date&#47;field:days_since_last_order </td>
<td>view:dt_order_date/field:days_since_last_order is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_order_date&#47;field:repeat_customer </td>
<td>view:dt_order_date/field:repeat_customer is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_order_sequence&#47;field:user_id </td>
<td>view:dt_order_sequence/field:user_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_order_sequence&#47;field:order_id </td>
<td>view:dt_order_sequence/field:order_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_order_sequence&#47;field:created_date </td>
<td>view:dt_order_sequence/field:created_date is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_order_sequence&#47;field:order_sequence_number </td>
<td>view:dt_order_sequence/field:order_sequence_number is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_order_sequence&#47;field:days_between_orders </td>
<td>view:dt_order_sequence/field:days_between_orders is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_order_sequence&#47;field:is_first_purchase </td>
<td>view:dt_order_sequence/field:is_first_purchase is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_order_sequence&#47;field:has_subsequent_purchase </td>
<td>view:dt_order_sequence/field:has_subsequent_purchase is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_order_sequence&#47;field:avg_days_between_orders </td>
<td>view:dt_order_sequence/field:avg_days_between_orders is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_time_since_signup&#47;field:days_since_signup </td>
<td>view:dt_time_since_signup/field:days_since_signup is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_time_since_signup&#47;field:months_since_signup </td>
<td>view:dt_time_since_signup/field:months_since_signup is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_time_since_signup&#47;field:id </td>
<td>view:dt_time_since_signup/field:id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_time_since_signup&#47;field:distinct_users </td>
<td>view:dt_time_since_signup/field:distinct_users is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_time_since_signup&#47;field:sum_days_since_signup </td>
<td>view:dt_time_since_signup/field:sum_days_since_signup is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_time_since_signup&#47;field:sum_months_since_signup </td>
<td>view:dt_time_since_signup/field:sum_months_since_signup is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_time_since_signup&#47;field:average_days_since_signup </td>
<td>view:dt_time_since_signup/field:average_days_since_signup is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_time_since_signup&#47;field:average_months_since_signup </td>
<td>view:dt_time_since_signup/field:average_months_since_signup is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_top_ranking&#47;field:brand_name_top_brands </td>
<td>view:dt_top_ranking/field:brand_name_top_brands is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_top_ranking&#47;field:brand_rank_top_brands </td>
<td>view:dt_top_ranking/field:brand_rank_top_brands is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_top_ranking&#47;field:dynamic_measure </td>
<td>view:dt_top_ranking/field:dynamic_measure is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_top_ranking&#47;field:top_rank_limit </td>
<td>view:dt_top_ranking/field:top_rank_limit is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_user_order&#47;field:order_count </td>
<td>view:dt_user_order/field:order_count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_user_order&#47;field:lifetime_orders_tiered </td>
<td>view:dt_user_order/field:lifetime_orders_tiered is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_user_order&#47;field:count_of_users </td>
<td>view:dt_user_order/field:count_of_users is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dt_user_order&#47;field:percent_of_total_users </td>
<td>view:dt_user_order/field:percent_of_total_users is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:etl_jobs&#47;field:id </td>
<td>view:etl_jobs/field:id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:etl_jobs&#47;field:count </td>
<td>view:etl_jobs/field:count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:id </td>
<td>view:events/field:id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:browser </td>
<td>view:events/field:browser is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:city </td>
<td>view:events/field:city is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:country </td>
<td>view:events/field:country is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:event_type </td>
<td>view:events/field:event_type is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:ip_address </td>
<td>view:events/field:ip_address is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:latitude </td>
<td>view:events/field:latitude is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:longitude </td>
<td>view:events/field:longitude is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:os </td>
<td>view:events/field:os is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:sequence_number </td>
<td>view:events/field:sequence_number is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:session_id </td>
<td>view:events/field:session_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:state </td>
<td>view:events/field:state is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:traffic_source </td>
<td>view:events/field:traffic_source is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:uri </td>
<td>view:events/field:uri is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:user_id </td>
<td>view:events/field:user_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:zip </td>
<td>view:events/field:zip is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:count </td>
<td>view:events/field:count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:id </td>
<td>view:inventory_items/field:id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:cost </td>
<td>view:inventory_items/field:cost is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:product_brand </td>
<td>view:inventory_items/field:product_brand is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:product_category </td>
<td>view:inventory_items/field:product_category is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:product_department </td>
<td>view:inventory_items/field:product_department is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:product_distribution_center_id </td>
<td>view:inventory_items/field:product_distribution_center_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:product_id </td>
<td>view:inventory_items/field:product_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:product_name </td>
<td>view:inventory_items/field:product_name is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:product_retail_price </td>
<td>view:inventory_items/field:product_retail_price is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:product_sku </td>
<td>view:inventory_items/field:product_sku is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:tax_amount </td>
<td>view:inventory_items/field:tax_amount is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:count_distinct_sku </td>
<td>view:inventory_items/field:count_distinct_sku is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:total_cost </td>
<td>view:inventory_items/field:total_cost is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:average_cost </td>
<td>view:inventory_items/field:average_cost is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:count </td>
<td>view:inventory_items/field:count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_fact&#47;field:lifetime_items </td>
<td>view:order_items_fact/field:lifetime_items is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_fact&#47;field:lifetime_orders </td>
<td>view:order_items_fact/field:lifetime_orders is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_fact&#47;field:lifetime_orders_tiered </td>
<td>view:order_items_fact/field:lifetime_orders_tiered is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_fact&#47;field:lifetime_revenue </td>
<td>view:order_items_fact/field:lifetime_revenue is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_fact&#47;field:lifetime_revenue_tiered </td>
<td>view:order_items_fact/field:lifetime_revenue_tiered is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:id </td>
<td>view:order_items/field:id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:long_shipping_time </td>
<td>view:order_items/field:long_shipping_time is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:inventory_item_id </td>
<td>view:order_items/field:inventory_item_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:order_id </td>
<td>view:order_items/field:order_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:sale_price </td>
<td>view:order_items/field:sale_price is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:status </td>
<td>view:order_items/field:status is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:user_id </td>
<td>view:order_items/field:user_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:count_orders </td>
<td>view:order_items/field:count_orders is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:count </td>
<td>view:order_items/field:count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:total_sales_price </td>
<td>view:order_items/field:total_sales_price is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:last_order_date </td>
<td>view:order_items/field:last_order_date is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:total_gross_revenue </td>
<td>view:order_items/field:total_gross_revenue is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:percent_of_total_revenue </td>
<td>view:order_items/field:percent_of_total_revenue is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:returned_items </td>
<td>view:order_items/field:returned_items is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:item_return_rate </td>
<td>view:order_items/field:item_return_rate is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:customers_who_have_returned_items </td>
<td>view:order_items/field:customers_who_have_returned_items is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:distinct_customers </td>
<td>view:order_items/field:distinct_customers is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:Percentage_of_users_with_returns </td>
<td>view:order_items/field:Percentage_of_users_with_returns is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:count_distinct_user </td>
<td>view:order_items/field:count_distinct_user is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:average_sale_price </td>
<td>view:order_items/field:average_sale_price is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:metric </td>
<td>view:order_items/field:metric is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:metric_selector </td>
<td>view:order_items/field:metric_selector is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:product_selected&#47;field:product_name </td>
<td>view:product_selected/field:product_name is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:product_selected&#47;field:product_brand </td>
<td>view:product_selected/field:product_brand is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:product_selected&#47;field:comparison </td>
<td>view:product_selected/field:comparison is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:id </td>
<td>view:products/field:id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:brand </td>
<td>view:products/field:brand is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:category </td>
<td>view:products/field:category is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:cost </td>
<td>view:products/field:cost is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:department </td>
<td>view:products/field:department is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:distribution_center_id </td>
<td>view:products/field:distribution_center_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:name </td>
<td>view:products/field:name is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:retail_price </td>
<td>view:products/field:retail_price is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:sku </td>
<td>view:products/field:sku is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:count </td>
<td>view:products/field:count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:brand_select </td>
<td>view:products/field:brand_select is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:total_gross_revenue&#47;field:total_gross_revenue </td>
<td>view:total_gross_revenue/field:total_gross_revenue is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order_inventory&#47;field:total_gross_margin_amount </td>
<td>view:user_order_inventory/field:total_gross_margin_amount is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order_inventory&#47;field:avg_sale_price </td>
<td>view:user_order_inventory/field:avg_sale_price is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order_inventory&#47;field:avg_spend_per_customer </td>
<td>view:user_order_inventory/field:avg_spend_per_customer is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order_inventory&#47;field:gross_margin_percent </td>
<td>view:user_order_inventory/field:gross_margin_percent is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order_inventory&#47;field:total_first_purchase_revenue </td>
<td>view:user_order_inventory/field:total_first_purchase_revenue is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order_inventory&#47;field:metric </td>
<td>view:user_order_inventory/field:metric is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order_inventory&#47;field:profit </td>
<td>view:user_order_inventory/field:profit is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order_inventory&#47;field:avg_profit </td>
<td>view:user_order_inventory/field:avg_profit is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order_inventory&#47;field:metric_selector </td>
<td>view:user_order_inventory/field:metric_selector is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order&#47;field:users_id </td>
<td>view:user_order/field:users_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order&#47;field:lifetime_items </td>
<td>view:user_order/field:lifetime_items is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order&#47;field:users_lifetime_orders </td>
<td>view:user_order/field:users_lifetime_orders is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order&#47;field:lifetime_orders_tiered </td>
<td>view:user_order/field:lifetime_orders_tiered is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order&#47;field:count </td>
<td>view:user_order/field:count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:id </td>
<td>view:users/field:id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:age </td>
<td>view:users/field:age is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:city </td>
<td>view:users/field:city is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:age_tier </td>
<td>view:users/field:age_tier is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:country </td>
<td>view:users/field:country is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:signup_date_tier </td>
<td>view:users/field:signup_date_tier is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:user_signup_last_month </td>
<td>view:users/field:user_signup_last_month is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:email </td>
<td>view:users/field:email is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:first_name </td>
<td>view:users/field:first_name is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:gender </td>
<td>view:users/field:gender is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:yesterday </td>
<td>view:users/field:yesterday is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:is_created_yesterday </td>
<td>view:users/field:is_created_yesterday is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:is_user_active </td>
<td>view:users/field:is_user_active is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:is_new_user </td>
<td>view:users/field:is_new_user is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:last_name </td>
<td>view:users/field:last_name is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:latitude </td>
<td>view:users/field:latitude is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:longitude </td>
<td>view:users/field:longitude is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:location </td>
<td>view:users/field:location is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:state </td>
<td>view:users/field:state is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:traffic_source </td>
<td>view:users/field:traffic_source is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:zip </td>
<td>view:users/field:zip is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:lifetime_items </td>
<td>view:users/field:lifetime_items is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:count </td>
<td>view:users/field:count is missing a description</td>
</tr></tbody></table></details>
<details style="margin-left: 3em" open="open">
<summary style="margin-left:-1em;border-bottom:solid 1px #333;font-size:170%;"><a href="https://looker-open-source.github.io/look-at-me-sideways/rules.html#k1">K1</a>. Primary keys required (17⛔)</summary>

<table>
<thead><tr>
<th>Level</th>
<th>Location</th>
<th>Description</th>
</tr></thead>
<tbody>
<tr>
<td>⛔</td>
<td>view: average_calculation </td>
<td>No Primary Key Dimensions found in average_calculation</td>
</tr>
<tr>
<td>⛔</td>
<td>view: distribution_centers </td>
<td>No Primary Key Dimensions found in distribution_centers</td>
</tr>
<tr>
<td>⛔</td>
<td>view: dt_order_date </td>
<td>No Primary Key Dimensions found in dt_order_date</td>
</tr>
<tr>
<td>⛔</td>
<td>view: dt_order_sequence </td>
<td>No Primary Key Dimensions found in dt_order_sequence</td>
</tr>
<tr>
<td>⛔</td>
<td>view: dt_time_since_signup </td>
<td>No Primary Key Dimensions found in dt_time_since_signup</td>
</tr>
<tr>
<td>⛔</td>
<td>view: dt_top_ranking </td>
<td>No Primary Key Dimensions found in dt_top_ranking</td>
</tr>
<tr>
<td>⛔</td>
<td>view: dt_user_order </td>
<td>No Primary Key Dimensions found in dt_user_order</td>
</tr>
<tr>
<td>⛔</td>
<td>view: etl_jobs </td>
<td>No Primary Key Dimensions found in etl_jobs</td>
</tr>
<tr>
<td>⛔</td>
<td>view: events </td>
<td>No Primary Key Dimensions found in events</td>
</tr>
<tr>
<td>⛔</td>
<td>view: inventory_items </td>
<td>No Primary Key Dimensions found in inventory_items</td>
</tr>
<tr>
<td>⛔</td>
<td>view: order_items_fact </td>
<td>No Primary Key Dimensions found in order_items_fact</td>
</tr>
<tr>
<td>⛔</td>
<td>view: order_items </td>
<td>No Primary Key Dimensions found in order_items</td>
</tr>
<tr>
<td>⛔</td>
<td>view: product_selected </td>
<td>No Primary Key Dimensions found in product_selected</td>
</tr>
<tr>
<td>⛔</td>
<td>view: products </td>
<td>No Primary Key Dimensions found in products</td>
</tr>
<tr>
<td>⛔</td>
<td>view: total_gross_revenue </td>
<td>No Primary Key Dimensions found in total_gross_revenue</td>
</tr>
<tr>
<td>⛔</td>
<td>view: user_order </td>
<td>No Primary Key Dimensions found in user_order</td>
</tr>
<tr>
<td>⛔</td>
<td>view: users </td>
<td>No Primary Key Dimensions found in users</td>
</tr></tbody></table></details>
<details style="margin-left: 3em" open="open">
<summary style="margin-left:-1em;border-bottom:solid 1px #333;font-size:170%;"><a href="https://looker-open-source.github.io/look-at-me-sideways/rules.html#t2">T2</a>. Primary keys required (3⛔)</summary>

<table>
<thead><tr>
<th>Level</th>
<th>Location</th>
<th>Description</th>
</tr></thead>
<tbody>
<tr>
<td>⛔</td>
<td>view: average_calculation </td>
<td>No Primary Key columns/selectAliases found in average_calculation</td>
</tr>
<tr>
<td>⛔</td>
<td>view: order_items_fact </td>
<td>No Primary Key columns/selectAliases found in order_items_fact</td>
</tr>
<tr>
<td>⛔</td>
<td>view: user_order </td>
<td>No Primary Key columns/selectAliases found in user_order</td>
</tr></tbody></table></details></details>

---

### Icon Key
<table>
<thead><tr>
<th></th>
<th>non-exempted</th>
<th>exempted</th>
</tr></thead>
<tbody>
<tr>
<td>Error</td>
<td>⛔</td>
<td>🙈</td>
</tr>
<tr>
<td>Warning</td>
<td>⚠️</td>
<td>🚧</td>
</tr>
</tbody>
</table>


