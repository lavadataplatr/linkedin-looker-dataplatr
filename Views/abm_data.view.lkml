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
  }
  measure: count {
    type: count
    drill_fields: [name, company_name]
  }
}
