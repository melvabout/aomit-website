generate "provider" {
  path = "${path_relative_from_include()}/../../../../../terraform/${path_relative_to_include()}/provider.tf"
  if_exists = "overwrite"
  contents = <<EOF
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.46.0"
    }
  }
}

provider "aws" {
  region              = "eu-west-2"
  allowed_account_ids = ["905418442662"]
}
EOF
}

remote_state {

  backend = "s3"

  config = {
    bucket         = "aomit-terraform-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
    dynamodb_table = "aomit-state-lock-table"
  }
}
