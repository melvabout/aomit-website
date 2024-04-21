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
    www_domain_website_endpoint = "arn.arn.arn"
    domain_website_endpoint = "more.arns"
  }
}

inputs = {
  domain = local.env_vars.locals.domain
  www_domain_website_endpoint = dependency.storage.outputs.www_domain_website_endpoint
  domain_website_endpoint = dependency.storage.outputs.domain_website_endpoint
}

