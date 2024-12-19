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


#*******************************   Measures *******************************#



  measure: total_page_views {
    type: sum
    sql: ${all_page_views} ;;
    label: "Page Views"
    hidden: no
  }

  measure: total_unique_page_views{
    type: sum
    sql: ${all_unique_page_views} ;;
    label: "Unique Page Views"
    hidden: no
  }

  measure: total_desktop_page_views {
    type: sum
    sql: ${all_desktop_page_views} ;;
    label: "Desktop Page Views"
    hidden: no
  }

  measure: total_mobile_page_views {
    type: sum
    sql: ${all_mobile_page_views} ;;
    label: "Mobile Page Views"
    hidden: no
  }

 measure: total_desktop_unique_page_views {
    type: sum
    sql: ${all_desktop_unique_page_views} ;;
    label: "Total Desktop Unique Page Views"
  }

 measure: total_mobile_unique_page_views {
    type: sum
    sql: ${all_mobile_unique_page_views} ;;
    label: "Total Mobile Unique Page Views"
  }



  # measure: desktop_usage_percentage {
  #   type: number
  #   sql: (${desktop_visitors} / ${all_page_views}) * 100 ;;
  #   value_format_name: percent_2
  #   label: "Percentage of Device Usage"
  #   hidden: no
  # }

##############  About Measures ######################

  measure: total_about_page_views {
    type: sum
    sql: ${about_page_views} ;;
    label: "Total About Page Views"
  }

  measure: total_about_unique_page_views {
    type: sum
    sql: ${about_unique_page_views} ;;
    label: "Total About Unique Page Views"
  }

  measure: total_desktop_about_page_views {
    type: sum
    sql: ${desktop_about_page_views} ;;
    label: "Total Desktop About Page Views"
  }

  measure: total_desktop_about_unique_page_views {
    type: sum
    sql: ${desktop_about_unique_page_views} ;;
    label: "Total Desktop About Unique Page Views"
  }

  measure: total_mobile_about_page_views{
    type: sum
    sql: $(${mobile_about_page_views};;
    label: "Total Mobile About Page Views"
  }

  measure: total_mobile_about_unique_page_views{
    type: sum
    sql: $(${mobile_about_unique_page_views};;
    label: "Total Mobile About Unique Page Views"
  }


#********************* Insights Measures  **********************#

  measure: total_desktop_insights_page_views {
    type: sum
    sql: ${desktop_insights_page_views} ;;
    label: "Total Desktop Insights Page Views"
  }

  measure: total_desktop_insights_unique_page_views {
    type: sum
    sql: ${desktop_insights_unique_page_views} ;;
    label: "Total Desktop Insights Unique Page Views"
  }

  measure: total_insights_page_views {
    type: sum
    sql: ${insights_page_views} ;;
    label: "Total Insights Page Views"
  }

  measure: total_insights_unique_page_views {
    type: sum
    sql: ${insights_unique_page_views} ;;
    label: "Total Insights Unique Page Views"
  }

  measure: total_mobile_insights_page_views {
    type: sum
    sql: ${mobile_insights_page_views} ;;
    label: "Total Mobile Insights Page Views"
  }

  measure: total_mobile_insights_unique_page_views {
    type: sum
    sql: ${mobile_insights_unique_page_views} ;;
    label: "Total Mobile Insights Unique Page Views"
  }

#**************************** People Measures  *******************#

  measure: total_desktop_people_page_views {
    type: sum
    sql: ${desktop_people_page_views} ;;
    label: "Total Desktop People Page Views"
  }

  measure: total_desktop_people_unique_page_views {
    type: sum
    sql: ${desktop_people_unique_page_views} ;;
    label: "Total Desktop People Unique Page Views"
  }

  measure: total_mobile_people_page_views {
    type: sum
    sql: ${mobile_people_page_views} ;;
    label: "Total Mobile People Page Views"
  }

  measure: total_mobile_people_unique_page_views {
    type: sum
    sql: ${mobile_people_unique_page_views} ;;
    label: "Total Mobile People Unique Page Views"
  }

  measure: total_people_page_views {
    type: sum
    sql: ${people_page_views} ;;
    label: "Total People Page Views"
  }

  measure: total_people_unique_page_views {
    type: sum
    sql: ${people_unique_page_views} ;;
    label: "Total People Unique Page Views"
  }


  measure: careers_banner_promo_clicks {
    type: sum
    sql: ${careers_page_banner_promo_clicks} ;;
  }

  measure: careers_jobs_clicks {
    type: sum
    sql: ${careers_page_jobs_clicks} ;;
  }

  measure: careers_promo_links_clicks {
    type: sum
    sql: ${careers_page_promo_links_clicks} ;;
  }

  measure: total_careers_page_views {
    type: sum
    sql: ${careers_page_views} ;;
  }

  measure: total_careers_unique_page_views {
    type: sum
    sql: ${careers_unique_page_views} ;;
  }



  measure: mobile_careers_jobs_clicks {
    type: sum
    sql: ${mobile_careers_page_jobs_clicks} ;;
  }





#**************** Dynamic measures ***************#

# Parameter for dynamic metric selection
# Parameter to select metric type

  parameter: metric_type {
    default_value: "Page Views"
    allowed_value: {label: "Page Views" value: "Page Views"}
    allowed_value: {label: "Unique Visitors" value: "Unique Visitors"}
    label: "Select Metric Type"
  }

# Parameter to select page type
  parameter: page_type {
    default_value: "All Pages"
    allowed_value: {label: "All Pages" value: "All Pages"}
    allowed_value: {label: "Home" value: "Home"}
    allowed_value: {label: "About" value: "About"}
    allowed_value: {label: "Insights" value: "Insights"}
    allowed_value: {label: "People" value: "People"}
    label: "Select Page Type"
  }

# Measure for dynamic desktop page views
  measure: dynamic_desktop_page_views {
    type: number
    sql:
    CASE
      WHEN {% parameter metric_type %} = 'Page Views' AND {% parameter page_type %} = 'All Pages' THEN ${total_desktop_page_views}
      WHEN {% parameter metric_type %} = 'Page Views' AND {% parameter page_type %} = 'About' THEN ${total_desktop_about_page_views}
      WHEN {% parameter metric_type %} = 'Page Views' AND {% parameter page_type %} = 'Insights' THEN ${total_desktop_insights_page_views}
      WHEN {% parameter metric_type %} = 'Page Views' AND {% parameter page_type %} = 'People' THEN ${total_desktop_people_page_views}
      WHEN {% parameter metric_type %} = 'Unique Visitors' AND {% parameter page_type %} = 'All Pages' THEN ${total_desktop_unique_page_views}
      WHEN {% parameter metric_type %} = 'Unique Visitors' AND {% parameter page_type %} = 'About' THEN ${total_desktop_about_unique_page_views}
      WHEN {% parameter metric_type %} = 'Unique Visitors' AND {% parameter page_type %} = 'Insights' THEN ${total_desktop_insights_unique_page_views}
      WHEN {% parameter metric_type %} = 'Unique Visitors' AND {% parameter page_type %} = 'People' THEN ${total_desktop_people_unique_page_views}
      ELSE 0
    END ;;
    label: "Dynamic Desktop Page Views"
    description: "Calculated metric for dynamic desktop page views based on selected metric type and page type."
  }

# Measure for dynamic mobile page views
  measure: dynamic_mobile_page_views {
    type: number
    sql:
    CASE
      WHEN {% parameter metric_type %} = 'Page Views' AND {% parameter page_type %} = 'All Pages' THEN ${total_mobile_page_views}
      WHEN {% parameter metric_type %} = 'Page Views' AND {% parameter page_type %} = 'About' THEN ${total_mobile_about_page_views}
      WHEN {% parameter metric_type %} = 'Page Views' AND {% parameter page_type %} = 'Insights' THEN ${total_mobile_insights_page_views}
      WHEN {% parameter metric_type %} = 'Page Views' AND {% parameter page_type %} = 'People' THEN ${total_mobile_people_page_views}
      WHEN {% parameter metric_type %} = 'Unique Visitors' AND {% parameter page_type %} = 'All Pages' THEN ${total_mobile_unique_page_views}
      WHEN {% parameter metric_type %} = 'Unique Visitors' AND {% parameter page_type %} = 'About' THEN ${total_mobile_about_unique_page_views}
      WHEN {% parameter metric_type %} = 'Unique Visitors' AND {% parameter page_type %} = 'Insights' THEN ${total_mobile_insights_unique_page_views}
      WHEN {% parameter metric_type %} = 'Unique Visitors' AND {% parameter page_type %} = 'People' THEN ${total_mobile_people_unique_page_views}
      ELSE 0
    END ;;
    label: "Dynamic Mobile Page Views"
    description: "Calculated metric for dynamic mobile page views based on selected metric type and page type."
  }






  measure: count {
    type: count
  }
}
