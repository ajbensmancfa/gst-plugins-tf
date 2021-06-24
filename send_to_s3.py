import boto3

cli = boto3.client('s3')

cli.upload_file("output.txt", "test-gstreamer-tensorflow-output", "OUTPUT.txt")