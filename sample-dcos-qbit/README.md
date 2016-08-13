


#### DCOS commands
```
#Log into dcos after running env script for correct server
dcos auth login


#show app list
dcos marathon app list


#install cassandra framework/service
dcos package install cassandra

#show cassandra connection information
dcos cassandra connection

#List mesos tasks
dcos task

#Log into master node
ssh-add ~/.ssh/US-WEST-2-KEY-MYCOMPANY-001-D.pem
dcos node ssh --master-proxy --leader

```

#### Build and deploy Java zip
```
gradle clean build distZip
aws s3 cp  ./build/distributions/sample-dcos-0.9.4.zip  s3://sample-deploy --acl public-read
```

#### Build and deploy to mesos
```
gradle clean build distZip
aws s3 cp  ./build/distributions/sample-dcos-0.9.4.zip  s3://sample-deploy --acl public-read
dcos marathon app add mesos-deploy.json
```


