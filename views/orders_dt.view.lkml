view: orders_dt {
  derived_table: {
    interval_trigger: "10 minutes"
    explore_source: orders {
      column: created_time {}
      column: id {}
      column: status {}
      column: user_id {}
    }
  }
  dimension: created_time {
    description: ""
    type: date_time
  }
  dimension: id {
    description: ""
    type: number
  }
  dimension: status {
    description: ""
  }
  dimension: user_id {
    description: ""
    type: number
  }
}
