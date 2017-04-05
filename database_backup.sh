#!/usr/bin/env bash
dbuser="ccdcedu_adedapoa"
dbpass="Adebayo@007"
host="ccdc.edu"
dbname="ccdcedu_eds"
S3BUCKET="ccdcedu-backup"
backuppath="/home/adedapo/Desktop/ccdcedu_edsBACKUP"
date=$(date +"%d-%b-%y-%H:%M")
#set file permission
umask 177 

  dbbackup="fails"
  until [[ $dbbackup = "success" ]]; do
    echo "PLEASE WAIT...BACKINGUP YOUR DATA $date"
 # export database to local directory 
  mysqldump --user="${dbuser}" --password="${dbpass}" --host="${host}" ${dbname} | gzip  > $backuppath/$dbname-$date.sql.gz   

# Delete files older than 30 days
 find $backuppath/* -mtime +30 -exec rm {} \;
#checking 
dbstatus=`echo $?`
    if [ $dbstatus -ne 0 ]; then
      echo -e "database Backup fails "
      exit 1
    else
      dbbackup="success"
      echo "Local Machine BackUp Successful!"
    fi
done 
if [ -e ${backuppath} ]; then

#Upload to AWS
aws s3 cp   $backuppath/$dbname-$date.sql.gz   s3://${S3BUCKET}
# Test result of last command run
    if [ "$?" -ne "0" ]; then
        echo "Upload to AWS failed"
        exit 0
    fi
fi
echo "Backup file uploaded to AWS"
exit 1
