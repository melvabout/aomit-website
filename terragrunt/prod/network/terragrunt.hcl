include "root" {
  path = find_in_parent_folders()
}

terraform {
  source =  "${path_relative_from_include()}/../../terraform/${path_relative_to_include()}"
}


locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

dependency "storage" {
  config_path = "../storage"
  
  mock_outputs = {
    bucket_regional_domain_name = "arn.arn.arn"
    www_domain_website_endpoint = "more.arns"
  }
}

inputs = {
  domain = local.env_vars.locals.domain
  www_bucket_domain_name = dependency.storage.outputs.www_domain_website_endpoint
  bucket_domain_name = dependency.storage.outputs.bucket_regional_domain_name
}

