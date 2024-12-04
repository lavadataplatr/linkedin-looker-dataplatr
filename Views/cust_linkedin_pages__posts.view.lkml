view: cust_linkedin_pages__posts {
  sql_table_name: `dataplatr-sandbox.linkedin_company_pages_linkedin_pages.Cust_linkedin_pages__posts` ;;

  dimension: _share_entity_urn {
    type: string
    sql: ${TABLE}._share_entity_urn ;;
  }
  dimension: click_count {
    type: number
    sql: ${TABLE}.click_count ;;
  }
  dimension: comment_count {
    type: number
    sql: ${TABLE}.comment_count ;;
  }
  dimension: commentary {
    type: string
    sql: ${TABLE}.commentary ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_time ;;
  }
  dimension: engagement {
    type: number
    sql: ${TABLE}.engagement ;;
  }
  dimension: impression_count {
    type: number
    sql: ${TABLE}.impression_count ;;
  }
  dimension: like_count {
    type: number
    sql: ${TABLE}.like_count ;;
  }
  dimension: post_id {
    type: string
    sql: ${TABLE}.Post_Id ;;
  }
  dimension: share_count {
    type: number
    sql: ${TABLE}.share_count ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }



  filter: date_range {
    type: date
    sql: ${TABLE}.Created_Date ;;
    suggestions: ["Last 7 days", "Last 15 days", "Last 30 days", "Last 90 days", "Last 12 months", "Custom"]
  }


#****************************** Measures *******************#

  measure: total_click_count {
    label: "Total Clicks"
    type: sum
    sql: ${click_count} ;;
    description: "Total number of clicks"
  }

  measure: total_comment_count {
    type: sum
    description: "Total number of comments"
    label: "Total Comments"
    sql: ${comment_count} ;;
  }

  measure: total_impression_count {
    type: sum
    description: "Total number of impressions."
    label: "Total Impressions Count"
    sql: ${impression_count} ;;
  }

  measure: total_like_count {
    type: sum
    sql: ${like_count} ;;
    description: "Total number of likes."
    label: "Reactions"
  }

  measure: total_share_count {
    type: sum
    description: "Total number of shares."
    label: "Repost"
    sql: ${share_count} ;;
  }

  measure: average_click_rate {
    label: "CTR"
    description: "Percent of people that click on an ad."
    type: number
    sql: ${total_click_count}*1.0/nullif(${total_impression_count},0) ;;
    value_format_name: percent_2
  }

  measure: engagement_rate {
    label: "Engagement Rate"
    description: "Measures user engagement as a percentage of impressions."
    type: number
    sql: (${total_click_count} + ${total_like_count} + ${total_comment_count} + ${total_share_count})  / NULLIF(${total_impression_count}, 0) ;;
    value_format_name: percent_2 # Formats as a percentage with two decimal places
  }

  parameter: measure_select_dynamic_metric {
    default_value: "Impressions"
    allowed_value: {label: "Impressions" value: "Impressions"}
    allowed_value: {label: "Members Reached" value:"Members Reached"}
    allowed_value: {label: "Clicks" value:"Clicks"}
    allowed_value: {label: "Reactions" value:"Reactions"}
    allowed_value: {label: "Comments" value:"Comments"}
    allowed_value: {label: "Reposts" value:"Reposts"}
    allowed_value: {label: "Engagement Rate" value:"Engagement Rate"}
    group_label: "Filter Fields"
    label: "Metrics"
    hidden: no
  }

  measure: dynamic_overview_metric {
    type: number

    sql: case
          when {% parameter measure_select_dynamic_metric %} = 'Impressions' then ${total_impression_count}
          when {% parameter measure_select_dynamic_metric %} = 'Clicks' then ${total_click_count}
          when {% parameter measure_select_dynamic_metric %} = 'Reactions' then ${total_like_count}
          when {% parameter measure_select_dynamic_metric %} = 'Comments' then ${total_comment_count}
          when {% parameter measure_select_dynamic_metric %} = 'Reposts' then ${total_share_count}
          when {% parameter measure_select_dynamic_metric %} = 'Engagement Rate' then ${engagement_rate}
    end;;
    label: "Dynamic Overview Metric"
    view_label: "Calculated Metrics"
    description: "Dynamic Overview Metric measure created for Impressions,Clicks,Reactions,Comments,Reposts,Engagement Rate"
    value_format_name: decimal_0
    hidden: no
  }

  #measure: previous_day_metric {
    #type: number
    #sql: OFFSET(${dynamic_overview_metric}, 1);;
    #label: "Previous Day Metric"
    #view_label: "Calculated Metrics"
    #description: "Dynamic previous day value based on the selected metric"
    #value_format_name: decimal_0
    #hidden: no
  #}

  #measure: percent_change_metric {
   # type: number
    #sql: CASE
        # WHEN ${previous_day_metric} != 0 THEN
          # (${dynamic_overview_metric} - ${previous_day_metric}) / ${previous_day_metric}
         #ELSE NULL
       #END;;
    #label: "Percent Change Metric"
    #view_label: "Calculated Metrics"
    #description: "Dynamic percent change based on the selected metric"
    #value_format_name: percent_2  # Formats as a percentage with 2 decimal places
    #hidden: no
  #}





  measure: count {
    type: count
    drill_fields: [created_time]
  }
}
