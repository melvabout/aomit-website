data "aws_iam_policy_document" "domain_bucket_policy" {

  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = ["s3:GetObject"]

    resources = ["arn:aws:s3:::${var.domain}/*"]
  }
}

data "aws_iam_policy_document" "www_domain_bucket_policy" {

  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = ["s3:GetObject"]

    resources = ["arn:aws:s3:::${local.www_domain}/*"]
  }
}