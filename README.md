# ALB_HTTP_RULE_BASED
ALB_HTTP_RULE_BASED_TERRAFORM_CODE

What is there in the code?

1. We have this three tier architecture designed to provide HA - AZ's, SCALING - AUTO-SCALING used.
2. we created a VPC.
3. with Two AZ's created and launched
4. Created Public subnets, and 2 private subnets - one for app and one for DB
5. created IGW and attached to the vpc
6. created public and private route table
7. added the public subnets to the public route table, and private to the private route table
8. attached the IGW to the public route table
9. created NAT gateway, which will be attached to the public subnets
10. Allocate EIP by creating and associate it to the NAT GW
11. In the private route table, we need to add the NAT GW, and as the new route 0.0.0.0/0
12. Created Application load balancer with http listerns, and added the http port 80 rule, and added with the target groups
13. For the target groups we associated the two private instances that we have created to it, and then added the target groups to the application
load balancer
14. We have added the new SG's to the ALB that has the port 80 - ingress, and egress rule - as all
15. We have seperate outputs for - Security groups, VPC, Ec2 instances(public, private), We have this null provisioners that will configure after creation of the instances, and ALB SG -with its outputs
16. We have SG for both private - 80,22, and public instances - 22
17. In this ALB.tf, we have this LB type, VPC connected, subnets and AZ associations, listeners, TG's and port allowed.
18. And last - we have this Ec2-auto-vars, and vpc-auto-vars for auto assiging of the varaibles when the apply comnmand is actioned.



![image](https://user-images.githubusercontent.com/103397110/230756046-c3b98aa1-f5ac-429a-8588-a41740eb6ba6.png)

Note: here the [].id should be used for adding the instances to the target groups

![image](https://user-images.githubusercontent.com/103397110/230756094-f22debf5-bc6a-4993-ad90-65f521d63fc8.png)

![image](https://user-images.githubusercontent.com/103397110/230756114-14da0c73-41b8-4fc9-b4a2-d09391336a5d.png)

- here we need to provide the instance number indexes



