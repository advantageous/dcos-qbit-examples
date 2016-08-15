


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


#### Remove a service
```
dcos marathon app remove sample-dcos2
```

#### Read Todos
```
curl http://public-slave:10101/v1/todo-service/todo
```
In this case, I set an entry in /etc/hosts for the public-slave for my DCOS instance.


#### Add a TODO
```
 curl -X POST http://public-slave:10101/v1/todo-service/todo \
 -d '{"name":"todo", "description":"hi", "id":"abc", "createdTime":1234}' -H "Content-type: application/json"
```


#### Query downstream services
```
 curl -X POST http://public-slave:10101/v1/todo-service/service  \ 
 -d '"discovery:dns:A:///sample-dcos2.marathon.mesos?port=8080"' -H "Content-type: application/json" | jq .
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   152  100    94  100    58    455    280 --:--:-- --:--:-- --:--:--   460
[
  "service://10.16.204.92:8080/",
  "service://10.16.204.94:8080/",
  "service://10.16.204.95:8080/"
]


```

