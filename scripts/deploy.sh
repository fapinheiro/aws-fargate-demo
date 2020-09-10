#!/bin/bash
ecs-cli compose \
    --project-name tibco-ems service \
    up \
    --create-log-groups \
    --cluster cib-cross-service-fargate \
    --launch-type FARGATE \
    --region eu-west-2 \
    --aws-profile default
    