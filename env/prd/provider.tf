terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.1"
    }
  }
}

provider "snowflake" {
  username         = "terraform"
  account          = "xxx"            // change me
  private_key_path = "./rsa_key.p8"
  role             = "SYSADMIN"
}
