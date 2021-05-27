terraform {
  required_version = ">= 0.15"
}

data "aws_region" "current" {}

resource "aws_alb" "alb" {

}

resource "aws_ecs_cluster" "playground" {
  name = "DeFi Playground"
}

resource "aws_ecs_service" "playground" {
  name    = "playground"
  cluster = aws_ecs_cluster.playground.id

  task_definition = aws_ecs_task_definition.playground.arn

  deployment_minimum_healthy_percent = 0
  deployment_maximum_percent         = 100
  desired_count                      = 1

  launch_type         = "FARGATE"
  scheduling_strategy = "DAEMON"

  load_balancer {
    target_group_arn = "" // TODO(fuxingloh):
    container_name   = "playground"
    container_port   = 3000
  }

  load_balancer {
    target_group_arn = "" // TODO(fuxingloh):
    container_name   = "whale"
    container_port   = 3000
  }

  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "playground" {
  family = "playground"

  task_role_arn      = aws_iam_role.task_role.arn
  execution_role_arn = aws_iam_role.execution_role.arn

  container_definitions = <<-EOF
[
  ${module.ecs_container_definition_ain.json_map_encoded},
  ${module.ecs_container_definition_playground.json_map_encoded},
  ${module.ecs_container_definition_whale.json_map_encoded}
]
EOF
}

