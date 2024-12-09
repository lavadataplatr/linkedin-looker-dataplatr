connection: "bigquery_linked_sandbox"

# Include all views in the project
include: "/**/*.view.lkml"

explore: linkedin_pages__posts {
  label: "Linkedin Pages"

  # Join with Latest Post History
  join: int_linkedin_pages__latest_post_history {
    view_label: "Latest Post History"
    relationship: one_to_many
    sql_on: ${linkedin_pages__posts.ugc_post_id} = ${int_linkedin_pages__latest_post_history.ugc_post_id} ;;
  }

  # Join with Latest Post
  join: int_linkedin_pages__latest_post {
    view_label: "Latest Post"
    relationship: one_to_one
    sql_on: ${linkedin_pages__posts.ugc_post_id} = ${int_linkedin_pages__latest_post.ugc_post_id} ;;
  }
}
explore: cust_linkedin_pages__posts {}

explore: time_bound_share_statistic {}
