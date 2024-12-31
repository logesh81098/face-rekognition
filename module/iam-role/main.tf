#############################################################################################################################
#                                           Deploying IAM Role
#############################################################################################################################

########IAM Role for Collection lambda#########

resource "aws_iam_role" "lambda-role-collection-id" {
  name = "lambda-collection-id"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
    {
        "Effect": "Allow",
        "Action": "sts:AssumeRole",
        "Principal": {
        "Service": "lambda.amazonaws.com"
        }    
    }
    ]
}  
EOF
}



#############################################################################################################################
#                                           Deploying IAM Policies
#############################################################################################################################

##########IAM Policy for Collection lambda############

resource "aws_iam_policy" "lambda-policy-collection-id" {
  name = "lambda-policy-collection-id"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
  {
      "Sid": "CollectingRekognition",
      "Effect": "Allow",
      "Action": [
        "rekognition:CreateCollection",
        "rekognition:DeleteCollection",
        "rekognition:ListCollections"
            ],
      "Resource": "*"
  },
  {
      "Sid": "CloudWatchLogGroups",
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
            ],
      "Resource": "arn:aws:logs:*:*:*"
  }
  ]
}
EOF  
}



#############################################################################################################################
#                                        Attaching Role and Policy
#############################################################################################################################

resource "aws_iam_role_policy_attachment" "lambda-role-policy-collection-id" {
  role = aws_iam_role.lambda-role-collection-id.id
  policy_arn = aws_iam_policy.lambda-policy-collection-id.arn
}