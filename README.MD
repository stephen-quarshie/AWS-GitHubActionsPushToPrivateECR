# Overview
Create a CI/CD pipeline in GitHub that will deploy a docker image into an ECR repo.
The pipeline will
1. deploy a CloudFormation template that creates an ECR repo
2. build a docker image
3. push the docker image to the ECR repo

## Pre-requisite
1. You have a GitHub account
2. You have an AWS account
3. You have followed steps to grant GitHub actions access to your AWS account. See this [GitHub repo](https://github.com/stephen-quarshie/AWS-GitHubActionsServiceRole)

## Getting Started
1. Clone the repo and push into the main branch of a repo in your GitHub account. 

Pipeline is kicked off with every push into main branch

