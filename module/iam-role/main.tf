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


#############################################################################################################################
#                                           Deploying IAM Role
#############################################################################################################################

########IAM Role for faceprint lambda#########

resource "aws_iam_role" "faceprint-lambda-role" {
  name = "faceprint-lambda"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
  {
    "Effect": "Allow",
    "Principal": {
      "Service": "lambda.amazonaws.com"
    },
    "Action": "sts:AssumeRole"
  }
  ]
} 
EOF 
}


#############################################################################################################################
#                                           Deploying IAM Policies
#############################################################################################################################

##########IAM Policy for faceprint lambda############

resource "aws_iam_policy" "faceprint-lambda-policy" {
  name = "faceprint-lambda-policy"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
  {
  "Sid": "CloudWatchLoggroup",
  "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
            ],
      "Resource": "arn:aws:logs:*:*:*"
  },
  {
      "Sid": "Rekognitionindexface",
      "Effect": "Allow",
      "Action": [
        "rekognition:IndexFaces"
      ],
      "Resource": "arn:aws:rekognition:*:*:collection/*"
    },
    {
      "Sid": "DynamoDBputfaceprints",
      "Effect": "Allow",
      "Action": [
        "dynamodb:PutItem"
      ],
      "Resource": "arn:aws:dynamodb:*:*:table/face-prints-table"
    },
    {
      "Sid": "S3fetchimages",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:HeadObject"
      ],
      "Resource": "arn:aws:s3:::face-rekognition-employee-bucket-logesh/*"
    }
  ]
}  
EOF
}


#############################################################################################################################
#                                        Attaching Role and Policy
#############################################################################################################################

resource "aws_iam_role_policy_attachment" "faceprint-lambda-role-attachment" {
  policy_arn = aws_iam_policy.faceprint-lambda-policy.arn
  role = aws_iam_role.faceprint-lambda-role.id
}