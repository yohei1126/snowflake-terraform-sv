# snowflake-terraform-sv

# Directory Structure

* This sample support multiple environment (Snowflake account)
* `env/dev` is for development environment specific configuration
* `env/stg` is for staging environment specific configuration
* `env/prd` is for production environment specific configuration
* `moddules` is for shared modules

```
.
├── README.md
├── buildspec-deploy.yml
├── buildspec-diff.yml
├── env
│   ├── dev
│   │   ├── main.tf
│   │   └── provider.tf
│   ├── prd
│   │   ├── main.tf
│   │   └── provider.tf
│   └── stg
│       ├── main.tf
│       └── provider.tf
└── modules
    ├── database.tf
    ├── provider.tf
    ├── schema.tf
    ├── table.tf
    ├── table_test2.tf
    └── view.tf
```

# Set up

## Install Terraform

* For MacOS users, Terraform provides brew tap. 
* https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started

```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

## Create new user

* Create an user `terraform`.
* Grant `SYSADMDIN` role to `terraform`.

## Providder configuration

* Set your s3 bucket in `backend` section.

```
terraform {
  ...
  backend "s3" {
    bucket = "yohei-test-snowflake-deployment"
    key    = "dev/test"
    region = "ap-southeast-1"
  }
}
```

* `provider` section in `provider.tf` does not specify Snowflke account and password.
* The following environment variables are required.
  * `SNOWFLAKE_ACCOUNT`
  * `SNOWFLAKE_PASSWORD`

```
provider "snowflake" {
  username         = "terraform"
  role             = "SYSADMIN"
}
```

## Terraform init

* We already have Snowflake provider configuration in a file `provier.tf`.

```
terraform {
  required_providers {
    snowflake = {
      source = "chanzuckerberg/snowflake"
      version = "0.25.13"
    }
  }
}
```

* Run `terraform init` command. This will innstall Snowflake plugin locally.
* See here for more about `terraform init` command. https://www.terraform.io/docs/cli/commands/init.html

```
$ cd env/dev
$ terraform init
```

# Deploy

* After modify local terraform files, you can run `terraform plan` command to check the diff.
* If the diff is OK, you can apply the change by running `terraform apply`.
* See here for more about plan and apply command. https://www.terraform.io/docs/cli/run/index.html

```
# check diff
$ terraform plan --out out.tfplan
# apply the change
$ terraform apply out.tfplan
```
