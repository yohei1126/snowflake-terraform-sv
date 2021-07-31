terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.13"
    }
  }
}

# required environment variable
#   SNOWFLAKE_ACCOUNT
#   SNOWFLAKE_PASSWORD or SNOWFLAKE_PRIVATE_KEY_PATH
provider "snowflake" {
  username         = "terraform"
  role             = "SYSADMIN"
}
