crumb=$(curl -u "jenkins:Corp@123" -s 'http://inderpal2406-virtual-machine:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
echo $crumb
# curl -u "jenkins:Corp@123" -H "$crumb" -X POST http://inderpal2406-virtual-machine:8080/job/env-vars/build?delay=0sec
# curl -u "jenkins:Corp@123" -H "$crumb" -X POST http://inderpal2406-virtual-machine:8080/job/mysql-backup-to-aws/buildWithParameters?MYSQL_HOST=db_host&DATABASE_NAME=testdb&AWS_BUCKET_NAME=inder-jenkins-mysql-backup 
curl -u "jenkins:Corp@123" -H "$crumb" -X POST http://inderpal2406-virtual-machine:8080/job/ansible-users-db/buildWithParameters?AGE=21
