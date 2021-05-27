module "ecs_container_definition_playground" {
  source  = "cloudposse/ecs-container-definition/aws"
  version = "0.56.0"

  container_name               = "whale"
  container_image              = "ghcr.io/defich/playground:${var.playground_version}"
  container_memory_reservation = 128 // TODO(fuxingloh): need to tune for production

  essential = true

  links = [
    "ain:ain"
  ]

  environment = [
    {
      name  = "PLAYGROUND_DEFID_URL"
      value = "http://playground:playground@ain:19554"
    }
  ]

  log_configuration = {
    logDriver = "awslogs"
    options = {
      awslogs-group         = local.awslogs.group
      awslogs-region        = local.awslogs.region
      awslogs-stream-prefix = "playground"
    }
  }
}
