############################################################################################################################
#                                        Deploying Lambda Function 
############################################################################################################################

########Lambda function for collection id############

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