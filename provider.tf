terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.23.2"
    }
  }
}

provider "snowflake" {
  username         = "terraform"      // change me
  account          = "do50920"        // change me
  region           = "ap-southeast-1" // change me
  private_key_path = "./rsa_key.p8"
  role             = "SYSADMIN"
}
