# AWS Playground ECS

> **DeFi Ocean** - Globally distributed and decentralized DeFiChain node infrastructure as code.

Terraform module which creates [DeFi Playground](https://github.com/DeFiCh/playground) on AWS with ECS. This module
deals with the end to end natural of 

#### These types of resources will be created

- [aws_ecs_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster)

## Terraform versions

Terraform version `>=0.15` only.

## Usage example

```hcl-terraform
module "aws-playground-ecs" {
  source = "github.com/defich/ocean//terraform/aws-playground-ecs"
}
```

## Inputs

| Name                        | Description
|-----------------------------|-------------
| playground_version          | DeFiCh/playground docker image tag to use. (Optional)
| whale_version               | DeFiCh/whale docker image tag to use. (Optional)
| ain_version                 | DeFiCh/ain docker image tag to use. (Optional)

## Outputs

| Name                        | Description
|-----------------------------|-------------
| ALB IP Address              |
| ALB 
