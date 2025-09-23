view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    link: {
      label: "URL"
      url: "https://drive.google.com/corp/drive/folders/1BYj2HpYCaIVwCD8Ez0u-CJby0QZdNphs?lfhs=2"
    }
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: DateTime {

    type: date_time
    convert_tz: no
    sql:  ${TABLE}.created_at ;;
    html: {{ rendered_value | date: _user_attributes['asdfghjkl'] }};;
  }

  measure: last_declaration_time {

    type: string

  #  sql: max(case when ${status}="complete" and
   #   ${users.country}="USA" then ${DateTime} end);;

    sql: max(${TABLE}.created_at);;

    html: {{ rendered_value | date: _user_attributes['asdfghjkl'] }};;

  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
    # link: {
    #   label: "URL"
    #   url: "https://drive.google.com/corp/drive/folders/1BYj2HpYCaIVwCD8Ez0u-CJby0QZdNphs?lfhs=2"
    # }

  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  users.id,
  users.first_name,
  users.last_name,
  billion_orders.count,
  fakeorders.count,
  hundred_million_orders.count,
  hundred_million_orders_wide.count,
  order_items.count,
  order_items_vijaya.count,
  ten_million_orders.count
  ]
  }

}
