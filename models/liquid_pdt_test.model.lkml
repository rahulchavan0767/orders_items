connection: "thelook"

view: liquid_pdt {
  derived_table: {
    indexes: ["id"]
    persist_for: "24 hours"
    sql: SELECT * FROM demo_db.orders WHERE id = {% parameter test_param %} ;;
  }
  dimension: id {}
  parameter: test_param {
    type: number
  }
}

explore: liquid_pdt {}
