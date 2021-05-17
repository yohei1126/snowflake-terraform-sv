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
  account          = "mc18016.ap-northeast-1.aws" // change me
  private_key_path = "./rsa_key.p8"
  role             = "SYSADMIN"
}
