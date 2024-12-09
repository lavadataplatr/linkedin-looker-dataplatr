view: time_bound_share_statistic {
  sql_table_name: `dataplatr-sandbox.linkedin_company_pages.time_bound_share_statistic` ;;

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}._fivetran_id ;;
  }
  dimension_group: _fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._fivetran_synced ;;
  }
  dimension: click_count {
    type: number
    sql: ${TABLE}.click_count ;;
  }
  dimension: comment_count {
    type: number
    sql: ${TABLE}.comment_count ;;
  }
  dimension: comment_mentions_count {
    type: number
    sql: ${TABLE}.comment_mentions_count ;;
  }
  dimension_group: day {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.day ;;
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
  dimension: organization_entity {
    type: string
    sql: ${TABLE}.organization_entity ;;
  }
  dimension: share_count {
    type: number
    sql: ${TABLE}.share_count ;;
  }
  dimension: share_mentions_count {
    type: number
    sql: ${TABLE}.share_mentions_count ;;
  }
  dimension: unique_impressions_count {
    type: number
    sql: ${TABLE}.unique_impressions_count ;;
  }

#****************************** Measures *******************#

  measure: total_click_count {
    label: "Total Clicks"
    type: sum
    sql: ${click_count} ;;
    description: "Total number of clicks"
  }

  measure: total_unique_impressions_count {
    type: sum
    label: "Members Reached"
    sql: ${unique_impressions_count} ;;

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


#********************************Dynamic measures **************************#

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
           when {% parameter measure_select_dynamic_metric %} = 'Members Reached' then ${total_unique_impressions_count}
          when {% parameter measure_select_dynamic_metric %} = 'Clicks' then ${total_click_count}
          when {% parameter measure_select_dynamic_metric %} = 'Reactions' then ${total_like_count}
          when {% parameter measure_select_dynamic_metric %} = 'Comments' then ${total_comment_count}
          when {% parameter measure_select_dynamic_metric %} = 'Reposts' then ${total_share_count}
          when {% parameter measure_select_dynamic_metric %} = 'Engagement Rate' then ${engagement_rate}
    end;;
    label: "Dynamic Overview Metric"
    view_label: "Calculated Metrics"
    description: "Dynamic Overview Metric measure created for Impressions,Members Reached,Clicks,Reactions,Comments,Reposts,Engagement Rate"
    value_format_name: decimal_0
    hidden: no
  }

  dimension: current_month {
    type: number
    sql: CASE
        WHEN EXTRACT(MONTH FROM ${day_date}) = EXTRACT(MONTH FROM CURRENT_DATE()) THEN 1
        WHEN EXTRACT(MONTH FROM ${day_date}) = EXTRACT(MONTH FROM DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)) THEN 2
        ELSE 0
      END ;;
    label: "Current Month Flag"
  }

  measure: total_impressions_current_month {
    label: "Total Impressions - Current Month"
    type: sum
    sql: ${impression_count} ;;
    filters: [current_month: "1"]
  }

  measure: total_impressions_previous_month {
    label: "Total Impressions - Previous Month"
    type: sum
    sql: ${impression_count} ;;
    filters: [current_month: "2"]
  }

  measure: mom_variance {
    label: "MoM Variance (Absolute)"
    type: number
    sql: ${total_impressions_current_month} - ${total_impressions_previous_month} ;;
  }

  measure: mom_variance_percentage {
    label: "MoM Variance (%)"
    type: number
    sql: (${total_impressions_current_month} - ${total_impressions_previous_month}) / NULLIF(${total_impressions_previous_month}, 0) ;;
    value_format_name: percent_2
  }




#################################################################################################


  dimension: prev_day_date {
    type: date
    sql: DATE_SUB(${day_date}, INTERVAL 1 DAY) ;;
  }


  dimension_group: prev_day_group {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: DATE_SUB(${day_raw}, INTERVAL 1 DAY) ;;
  }

  measure: last_day_date {
    type: date
    sql: MAX(${day_date}) ;;
    convert_tz: no
  }

  measure: previous_day_percent{
    type: percent_of_previous
    sql: ${total_impression_count} ;;
    label: "Previous Day Percent"
  }

  measure: dynamic_previous_day_percent{
    type: percent_of_previous
    sql: ${dynamic_overview_metric} ;;
    label: "Dynamic Previous Day Percent"
  }

  measure: dynamic_previous_day_percent_abs {
    type: number  # Type should be 'number' since we're working with an absolute value, not a percentage.
    sql: ROUND(ABS(${dynamic_previous_day_percent}), 2) ;;  # Added closing parenthesis and rounded to 2 decimal places
  }

 measure: previous_percent_change_growth {

  description: "Percent Change for Previous Day"
  type: number
  sql: ROUND(ABS(${dynamic_previous_day_percent}), 2);;

  html:
    <tr>
      <td style="padding: 5px;">
        <p style="font-size: 13px; font-family: 'Calibri', sans-serif; color: black; margin: 0;">
          <b>Previous Day Change:&nbsp;&nbsp;</b>

    {% if time_bound_share_statistic.dynamic_previous_day_percent._value >= 0 %}
    <span style="color: green; font-size: 20px;">
    <b>{{ time_bound_share_statistic.dynamic_previous_day_percent_abs._rendered_value }}% &#9650;</b>
    </span>
    {% else %}
    <span style="color: red; font-size: 20px;">
    <b>{{ time_bound_share_statistic.dynamic_previous_day_percent_abs._rendered_value }}% &#9660;</b>
    </span>
    {% endif %}

    <span style="color: black;"> Previous Day</span>
    </p>
    </td>
    </tr>
    ;;
}














measure: count {
    type: count
  }

}
