view: abm_data {
  sql_table_name: `dataplatr-sandbox.marketing_analytics_edw.abm_data` ;;

  dimension: accepted {
    type: string
    sql: ${TABLE}.Accepted ;;
  }
  dimension_group: accepted_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Accepted_Date ;;
  }
  dimension: accepted_time {
    type: string
    sql: ${TABLE}.Accepted_Time ;;
  }
  dimension: company_name {
    type: string
    sql: ${TABLE}.Company_Name ;;
  }
  dimension: company_size {
    type: string
    sql: ${TABLE}.Company_Size ;;
  }
  dimension: contact_number {
    type: string
    sql: ${TABLE}.Contact_Number ;;
  }
  dimension: designation {
    type: string
    sql: ${TABLE}.Designation ;;
  }
  dimension_group: fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Fivetran_Synced ;;
  }
  dimension_group: follow_up_1 {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Follow_Up_1 ;;
  }
  dimension_group: follow_up_2 {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Follow_Up_2 ;;
  }
  dimension_group: follow_up_3 {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Follow_Up_3 ;;
  }
  dimension_group: follow_up_4 {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Follow_Up_4 ;;
  }
  dimension: industry {
    type: string
    sql: ${TABLE}.Industry ;;
  }
  dimension: linkedin_url {
    type: string
    sql: ${TABLE}.Linkedin_Url ;;
  }
  dimension: location {
    type: string
    sql: ${TABLE}.Location ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  dimension_group: reached_out {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Reached_Out_Date ;;
    label: "Reached Out Date"
  }
  dimension: remark {
    type: string
    sql: ${TABLE}.Remark ;;
  }
  dimension: response {
    type: string
    sql: ${TABLE}.Response ;;
  }
  dimension_group: response {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Response_Date ;;
  }
  dimension: row_id {
    type: number
    sql: ${TABLE}.Row_Id ;;
  }
  dimension_group: thank_you_message {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Thank_You_Message_Date ;;
    label: "Thank You Message Sent"
  }


#**************************Measures**************************#

  #measure: connections_sent {
    #type: count
    #sql: ${reached_out_date} ;;
    #label: "Connections Sent"
  #}

  measure: connections_sent {
    type: count  # No need for sql parameter
    label: "Connections Sent"
  }


  measure: connections_sent_custom_date {
    type: number
    sql:
    COUNT(CASE WHEN ${reached_out_date} BETWEEN '2024-11-25' AND '2024-12-01' THEN ${reached_out_date} ELSE NULL END) ;;
    label: "Custom Date Connections Sent"
  }


  measure: thank_you_message_sent {
    type: count_distinct
    sql: ${thank_you_message_date} ;;
    label: "Thank You Message Sent"
  }

 measure: follow_up_message_sent {
    type: number
    sql:
    (COUNT(${follow_up_1_date}) +
    COUNT(${follow_up_2_date}) +
    COUNT(${follow_up_3_date}) +
    COUNT(${follow_up_4_date})) ;;
    label: "Follow-Up Message Sent"
  }


# Measure for Acceptance Rate
  measure: acceptance_rate {
    type: number
    sql:
    (SUM(CASE WHEN ${accepted} = 'yes' THEN 1 ELSE 0 END) * 1.0) /
    NULLIF(COUNT(${reached_out_date}), 0) ;;
    value_format: "0.00%"  # Format as percentage
    label: "Acceptance Rate"
  }

  measure: response_rate {
    type: number
    sql:
    (SUM(CASE WHEN ${response} IS NOT NULL THEN 1 ELSE 0 END) * 1.0) /
    NULLIF(COUNT(${thank_you_message_date}), 0) ;;
    value_format: "0.00%"  # Format as percentage
    label: "Response Rate"
  }


  filter: custom_date_range {
    type: string
    sql: ${reached_out_date} BETWEEN '2024-11-25' AND '2024-12-01' ;;  # Custom date range filter
  }

  filter: weekly_date_range {
    type: string
    sql: ${reached_out_date} BETWEEN CURRENT_DATE() - INTERVAL 7 DAY AND CURRENT_DATE() ;;  # Weekly filter
  }

  filter: current_month {
    type: string
    sql: EXTRACT(MONTH FROM ${reached_out_date}) = EXTRACT(MONTH FROM CURRENT_DATE()) ;;  # Current month filter
  }

  measure: overall_response_rate {
    type: number
    sql: SUM(CASE WHEN response_date IS NOT NULL THEN 1 ELSE 0 END) / COUNT(thank_you_message_date) ;;
    value_format: "0.00%"  # Formats the value as a percentage with 2 decimal places
    label: "Overall Response Rate"
  }


  measure: thank_you_message_rr {
    type: number
    sql: (SUM(CASE WHEN ${response_date} < IFNULL(${follow_up_1_date}, '2099-01-01') THEN 1 ELSE 0 END) /
      SUM(CASE WHEN ${thank_you_message_date} IS NOT NULL THEN 1 ELSE 0 END)) ;;  # Removed * 100
    value_format: "0.00%"  # Formats the result as a percentage
    label: "Thank You Message RR"
  }

  measure: follow_up_1_rr {
    type: number
    sql: (SUM(CASE WHEN ${response_date} >= ${follow_up_1_date} AND
                   ${response_date} < IFNULL(${follow_up_2_date}, '2099-01-01') THEN 1 ELSE 0 END) /
        SUM(CASE WHEN ${thank_you_message_date} IS NOT NULL THEN 1 ELSE 0 END)) ;;  # Removed * 100
    value_format: "0.00%"  # Formats the result as a percentage
    label: "Follow Up 1 RR"
  }

  measure: follow_up_2_rr {
    type: number
    sql: (SUM(CASE WHEN ${response_date} >= ${follow_up_2_date} AND
                   ${response_date} < IFNULL(${follow_up_3_date}, '2099-01-01') THEN 1 ELSE 0 END) /
        SUM(CASE WHEN ${thank_you_message_date} IS NOT NULL THEN 1 ELSE 0 END)) ;;  # Removed * 100
    value_format: "0.00%"  # Formats the result as a percentage
    label: "Follow Up 2 RR"
  }

  measure: follow_up_3_rr {
    type: number
    sql: (SUM(CASE WHEN ${response_date} >= ${follow_up_3_date} AND
                   ${response_date} < IFNULL(${follow_up_4_date}, '2099-01-01') THEN 1 ELSE 0 END) /
        SUM(CASE WHEN ${thank_you_message_date} IS NOT NULL THEN 1 ELSE 0 END)) ;;  # Removed * 100
    value_format: "0.00%"  # Formats the result as a percentage
    label: "Follow Up 3 RR"
  }

  measure: follow_up_4_rr {
    type: number
    sql: (SUM(CASE WHEN ${response_date} >= ${follow_up_4_date} THEN 1 ELSE 0 END) /
      SUM(CASE WHEN ${thank_you_message_date} IS NOT NULL THEN 1 ELSE 0 END)) ;;  # Removed * 100
    value_format: "0.00%"  # Formats the result as a percentage
    label: "Follow Up 4 RR"
  }



  measure: count {
    type: count
    drill_fields: [name, company_name]
  }
}
