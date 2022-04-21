#!/bin/sh

aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID" --profile user2
aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY" --profile user2
aws configure set region "$AWS_REGION" --profile user2
aws configure set output "text" --profile user2


i=$AWS_BATCH_JOB_ARRAY_INDEX
input_file=s3://aws-batch-example3/input/input.csv

mkdir -p tmp
aws s3 cp $input_file ./tmp/input_file.csv

#---step1
python3 step1.py $i

#---step3
Rscript step2.R $i

#save at aws s3
aws s3 cp ./tmp/step2.csv s3://aws-batch-example3/output/job$i.csv

#remove tmp
rm -rf ./tmp
