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