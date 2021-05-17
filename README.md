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
├── env
│   ├── dev
│   │   ├── main.tf
│   │   ├── out.tfplan
│   │   ├── provider.tf
│   │   ├── rsa_key.p8
│   │   └── rsa_key.pub
│   ├── prd
│   │   ├── main.tf
│   │   ├── out.tfplan
│   │   ├── provider.tf
│   │   ├── rsa_key.p8
│   │   └── rsa_key.pub
│   └── stg
│       ├── main.tf
│       ├── out.tfplan
│       ├── provider.tf
│       ├── rsa_key.p8
│       └── rsa_key.pub
├── modules
    ├── database.tf
    ├── provider.tf
    ├── schema.tf
    ├── table.tf
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

## Create key pair

* I assume that you use key pair authentication.
* Note that Snowflake plugin does not support encrypted private key. If you want to put the private key into Git repo, you should encrypt it using encryption tool of service like AWS KMS.
* See here fore more about key pair authentication. https://docs.snowflake.com/en/user-guide/key-pair-auth.html#step-1-generate-the-private-key

```
# generate unencrypted private key
$ openssl genrsa 2048 | openssl pkcs8 -topk8 -inform PEM -out rsa_key.p8 -nocrypt
# generate public key
$ openssl rsa -in rsa_key.p8 -pubout -out rsa_key.pub
```

## Create new user and set public key

* Assume that we use an user `terraform` and `SYSADMDIN` is granted to this user.
* Set the public key you generated above to this user.

```
CREATE USER TERRAFORM RSA_PUBLIC_KEY = "xxx";
```

## Providder configuration

* `provider` section in `provider.tf` include Snowflke account and user authentication.

```
provider "snowflake" {
  username         = "terraform"
  account          = "do50920.ap-southeast-1"        // change me
  private_key_path = "./rsa_key.p8"
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
      version = "0.25.1"
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
