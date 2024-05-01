output "bucket_regional_domain_name" {
  value = [for each in aws_s3_bucket.website : each.bucket_regional_domain_name if each.id == var.domain][0]
}

output "www_domain_website_endpoint" {
  value = aws_s3_bucket_website_configuration.www_domain.website_endpoint
}