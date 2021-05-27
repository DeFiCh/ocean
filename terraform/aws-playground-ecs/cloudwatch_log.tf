locals {
  awslogs = {
    group  = aws_cloudwatch_log_group.ecs.name
    region = data.aws_region.current.name
  }
}

resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/aws-playground-ecs"
  retention_in_days = 7
}
