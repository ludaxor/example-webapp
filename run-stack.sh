#!/bin/bash -vx

aws cloudformation $ACTION \
    --region us-east-2 \
    --stack-name $STACK_NAME \
    --template-body file://service.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameters \
    ParameterKey=DockerImage,ParameterValue=247554193015.dkr.ecr.us-east-2.amazonaws.com/example-webapp-builder:$(git rev-parse HEAD) \
    ParameterKey=VPC,ParameterValue=vpc-dd1f06b5 \
    ParameterKey=Cluster,ParameterValue=default2 \
    ParameterKey=Listener,ParameterValue=arn:aws:elasticloadbalancing:us-east-2:247554193015:listener/app/production-website/0b12fd17ea748ae3/e29e3c6bce4896cf
