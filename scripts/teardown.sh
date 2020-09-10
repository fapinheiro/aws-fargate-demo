#!/bin/bash
ecs-cli compose \
    --project-name tibco-ems service \
    down \
    --cluster cib-cross-service-fargate \
    --region eu-west-2 \
    --aws-profile default