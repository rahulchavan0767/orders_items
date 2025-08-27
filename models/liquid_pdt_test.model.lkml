connection: "thelook"

view: liquid_pdt {
  derived_table: {
    indexes: ["id"]
    persist_for: "24 hours"
    sql: SELECT * FROM demo_db.orders WHERE id = {{_user_attributes['id']}} ;;
  }
  dimension: id {}
}

explore: liquid_pdt {}
