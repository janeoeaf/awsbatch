from io import StringIO
import pandas as pd
import boto3
import os

#---provide the aws credentials or create env variables
#os.environ["ACCESS_KEY"]="??"
#os.environ["SECRET_KEY"]="??"
bucket="aws-batch-example3"


#--- create input data frame
n=1000
colA=[]
colB=[]
for i in range(n):
    colA.append('A'+str(i))
    colB.append('B'+str(n-i-1))

di={
    'job':range(n),
    'colA':colA,
    'colB':colB
}

df=pd.DataFrame.from_dict(di)




client=boto3.client('s3')


csv_buffer=StringIO()
df.to_csv(csv_buffer,index=False,encoding='utf-8')

response=client.put_object(
    ACL='private',
    Body=csv_buffer.getvalue(),
    Bucket=bucket,
    Key='input/input.csv'
)