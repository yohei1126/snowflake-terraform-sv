resource "snowflake_table" "test3" {
  database = snowflake_database.test.name
  schema   = snowflake_schema.test.name
  name     = "TEST3"

  column {
    name = "ID"
    type = "NUMBER(38,0)"
  }

  column {
    name = "DATA"
    type = "VARCHAR(16777216)"
  }

  column {
    name = "EVENT_DATE"
    type = "DATE"
  }

}
