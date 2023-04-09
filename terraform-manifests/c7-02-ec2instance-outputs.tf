# AWS EC2 Instance Terraform Outputs
# Public EC2 Instances - Bastion Host

## ec2_bastion_public_instance_ids
output "ec2_bastion_public_instance_ids" {
  description = "list of the instance ID"
  value       = module.bastion_ec2_instance.id #change 5 - here ids are used for list

}

## ec2_bastion_public_ip
output "ec2_basition_public_ip" {
  description = "list of bastion public ip"
  value       = module.bastion_ec2_instance.public_ip

}

# Private EC2 Instances
## ec2_private_instance_ids

output "ec2_private_instance_id" {
  description = "list of private instances id"
  value       = module.private_ec2_instance[*].id #change 6 - here ids are used for list

}

## ec2_private_ip

output "ec2_instance_private_ip" {
  description = "list of ec2 instance private ip"
  value       = module.private_ec2_instance[*].private_ip #change 7 - here ids are used for list

}


