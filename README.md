Face Recognition using AWS Face Rekognition Service

    ✨In this repository we are going to implement Face recognition application using AWS Rekognition service

Detail about this project:

    We are building a face recognition application in Python with the help of the AWS Recognition service to match and find employee details. 
    Here, we use an S3 bucket to store employee photos, index them in the Rekognition service, and store the face prints of people in a Dynamo DB table.
    Building the face recognition program and putting it in the EKS cluster, if the application finds a comparable face with the face prints, it will push notification as user found, and if it mismatches, it will push notification as user not found

🏠 Architecture
![image](https://github.com/user-attachments/assets/0da8a9dd-c838-4489-83f8-f646c5d38f0c)


📃 list of services
1.S3 bucket (Storage Block [To have employee's pictures])
2.Lambda functions(Computing Service) 
	2.1. To create AWS Rekognition collection ID
	2.2. To fetch the employee images from S3 bucket and index it in AWS Rekognition and to store the face prints in DynamoDB table
3.DynamoDB Table (Storage block [To store Face prints])
4.IAM Role (Wiring component between Lambda and Dynamo DB)
