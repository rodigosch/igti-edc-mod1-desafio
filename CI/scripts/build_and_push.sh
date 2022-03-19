#!/bin/bash
set -e

cd etl/

# Push to AWS ECR
aws ecr get-login-password --region sa-east-1 | docker login --username AWS --password-stdin 473297513108.dkr.ecr.sa-east-1.amazonaws.com
docker build -t igti-rodrigo-prod-extract-rais .
docker tag igti-rodrigo-prod-extract-rais:latest 473297513108.dkr.ecr.sa-east-1.amazonaws.com/igti-rodrigo-prod-extract-rais:latest
docker push 473297513108.dkr.ecr.sa-east-1.amazonaws.com/igti-rodrigo-prod-extract-rais:latest
