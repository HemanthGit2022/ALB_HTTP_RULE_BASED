# AWS EC2 Instance Terraform Module
# EC2 Instances that will be created in VPC Private Subnets

module "private_ec2_instance" {

  depends_on = [module.vpc]
  source     = "terraform-aws-modules/ec2-instance/aws"
  #version = "2.17.0"

  name = "${var.environment}-privateEc2Instance"

  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  monitoring    = false

  #vpc_security_group_ids = [module.private_sg.security_group_id]
  vpc_security_group_ids = [module.private_sg.security_group_id] #change 9 - calling security group_id not wtih this
  count                  = var.private_instance_count
  subnet_id              = module.vpc.private_subnets[0] # as the count is used - 2 we are calling 2 subnets
  user_data              = file("${path.module}/app1-install.sh")
  tags                   = local.common_tags
}


#This is the SG variable reference from the public subents output file
#vpc_security_group_ids = [module.private_sg.security_group_id]


