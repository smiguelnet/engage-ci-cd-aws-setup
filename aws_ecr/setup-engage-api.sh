#!/bin/bash

# *** Useful commands ***

# ==========================================================
# CREATE AWS: VPC
aws cloudformation deploy --template vpc-cf.yml --stack-name engage-deploy --parameter-overrides EnvironmentName=engage-api

# DELETE AWS: VPC
aws cloudformation delete-stack --stack-name engage-deploy

# ==========================================================
# CREATE AWS: LOAD BALANCER
aws cloudformation deploy --template load-balancer-cf.yml --stack-name engage-elb --parameter-overrides EnvironmentName=engage-api

# DELETE AWS: LOAD BALANCER
aws cloudformation delete-stack --stack-name engage-elb

# ==========================================================
# AWS: ECS CLUSTER

# CREATE A CLUSTER
aws ecs create-cluster --cluster-name engage-api-cluster

# REGISTER A TASK
aws ecs register-task-definition --cli-input-json file://ecs-taskdef.json

# LIST TASK DEFINITION
aws ecs list-task-definitions

# CREATE SERVICE
aws ecs create-service --service-name engage-api-service --cli-input-json file://ecs-create-service.json

# LIST SERVICES
aws ecs list-services --cluster engage-api-cluster

# DESCRIBE CLUSTER
aws ecs describe-services --cluster engage-api-cluster --services engage-api-service

