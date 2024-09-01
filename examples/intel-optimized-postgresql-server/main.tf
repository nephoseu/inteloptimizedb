
# Provision Intel Optimized AWS PostgreSQL server in the default vpc of the selected AWS region
module "optimized-postgres-server-m6i" {
  source         = "intel/aws-postgresql/intel"
  rds_identifier = "postgres-m6i"
  db_password    = var.db_password
  # Update the vpc_id below for the VPC that this module will use. Find the default vpc-id in your AWS account
  # from the AWS console or using CLI commands. In your AWS account, the vpc-id is represented as "vpc-",
  # followed by a set of alphanumeric characters. One sample representation of a vpc-id is vpc-0a6734z932p20c2m4
  vpc_id = "<YOUR_VPC_ID>"
  db_engine_version ="14"
  db_publicly_accessible = true
  instance_class = "db.m6i.2xlarge"
}
module "optimized-postgres-server-m6id" {
  source         = "intel/aws-postgresql/intel"
  rds_identifier = "postgres-m6id"
  db_password    = var.db_password
  # Update the vpc_id below for the VPC that this module will use. Find the default vpc-id in your AWS account
  # from the AWS console or using CLI commands. In your AWS account, the vpc-id is represented as "vpc-",
  # followed by a set of alphanumeric characters. One sample representation of a vpc-id is vpc-0a6734z932p20c2m4
  vpc_id = "<YOUR_VPC_ID>"
  instance_class = "db.m6id.2xlarge"
  db_engine_version ="14"
  db_publicly_accessible = true
}
module "optimized-postgres-server-m5" {
  source         = "intel/aws-postgresql/intel"
  rds_identifier = "postgres-m5"
  db_password    = var.db_password
  # Update the vpc_id below for the VPC that this module will use. Find the default vpc-id in your AWS account
  # from the AWS console or using CLI commands. In your AWS account, the vpc-id is represented as "vpc-",
  # followed by a set of alphanumeric characters. One sample representation of a vpc-id is vpc-0a6734z932p20c2m4
  vpc_id = "<YOUR_VPC_ID>"
  instance_class = "db.m5.2xlarge"
  db_engine_version ="14"
  db_publicly_accessible = true
}
module "optimized-postgres-server-m5d" {
  source         = "intel/aws-postgresql/intel"
  rds_identifier = "postgres-m5d"
  db_password    = var.db_password
  # Update the vpc_id below for the VPC that this module will use. Find the default vpc-id in your AWS account
  # from the AWS console or using CLI commands. In your AWS account, the vpc-id is represented as "vpc-",
  # followed by a set of alphanumeric characters. One sample representation of a vpc-id is vpc-0a6734z932p20c2m4
  vpc_id = "<YOUR_VPC_ID>"
  instance_class = "db.m5d.2xlarge"
  db_engine_version ="14"
  db_publicly_accessible = true
}