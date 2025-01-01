output "collection-id-role-arn" {
  value = aws_iam_role.lambda-role-collection-id.arn
}

output "faceprint-lambda-role-arn" {
  value = aws_iam_role.faceprint-lambda-role.arn
}