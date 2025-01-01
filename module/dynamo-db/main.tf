############################################################################################################################
#                                       Deploying Dynamo DB Table
############################################################################################################################

######## DynamoDB table to store face prints########

resource "aws_dynamodb_table" "face-prints-table" {
  name = "face-prints-table"
  hash_key = "RecognitionID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    type = "S"
    name = "RecognitionID"
  }
  tags = {
    Name = "face-prints-table"
    Env = "Prod"
  }
  }