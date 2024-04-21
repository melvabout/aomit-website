output "domain_website_endpoint" {
  value = toset([for each in aws_s3_bucket.website : each.website_endpoint if each.id == var.domain])
}

output "www_domain_website_endpoint" {
  value = toset([for each in aws_s3_bucket.website : each.website_endpoint if each.id != var.domain])
}

