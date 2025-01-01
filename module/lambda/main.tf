############################################################################################################################
#                                        Deploying Lambda Function 
############################################################################################################################

########Lambda function for creating collection id############

resource "aws_lambda_function" "rekognition-collection-id" {
  handler = "collection-id.lambda_handler"
  function_name = "rekognition-collection-id"
  runtime = "python3.8"
  timeout = "20"
  role = var.collection-id-role-arn
  filename = "module/lambda/rekognition-collection-id.zip"
  tags = {
    Name = "rekognition-collection-id"
    Project = "Face-Rekognition"
  }
}


############################################################################################################################
#                                        Archive Files
############################################################################################################################

data "archive_file" "name" {
  source_dir = "module/lambda"
  output_path = "module/lambda/rekognition-collection-id.zip"
  type = "zip"
}

############################################################################################################################
#                                        Deploying Lambda Function 
############################################################################################################################

########Lambda function for creating faceprint############
resource "aws_lambda_function" "faceprint-lambda" {
  function_name = "faceprint-lambda"
  runtime = "python3.8"
  timeout = "20"
  filename = "module/lambda/faceprint.zip"
  role = var.faceprint-lambda-role
  handler = "faceprint.lambda_handler"
  tags = {
    Name = "faceprint-lambda"
  }
}


############################################################################################################################
#                                        Archive Files
############################################################################################################################

data "archive_file" "faceprint" {
  type = "zip"
  source_dir = "module/lambda"
  output_path = "module/lambda/faceprint.zip"
}