view: int_linkedin_pages__latest_post_history {
  sql_table_name: `dataplatr-sandbox.linkedin_company_pages_linkedin_pages.int_linkedin_pages__latest_post_history` ;;

  dimension_group: _fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._fivetran_synced ;;
  }
  dimension: commentary {
    type: string
    sql: ${TABLE}.commentary ;;
  }
  dimension: created_actor {
    type: string
    sql: ${TABLE}.created_actor ;;
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
  dimension: is_most_recent_record {
    type: yesno
    sql: ${TABLE}.is_most_recent_record ;;
  }
  dimension: last_modified_actor {
    type: string
    sql: ${TABLE}.last_modified_actor ;;
  }
  dimension_group: last_modified_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_modified_timestamp ;;
  }
  dimension: lifecycle_state {
    type: string
    sql: ${TABLE}.lifecycle_state ;;
  }
  dimension: post_author {
    type: string
    sql: ${TABLE}.post_author ;;
  }
  dimension: post_url {
    type: string
    sql: ${TABLE}.post_url ;;
  }
  dimension: source_relation {
    type: string
    sql: ${TABLE}.source_relation ;;
  }
  dimension: ugc_post_id {
    type: string
    sql: ${TABLE}.ugc_post_id ;;
  }
  dimension: ugc_post_urn {
    type: string
    sql: ${TABLE}.ugc_post_urn ;;
  }
  dimension: visibility {
    type: string
    sql: ${TABLE}.visibility ;;
  }
  measure: count {
    type: count
  }
}
