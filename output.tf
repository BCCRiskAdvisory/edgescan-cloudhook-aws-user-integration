output "access_key_id" {
  value = aws_iam_access_key.edgescan_integration.id
}

output "secret_access_key" {
  value = nonsensitive(aws_iam_access_key.edgescan_integration.secret)
}