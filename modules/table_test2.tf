resource "snowflake_table" "test2" {
  database = snowflake_database.test.name
  schema   = snowflake_schema.test.name
  name     = "TEST2"

  column {
    name = "ID"
    type = "NUMBER(38,0)"
  }

  column {
    name = "DATA"
    type = "VARCHAR(16777216)"
  }
}
