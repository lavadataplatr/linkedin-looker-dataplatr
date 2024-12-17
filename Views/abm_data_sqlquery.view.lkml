view: abm_data_sqlquery {
  derived_table: {
    sql: WITH abm_data_weekly AS (
        SELECT
          CONCAT(EXTRACT(YEAR FROM DATE(abm_data.Reached_Out_Date)), '-', LPAD(CAST(EXTRACT(WEEK FROM DATE(abm_data.Reached_Out_Date)) AS STRING), 2, '0')) AS abm_data_week_number,
          COALESCE(SUM(CASE WHEN abm_data.Reached_Out_Date IS NOT NULL THEN 1 ELSE 0 END), 0) AS abm_data_connections_sent
        FROM `dataplatr-sandbox.marketing_analytics_edw.abm_data` AS abm_data
        GROUP BY 1
        ORDER BY 1
      )
      SELECT
        abm_data_week_number,
        abm_data_connections_sent,
        LAG(abm_data_connections_sent) OVER (ORDER BY abm_data_week_number) AS abm_data_previous_connections_1,
        -- Calculate percentage change between current and previous week
        CASE
          WHEN LAG(abm_data_connections_sent) OVER (ORDER BY abm_data_week_number) IS NOT NULL
          THEN (abm_data_connections_sent - LAG(abm_data_connections_sent) OVER (ORDER BY abm_data_week_number))
               / LAG(abm_data_connections_sent) OVER (ORDER BY abm_data_week_number) * 100
          ELSE NULL
        END AS abm_data_percentage_change
      FROM abm_data_weekly
      ORDER BY abm_data_week_number
      LIMIT 500 ;;
  }

  # Measure for comparison and conditional color logic (Green for current week > previous week, Red for current week < previous week)
  measure: comparison_color {
    type: string
    sql:
      CASE
        WHEN ${abm_data_connections_sent} > ${abm_data_previous_connections_1} THEN '#00FF00'  -- Green: Current week > previous week
        WHEN ${abm_data_connections_sent} < ${abm_data_previous_connections_1} THEN '#FF0000'  -- Red: Current week < previous week
        ELSE '#808080'  -- Gray: No change
      END ;;
    label: "Comparison Color (Green/Red/Gray)"
  }


  # Dimension definitions
  dimension: abm_data_week_number {
    type: string
    sql: ${TABLE}.abm_data_week_number ;;
  }

  dimension: abm_data_connections_sent {
    type: number
    sql: ${TABLE}.abm_data_connections_sent ;;
  }

  dimension: abm_data_previous_connections_1 {
    type: number
    sql: ${TABLE}.abm_data_previous_connections_1 ;;
  }

  dimension: abm_data_percentage_change {
    type: number
    sql: ${TABLE}.abm_data_percentage_change ;;
  }
}
