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



  measure: count {
    type: count
    drill_fields: [created_time]
  }
}
