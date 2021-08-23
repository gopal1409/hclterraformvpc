module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.3.0"
  # insert the 3 required variables here
  name = "private-sg"
  description = "Security Group with HTTP and SSH Port Open for entire vpc"
  vpc_id = module.vpc.vpc_id
  #ingress rule and CIDR block
  ingress_rule = ["ssh-tcp","http-80-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  egress_rules = ["all-all"]
  tag = local.common_tags
}