#!/usr/bin/env bash


dcos marathon app remove sample-dcos3
gradle clean build distZip
aws s3 cp  ./build/distributions/sample-dcos-cas-0.9.5.zip  s3://sample-deploy --acl public-read
dcos marathon app add mesos-deploy.json
