terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.13"
    }
  }
}

provider "snowflake" {
  username         = "terraform"
  role             = "SYSADMIN"
}
