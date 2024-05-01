include "root" {
  path = find_in_parent_folders()
}

terraform {
  source =  "${path_relative_from_include()}/../../terraform/${path_relative_to_include()}"
}

locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  deployment_role_name = "github-aomit-website-deployment-role"
  github_identifiers = ["melvabout"]
  repository_name = "aomit-website"
}