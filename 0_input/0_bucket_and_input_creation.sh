#---creation of bucket at AWSS3
aws s3api create-bucket --bucket aws-batch-example3 --region us-west-2 --create-bucket-configuration LocationConstraint=us-west-2

#---creation of input and save at awss3
python3 input_creation.py
