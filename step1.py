import pandas as pd
import sys

print(sys.argv[1])

job_index=sys.argv[1]
i=int(job_index)

d=pd.read_csv('./tmp/input_file.csv')

ref=d.iloc[[i],:]

ref['col4']=str(ref.iloc[0,0])+str(ref.iloc[0,1])+str(ref.iloc[0,2])

ref.to_csv('./tmp/step1.csv',index=False,encoding='utf-8')