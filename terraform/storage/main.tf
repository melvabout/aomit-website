terraform {
  backend "s3" {}
}

resource "aws_s3_bucket" "website" {
  for_each =  toset(local.names)
  
  bucket = each.value
}

resource "aws_s3_bucket_acl" "website" {
    for_each = aws_s3_bucket.website

    bucket = each.value.id
    acl    = "public-read"
}

resource "aws_s3_bucket_cors_configuration" "domain" {
    bucket = var.domain

    cors_rule {
        allowed_headers = ["Authorization", "Content-Length"]
        allowed_methods = ["GET"]
        allowed_origins = [local.https_domain]
        max_age_seconds = 3000
    }
}

resource "aws_s3_bucket_website_configuration" "domain" {
    bucket = var.domain

    index_document {
        suffix = "index.html"
    }

    error_document {
        key = "error.html"
    }
}

resource "aws_s3_bucket_website_configuration" "www_domain" {
    bucket = local.www_domain

    redirect_all_requests_to {
        host_name = local.https_domain
    }
}