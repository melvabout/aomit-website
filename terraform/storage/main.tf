terraform {
  backend "s3" {}
}

resource "aws_s3_bucket" "website" {
  for_each = toset(local.names)

  bucket = each.value
}

resource "aws_s3_bucket_versioning" "website" {
  for_each = aws_s3_bucket.website

  bucket = each.value.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "website" {
  for_each = aws_s3_bucket.website

  bucket = each.value.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "website" {
  for_each = aws_s3_bucket.website

  bucket = each.value.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
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

resource "aws_s3_bucket_website_configuration" "www_domain" {
  bucket = local.www_domain

  redirect_all_requests_to {
    host_name = var.domain
    protocol  = "https"
  }
}

resource "aws_s3_bucket_policy" "domain" {

  bucket = var.domain
  policy = data.aws_iam_policy_document.domain_bucket_policy.json

}

resource "aws_s3_bucket_policy" "www_domain" {

  bucket = local.www_domain
  policy = data.aws_iam_policy_document.www_domain_bucket_policy.json

}