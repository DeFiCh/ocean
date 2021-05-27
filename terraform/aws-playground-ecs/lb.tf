module "lb" {
  source = "terraform-aws-modules/alb/aws"

  load_balancer_type = "application"

  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.public_subnets
//  security_groups = [aws_security_group.cluster.id]

  target_groups = [
    {
      name_prefix      = "api-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      health_check = {
        enabled  = true
        interval = 30
        path     = "/_health/probes/readiness"
        port     = "traffic-port"
        protocol = "HTTP"
      }
    }
  ]

  https_listeners = [
    {
      port            = 443
      protocol        = "HTTPS"
//      certificate_arn = aws_acm_certificate_validation.api_cert.certificate_arn
    }
  ]

  http_tcp_listeners = [
    {
      port        = 80
      protocol    = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]
}
