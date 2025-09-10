# Define the database connection to be used for this model.
connection: "thelook"

view: studio_test {
  derived_table: {
    indexes: ["id"]
    sql_trigger_value: SELECT 1 ;;
    sql: SELECT * FROM demo_db.orders WHERE id = {% parameter test_param %} ;;
  }
  dimension: id {}
  parameter: test_param {
    type: number
  }
}
