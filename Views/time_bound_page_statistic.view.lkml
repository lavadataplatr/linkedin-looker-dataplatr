view: time_bound_page_statistic {
  sql_table_name: `dataplatr-sandbox.linkedin_company_pages.time_bound_page_statistic` ;;

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}._fivetran_id ;;
  }
  dimension_group: _fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._fivetran_synced ;;
  }
  dimension: about_page_views {
    type: number
    sql: ${TABLE}.about_page_views ;;
  }
  dimension: about_unique_page_views {
    type: number
    sql: ${TABLE}.about_unique_page_views ;;
  }
  dimension: all_desktop_page_views {
    type: number
    sql: ${TABLE}.all_desktop_page_views ;;
  }
  dimension: all_desktop_unique_page_views {
    type: number
    sql: ${TABLE}.all_desktop_unique_page_views ;;
  }
  dimension: all_mobile_page_views {
    type: number
    sql: ${TABLE}.all_mobile_page_views ;;
  }
  dimension: all_mobile_unique_page_views {
    type: number
    sql: ${TABLE}.all_mobile_unique_page_views ;;
  }
  dimension: all_page_views {
    type: number
    sql: ${TABLE}.all_page_views ;;
  }
  dimension: all_unique_page_views {
    type: number
    sql: ${TABLE}.all_unique_page_views ;;
  }
  dimension: careers_page_banner_promo_clicks {
    type: number
    sql: ${TABLE}.careers_page_banner_promo_clicks ;;
  }
  dimension: careers_page_employees_clicks {
    type: number
    sql: ${TABLE}.careers_page_employees_clicks ;;
  }
  dimension: careers_page_jobs_clicks {
    type: number
    sql: ${TABLE}.careers_page_jobs_clicks ;;
  }
  dimension: careers_page_promo_links_clicks {
    type: number
    sql: ${TABLE}.careers_page_promo_links_clicks ;;
  }
  dimension: careers_page_views {
    type: number
    sql: ${TABLE}.careers_page_views ;;
  }
  dimension: careers_unique_page_views {
    type: number
    sql: ${TABLE}.careers_unique_page_views ;;
  }
  dimension_group: day {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.day ;;
  }
  dimension: desktop_about_page_views {
    type: number
    sql: ${TABLE}.desktop_about_page_views ;;
  }
  dimension: desktop_about_unique_page_views {
    type: number
    sql: ${TABLE}.desktop_about_unique_page_views ;;
  }
  dimension: desktop_careers_page_views {
    type: number
    sql: ${TABLE}.desktop_careers_page_views ;;
  }
  dimension: desktop_careers_unique_page_views {
    type: number
    sql: ${TABLE}.desktop_careers_unique_page_views ;;
  }
  dimension: desktop_insights_page_views {
    type: number
    sql: ${TABLE}.desktop_insights_page_views ;;
  }
  dimension: desktop_insights_unique_page_views {
    type: number
    sql: ${TABLE}.desktop_insights_unique_page_views ;;
  }
  dimension: desktop_jobs_page_views {
    type: number
    sql: ${TABLE}.desktop_jobs_page_views ;;
  }
  dimension: desktop_jobs_unique_page_views {
    type: number
    sql: ${TABLE}.desktop_jobs_unique_page_views ;;
  }
  dimension: desktop_life_at_page_views {
    type: number
    sql: ${TABLE}.desktop_life_at_page_views ;;
  }
  dimension: desktop_life_at_unique_page_views {
    type: number
    sql: ${TABLE}.desktop_life_at_unique_page_views ;;
  }
  dimension: desktop_overview_page_views {
    type: number
    sql: ${TABLE}.desktop_overview_page_views ;;
  }
  dimension: desktop_overview_unique_page_views {
    type: number
    sql: ${TABLE}.desktop_overview_unique_page_views ;;
  }
  dimension: desktop_people_page_views {
    type: number
    sql: ${TABLE}.desktop_people_page_views ;;
  }
  dimension: desktop_people_unique_page_views {
    type: number
    sql: ${TABLE}.desktop_people_unique_page_views ;;
  }
  dimension: desktop_products_page_views {
    type: number
    sql: ${TABLE}.desktop_products_page_views ;;
  }
  dimension: desktop_products_unique_page_views {
    type: number
    sql: ${TABLE}.desktop_products_unique_page_views ;;
  }
  dimension: insights_page_views {
    type: number
    sql: ${TABLE}.insights_page_views ;;
  }
  dimension: insights_unique_page_views {
    type: number
    sql: ${TABLE}.insights_unique_page_views ;;
  }
  dimension: jobs_page_views {
    type: number
    sql: ${TABLE}.jobs_page_views ;;
  }
  dimension: jobs_unique_page_views {
    type: number
    sql: ${TABLE}.jobs_unique_page_views ;;
  }
  dimension: life_at_page_views {
    type: number
    sql: ${TABLE}.life_at_page_views ;;
  }
  dimension: life_at_unique_page_views {
    type: number
    sql: ${TABLE}.life_at_unique_page_views ;;
  }
  dimension: mobile_about_page_views {
    type: number
    sql: ${TABLE}.mobile_about_page_views ;;
  }
  dimension: mobile_about_unique_page_views {
    type: number
    sql: ${TABLE}.mobile_about_unique_page_views ;;
  }
  dimension: mobile_careers_page_employees_clicks {
    type: number
    sql: ${TABLE}.mobile_careers_page_employees_clicks ;;
  }
  dimension: mobile_careers_page_jobs_clicks {
    type: number
    sql: ${TABLE}.mobile_careers_page_jobs_clicks ;;
  }
  dimension: mobile_careers_page_promo_links_clicks {
    type: number
    sql: ${TABLE}.mobile_careers_page_promo_links_clicks ;;
  }
  dimension: mobile_careers_page_views {
    type: number
    sql: ${TABLE}.mobile_careers_page_views ;;
  }
  dimension: mobile_careers_unique_page_views {
    type: number
    sql: ${TABLE}.mobile_careers_unique_page_views ;;
  }
  dimension: mobile_insights_page_views {
    type: number
    sql: ${TABLE}.mobile_insights_page_views ;;
  }
  dimension: mobile_insights_unique_page_views {
    type: number
    sql: ${TABLE}.mobile_insights_unique_page_views ;;
  }
  dimension: mobile_jobs_page_views {
    type: number
    sql: ${TABLE}.mobile_jobs_page_views ;;
  }
  dimension: mobile_jobs_unique_page_views {
    type: number
    sql: ${TABLE}.mobile_jobs_unique_page_views ;;
  }
  dimension: mobile_life_at_page_views {
    type: number
    sql: ${TABLE}.mobile_life_at_page_views ;;
  }
  dimension: mobile_life_at_unique_page_views {
    type: number
    sql: ${TABLE}.mobile_life_at_unique_page_views ;;
  }
  dimension: mobile_overview_page_views {
    type: number
    sql: ${TABLE}.mobile_overview_page_views ;;
  }
  dimension: mobile_overview_unique_page_views {
    type: number
    sql: ${TABLE}.mobile_overview_unique_page_views ;;
  }
  dimension: mobile_people_page_views {
    type: number
    sql: ${TABLE}.mobile_people_page_views ;;
  }
  dimension: mobile_people_unique_page_views {
    type: number
    sql: ${TABLE}.mobile_people_unique_page_views ;;
  }
  dimension: mobile_products_page_views {
    type: number
    sql: ${TABLE}.mobile_products_page_views ;;
  }
  dimension: mobile_products_unique_page_views {
    type: number
    sql: ${TABLE}.mobile_products_unique_page_views ;;
  }
  dimension: organization_entity {
    type: string
    sql: ${TABLE}.organization_entity ;;
  }
  dimension: overview_page_views {
    type: number
    sql: ${TABLE}.overview_page_views ;;
  }
  dimension: overview_unique_page_views {
    type: number
    sql: ${TABLE}.overview_unique_page_views ;;
  }
  dimension: people_page_views {
    type: number
    sql: ${TABLE}.people_page_views ;;
  }
  dimension: people_unique_page_views {
    type: number
    sql: ${TABLE}.people_unique_page_views ;;
  }
  dimension: products_page_views {
    type: number
    sql: ${TABLE}.products_page_views ;;
  }
  dimension: products_unique_page_views {
    type: number
    sql: ${TABLE}.products_unique_page_views ;;
  }
  measure: count {
    type: count
  }
}
