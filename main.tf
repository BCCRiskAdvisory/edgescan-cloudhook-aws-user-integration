resource "aws_iam_user" "edgescan_integration" {
  name = var.username
}

resource "aws_iam_access_key" "edgescan_integration" {
  user = aws_iam_user.edgescan_integration.name
}

// Policy attachments to AWS-managed policies
resource "aws_iam_user_policy_attachment" "ec2_read_only_access" {
  user       = aws_iam_user.edgescan_integration.name
  policy_arn = data.aws_iam_policy.ec2_read_only_access.arn
}

resource "aws_iam_user_policy_attachment" "route53_read_only_access" {
  user       = aws_iam_user.edgescan_integration.name
  policy_arn = data.aws_iam_policy.route53_read_only_access.arn
}

data "aws_iam_policy" "ec2_read_only_access" {
  name = "AmazonEC2ReadOnlyAccess"
}

data "aws_iam_policy" "route53_read_only_access" {
  name = "AmazonRoute53ReadOnlyAccess"
}

// In-line policy for account alias access
resource "aws_iam_user_policy" "read_only_account_alias" {
  user   = aws_iam_user.edgescan_integration.name
  name   = "ReadOnlyAWSAccountAlias"
  policy = data.aws_iam_policy_document.read_only_account_alias.json
}

data "aws_iam_policy_document" "read_only_account_alias" {
  statement {
    sid = "ReadOnlyAWSAccountAlias"

    effect = "Allow"

    actions = [
      "iam:ListAccountAliases"
    ]

    resources = ["*"]
  }
}