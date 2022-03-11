resource "aws_db_subnet_group" "cloudx" {
  name       = var.name
  subnet_ids = var.subnets_private_db

  tags = merge(var.tags_common, {Name = "${var.name}"})
}

resource "aws_db_instance" "cloudx" {
  availability_zone    = var.availability_zone_primary
  allocated_storage    = var.allocated_storage
  backup_retention_period = var.backup_retention_period
  db_name              = var.name
  db_subnet_group_name = aws_db_subnet_group.cloudx.name
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  #multi_az               = true
  username               = var.username
  password               = var.db_password
  parameter_group_name   = var.parameter_group_name
  skip_final_snapshot    = true
  storage_type           = var.storage_type
  vpc_security_group_ids = [var.sg_private_db]

  tags = merge(var.tags_common, {Name = "${var.name}"})
}

resource "aws_db_instance" "cloudx_replica1" {
  availability_zone    = var.availability_zone_replica1
  allocated_storage    = var.allocated_storage
  #db_name              = var.name
  #db_subnet_group_name = aws_db_subnet_group.cloudx.name
  #engine               = var.engine
  #engine_version       = var.engine_version
  instance_class       = var.instance_class
  #multi_az               = true
  #username               = var.username
  #password               = var.db_password
  parameter_group_name   = var.parameter_group_name
  replicate_source_db    = aws_db_instance.cloudx.id
  skip_final_snapshot    = true
  storage_type           = var.storage_type
  vpc_security_group_ids = [var.sg_private_db]

  tags = merge(var.tags_common, {Name = "${var.name}-replica1"})
}

resource "aws_db_instance" "cloudx_replica2" {
  availability_zone    = var.availability_zone_replica2
  allocated_storage    = var.allocated_storage
  #db_name              = var.name
  #db_subnet_group_name = aws_db_subnet_group.cloudx.name
  #engine               = var.engine
  #engine_version       = var.engine_version
  instance_class       = var.instance_class
  #multi_az               = true
  #username               = var.username
  #password               = var.db_password
  parameter_group_name   = var.parameter_group_name
  replicate_source_db    = aws_db_instance.cloudx.id
  skip_final_snapshot    = true
  storage_type           = var.storage_type
  vpc_security_group_ids = [var.sg_private_db]

  tags = merge(var.tags_common, {Name = "${var.name}-replica1"})
}
