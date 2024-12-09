view: time_bound_follower_statistic {
  sql_table_name: `dataplatr-sandbox.linkedin_company_pages.time_bound_follower_statistic` ;;

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}._fivetran_id ;;
  }
  dimension_group: _fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._fivetran_synced ;;
  }
  dimension_group: day {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.day ;;
  }
  dimension: follower_gains_organic_follower_gain {
    type: number
    sql: ${TABLE}.follower_gains_organic_follower_gain ;;
  }
  dimension: follower_gains_paid_follower_gain {
    type: number
    sql: ${TABLE}.follower_gains_paid_follower_gain ;;
  }
  dimension: organization_entity {
    type: string
    sql: ${TABLE}.organization_entity ;;
  }
  measure: count {
    type: count
  }
}
