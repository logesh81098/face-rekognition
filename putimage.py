import boto3

s3 = boto3.resource('s3')

# Get list of objects for indexing
images=[('Air Jordan.jpg','Jordan'),
      ('King James.jpg','James'),
      ('Kyrie.jpg','Kyrie'),
      ('Stephen-curry','curry')
      ]

# Iterate through list to upload objects to S3   
for image in images:
    file = open(image[0],'rb')
    object = s3.Object('face-detection-9','index/'+ image[0])
    ret = object.put(Body=file,
                    Metadata={'FullName':image[1]})
