# engage-ci-cd-aws-setup

AWS CI/CD Setup for Engage API.

## AWS Services

- ECR
- ECS
- CodeBuild
- CodeDeploy
- CloudFormation
- EKS \* Under Evaluation <br />
  <em>For demo purpose some files are available under K8s folder.</em>

---

## Creation Steps to Deploy using ECS

1. Create VPC

```sh
aws cloudformation deploy --template vpc-cf.yml --stack-name engage-deploy --parameter-overrides EnvironmentName=engage-api
```

2. Create Load Balancer

```sh
aws cloudformation deploy --template load-balancer-cf.yml --stack-name engage-elb --parameter-overrides EnvironmentName=engage-api
```

3. Create ECS Cluster

```sh
aws ecs create-cluster --cluster-name engage-api-cluster
```

4. Register a Task at ECS

```sh
aws ecs register-task-definition --cli-input-json file://ecs-taskdef.json
```

5. Create a Service based on the created Task

```sh
aws ecs register-task-definition --cli-input-json file://ecs-taskdef.json
```

---

## Validation Steps

1. List Created Services

```sh
aws ecs list-services --cluster engage-api-cluster
```

2. Describe de Cluster

```sh
aws ecs describe-services --cluster engage-api-cluster --services engage-api-service
```

3. Access the Application using Load Balancer URL

---

## License

**engage-ci-cd-aws-setup** is licensed under an Apache-2.0 license
