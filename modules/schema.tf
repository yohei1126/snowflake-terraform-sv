resource "snowflake_schema" "test" {
  database = snowflake_database.test.name
  name     = "TEST"
}
