view: int_linkedin_pages__latest_post {
  sql_table_name: `dataplatr-sandbox.linkedin_company_pages_linkedin_pages.int_linkedin_pages__latest_post` ;;

  dimension_group: _fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._fivetran_synced ;;
  }
  dimension: is_most_recent_record {
    type: yesno
    sql: ${TABLE}.is_most_recent_record ;;
  }
  dimension: share_statistic_id {
    type: string
    sql: ${TABLE}.share_statistic_id ;;
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
  }
}
