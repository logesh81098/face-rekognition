module "s3" {
  source = "./module/s3"
}

module "iam-role" {
  source = "./module/iam-role"
}

module "lambda" {
  source = "./module/lambda"
  collection-id-role-arn = module.iam-role.collection-id-role-arn
  faceprint-lambda-role = module.iam-role.faceprint-lambda-role-arn
}

module "dynamodb" {
  source = "./module/dynamo-db"
}