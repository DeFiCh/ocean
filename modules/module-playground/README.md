# AWS VPC Peering Terraform module

Terraform module which creates [VPC Peering](https://docs.aws.amazon.com/vpc/latest/peering/what-is-vpc-peering.html) on AWS for all 18 regions effectively forming a mesh network.
This module is written such that it will only peering with regions that is included in the module list.

#### Why is this created?
For an 18 regions peered vpc network, you need to create 612 resources and manually map them yourself.
This module does it for you.

#### These types of resources will be created
* [VPC Peering Connection](https://www.terraform.io/docs/providers/aws/r/vpc_peering_connection.html)
* [VPC Peering Connection Accepter](https://www.terraform.io/docs/providers/aws/r/vpc_peering_connection_accepter.html)
* [VPC Route](https://www.terraform.io/docs/providers/aws/r/route.html)

#### These types of resources is not yet supported
* `aws_vpc_peering_connection_options`

## Supported regions
* us-east-1
* us-east-2
* us-west-1
* us-west-2
* ap-east-1
* ap-south-1
* ap-northeast-2
* ap-southeast-1
* ap-southeast-2
* ap-northeast-1
* ca-central-1
* eu-central-1
* eu-west-1
* eu-west-2
* eu-west-3
* eu-north-1
* me-south-1
* sa-east-1

## Terraform versions

Terraform version `0.12` only.

## Usage example
**You need to provide all 18 regions even if you don't use them. This is required for resource tracking.**

```hcl-terraform
module "peering" {
  tags = {
    Terraform = "true"
  }

  providers = {
    aws.us-east-1 = aws.us-east-1
    aws.us-east-2 = aws.us-east-2
    aws.us-west-1 = aws.us-west-1
    aws.us-west-2 = aws.us-west-2

    aws.ap-east-1 = aws.ap-east-1
    aws.ap-south-1 = aws.ap-south-1

    aws.ap-northeast-2 = aws.ap-northeast-2
    aws.ap-southeast-1 = aws.ap-southeast-1
    aws.ap-southeast-2 = aws.ap-southeast-2
    aws.ap-northeast-1 = aws.ap-northeast-1

    aws.ca-central-1 = aws.ca-central-1

    aws.eu-central-1 = aws.eu-central-1
    aws.eu-west-1 = aws.eu-west-1
    aws.eu-west-2 = aws.eu-west-2
    aws.eu-west-3 = aws.eu-west-3
    aws.eu-north-1 = aws.eu-north-1

    aws.me-south-1 = aws.me-south-1

    aws.sa-east-1 = aws.sa-east-1
  }

  us-east-1 = {
    vpc_id = module.vpc-us-east-1.vpc_id,
    route_table_id = module.vpc-us-east-1.private_route_table_ids[0],
    cidr_block = module.vpc-us-east-1.vpc_cidr_block,
  }

  us-east-2 = {
    vpc_id = module.vpc-us-east-2.vpc_id,
    route_table_id = module.vpc-us-east-2.private_route_table_ids[0],
    cidr_block = module.vpc-us-east-2.vpc_cidr_block,
  }
}
```

## Inputs

| Name | Description |
|------|-------------|
| tags | Tags to attach to all VPC peering resources. (Optional) |
| us-east-1 | US-EAST-1 Region for peering. (Optional) |
| us-east-2 | US-EAST-2 Region for peering. (Optional) |
| us-west-1 | US-WEST-1 Region for peering. (Optional) |
| us-west-2 | US-WEST-2 Region for peering. (Optional) |
| ap-east-1 | AP-EAST-1 Region for peering. (Optional) |
| ap-south-1 | AP-SOUTH-1 Region for peering. (Optional) |
| ap-northeast-2 | AP-NORTHEAST-2 Region for peering. (Optional) |
| ap-southeast-1 | AP-SOUTHEAST-1 Region for peering. (Optional) |
| ap-southeast-2 | AP-SOUTHEAST-2 Region for peering. (Optional) |
| ap-northeast-1 | AP-NORTHEAST-1 Region for peering. (Optional) |
| ca-central-1 | CA-CENTRAL-1 Region for peering. (Optional) |
| eu-central-1 | EU-CENTRAL-1 Region for peering. (Optional) |
| eu-west-1 | EU-WEST-1 Region for peering. (Optional) |
| eu-west-2 | EU-WEST-2 Region for peering. (Optional) |
| eu-west-3 | EU-WEST-3 Region for peering. (Optional) |
| eu-north-1 | EU-NORTH-1 Region for peering. (Optional) |
| me-south-1 | ME-SOUTH-1 Region for peering. (Optional) |
| sa-east-1 | SA-EAST-1 Region for peering. (Optional) |

## Outputs

None
