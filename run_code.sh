i=$1
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
