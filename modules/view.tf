resource "snowflake_view" "view" {
  database = snowflake_database.test.name
  schema   = snowflake_schema.test.name
  name     = "TEST_VIEW"

  statement = <<-SQL
    SELECT * FROM test;
SQL

  depends_on = [
    snowflake_table.test
  ]
}
