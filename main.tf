# main.tf

provider "aws" {
  region = "eu-central-1" # Change to your preferred region
}

# Create security group RDS
resource "aws_security_group" "my_security_group" {
  vpc_id = "vpc-0cb0a7cc3a19165f8" # Change to your VPC ID
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "jam2-security-group-opti"
  }
}

## RDS ##
resource "aws_db_parameter_group" "rds" {
  name = "jam2-pgsql-parameter-group"
  family = var.db_parameter_group_family

  dynamic "parameter" {
    for_each = var.db_parameters.postgres
    content {
      name         = parameter.key
      value        = parameter.value.value
      apply_method = parameter.value.apply_method
    }
  }

    lifecycle {
    create_before_destroy = true #https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group#create_before_destroy-lifecycle-configuration
  }
}

# Create RDS PostgreSQL instance
resource "aws_db_instance" "my_db_instance" {
  identifier     = var.rds_identifier
  instance_class = var.instance_class

  # General
  db_name              = "Jam2PGSQLLab"
  engine                = var.db_engine
  engine_version        = var.db_engine_version
  username             = "postgres"
  password             = "demoPassword1!"
  allocated_storage     = var.db_allocated_storage
  parameter_group_name = aws_db_parameter_group.rds.name
  option_group_name    = var.db_option_group
  availability_zone    = var.availability_zone
  ca_cert_identifier   = var.db_ca_cert_identifier
  performance_insights_enabled = true
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  db_subnet_group_name   = "default"
  skip_final_snapshot   = true

  # Storage
  storage_type          = var.db_iops > 0 ? "io1" : var.db_storage_type # Swap to io1 if iops are greater than 0 since AWS doesn't support it on GP2
  #allocated_storage     = local.replication_snapshot_bool ? null : var.db_allocated_storage
  max_allocated_storage = var.db_max_allocated_storage
  iops                  = var.db_iops
  storage_encrypted     = var.db_encryption

}


# Data source to get availability zones in the region
data "aws_availability_zones" "available" {}