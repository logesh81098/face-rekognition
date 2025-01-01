#############################################################################################################################
#                                           Creating S3 bucket
#############################################################################################################################

#######S3 bucket to store employee images#######

resource "aws_s3_bucket" "employee-bucket" {
  bucket = "face-rekognition-employee-bucket-logesh"
  tags = {
    Name = "face-rekognition-employee-bucket-logesh"
    Env = "Prod"
  }
}

resource "aws_s3_bucket_notification" "faceprint-lambda-notification" {
  bucket = aws_s3_bucket.employee-bucket.id
  lambda_function {
    lambda_function_arn = var.faceprint-lambda-arn
    events = ["s3:ObjectCreated:*"]
  }
}