#!/usr/bin/env bash


dcos marathon app remove sample-dcos2
gradle clean build distZip
aws s3 cp  ./build/distributions/sample-dcos-0.9.4.zip  s3://sample-deploy --acl public-read
dcos marathon app add mesos-deploy.json
