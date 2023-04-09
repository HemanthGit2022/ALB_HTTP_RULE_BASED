# Terraform AWS Application Load Balancer (ALB)
module "app-alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = "${local.name}-alb"
  #locad balancer type
  load_balancer_type = "application"
  #from which vpc
  vpc_id          = module.vpc.vpc_id
  subnets         = [module.vpc.public_subnets[0], module.vpc.private_subnets[1]]
  security_groups = [module.loadbalancer_sg.security_group_id]

  #this is the list of listeners too, can be added wtih one more
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]
  # App1 TG's 
  target_groups = [
    {
      name_prefix                       = "app1-"
      backend_protocol                  = "HTTP"
      backend_port                      = 80
      target_type                       = "instance"
      deregistration_delay              = 10
      load_balancing_cross_zone_enabled = false
      health_check = {
        enabled  = true
        interval = 30
        #this is the path check for health of instances
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      #app1 target groups - using the both private EC2 instances
      targets = {
        my_app1_vm1 = {
          target_id = module.private_ec2_instance[0].id  #change is [] then id to be used
          port      = 80
        },
        my_app1_vm2 = {
          target_id = module.private_ec2_instance[1].id
          port      = 80
        }
      }
      tags = local.common_tags #target group tags
    }
  ]
  tags = local.common_tags #ALB tags
}
