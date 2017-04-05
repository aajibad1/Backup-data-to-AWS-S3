# Backup-data-to-AWS-S3
#WHAT I DID 
#create a bucket 
turn on the versioning 
create a bucket lifecycle policy 

command to push  an abject to the bucket 
aws s3 cp >>sourcepath<< s3://>>bucketName<<

HOW TO ACCESS YOUR BUCKET FROM TERMINAL
- INSTALL PIP 
 sudo apt -get intsall -y pyhtin pip
 sudo pip install awscli
 CHECK TO ENSURE IT EXISTS
 - which AWS
 CONFIGURE AWS
 -aws configure
 TYPE IN YOUR KEY, SCRET KEY , ZONE, JSON.
 
 HOW TO RUN THE SCRIPT 
 chnage the  database name, host , user and password 
 
 provide the information for aws s3 
 aws s3 cp >>sourcepath<< s3://>>bucketName<<
 
 RUN SCIPT USING 
 
 ./backbuck.sh
 
 
