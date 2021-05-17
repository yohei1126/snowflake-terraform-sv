resource "snowflake_table" "test" {
  database = snowflake_database.test.name
  schema   = snowflake_schema.test.name
  name     = "TEST"

  column {
    name = "ID"
    type = "int"
  }

  column {
    name = "DATA"
    type = "text"
  }
}
