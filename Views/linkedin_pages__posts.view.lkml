view: linkedin_pages__posts {
  sql_table_name: `dataplatr-sandbox.linkedin_company_pages_linkedin_pages.linkedin_pages__posts` ;;

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
  dimension_group: created_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_timestamp ;;
  }
  dimension_group: first_published_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.first_published_timestamp ;;
  }

  dimension: impression_count {
    type: number
    sql: ${TABLE}.impression_count ;;
  }
  dimension: lifecycle_state {
    type: string
    sql: ${TABLE}.lifecycle_state ;;
  }
  dimension: like_count {
    type: number
    sql: ${TABLE}.like_count ;;
  }
  dimension: organization_id {
    type: number
    sql: ${TABLE}.organization_id ;;
  }
  dimension: organization_name {
    type: string
    sql: ${TABLE}.organization_name ;;
  }
  dimension: post_author {
    type: string
    sql: ${TABLE}.post_author ;;
  }
  dimension: post_title {
    type: string
    sql: ${TABLE}.post_title ;;
  }
  dimension: post_type {
    type: string
    sql: ${TABLE}.post_type ;;
  }
  dimension: post_url {
    type: string
    sql: ${TABLE}.post_url ;;
  }
  dimension: share_count {
    type: number
    sql: ${TABLE}.share_count ;;
  }
  dimension: source_relation {
    type: string
    sql: ${TABLE}.source_relation ;;
  }
  dimension: ugc_post_id {
    type: string
    sql: ${TABLE}.ugc_post_id ;;
  }
  measure: count {
    type: count
    drill_fields: [organization_name]
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
    label: "Total Likes"
  }

  measure: distinct_organization_name {
    type: count_distinct
    sql: ${organization_name} ;;
    description: "Distinct count of organizations"
    label: "Total Organizations"
  }

  measure: total_share_count {
    type: sum
    description: "Total number of shares."
    label: "Total Share Count"
    sql: ${share_count} ;;
  }










}
