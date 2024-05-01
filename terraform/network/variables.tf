variable "domain" {
  description = "The domain to use."
  type        = string
}

variable "bucket_domain_name" {
  description = "Website endpoint for the domain bucket"
  type        = string
}

variable "www_bucket_domain_name" {
  description = "Website endpoint for the www domain bucket"
  type        = string
}