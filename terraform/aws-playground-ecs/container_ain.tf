module "ecs_container_definition_ain" {
  source  = "cloudposse/ecs-container-definition/aws"
  version = "0.56.0"

  container_name               = "ain"
  container_image              = "defi/defichain:${var.ain_version}"
  container_memory_reservation = 128 // TODO(fuxingloh): need to tune for production

  essential = true

  command = [
    "defid",
    "-printtoconsole",
    "-rpcallowip=0.0.0.0/0",
    "-rpcbind=0.0.0.0",
    "-rpcuser=playground",
    "-rpcpassword=playground",
    "-masternode_operator=mswsMVsyGMj1FzDMbbxw2QW3KvQAv2FKiy",
    "-regtest=1",
    "-txnotokens=0",
    "-logtimemicros",
    "-txindex=1",
    "-acindex=1",
    "-amkheight=0",
    "-bayfrontheight=1",
    "-bayfrontgardensheight=2",
    "-clarkequayheight=3",
    "-dakotaheight=4",
    "-dakotacrescentheight=5",
    "-eunosheight=6",
  ]

  log_configuration = {
    logDriver = "awslogs"
    options = {
      awslogs-group         = local.awslogs.group
      awslogs-region        = local.awslogs.region
      awslogs-stream-prefix = "ain"
    }
  }
}
