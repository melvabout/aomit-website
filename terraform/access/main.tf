terraform {
  backend "s3" {}
}

resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com",
  ]

  thumbprint_list = data.tls_certificate.github.certificates[*].sha1_fingerprint
}

resource "aws_iam_role" "github" {
  name               = var.deployment_role_name
  assume_role_policy = data.aws_iam_policy_document.github_assume.json
}

resource "aws_iam_policy" "github" {
  name   = "github-deployment-policy"
  policy = data.aws_iam_policy_document.github_deployment.json
}

resource "aws_iam_role_policy_attachment" "github" {
  role       = aws_iam_role.github.name
  policy_arn = aws_iam_policy.github.arn
}
