terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.13"
    }
  }
  backend "s3" {
    bucket = "yohei-test-snowflake-deployment"
    key    = "stg/test"
    region = "ap-southeast-1"
  }
}

# required environment variable
#   SNOWFLAKE_ACCOUNT
#   SNOWFLAKE_PASSWORD or SNOWFLAKE_PRIVATE_KEY_PATH
provider "snowflake" {
  username         = "terraform"
  role             = "SYSADMIN"
}
