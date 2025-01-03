############################################################################################################################
#                                       Deploying Dynamo DB Table
############################################################################################################################

######## DynamoDB table to store face prints########

resource "aws_dynamodb_table" "face-prints-table" {
  name = "face-prints-table"
  hash_key = "RekognitionId"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    type = "S"
    name = "RekognitionId"
  }
  tags = {
    Name = "face-prints-table"
    Env = "Prod"
  }
  }