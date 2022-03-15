# Subnet

This module creates public and private subnets according to input parameters.

### Input variables

- `azs`: The number of AZs (number)
- `vpc_id`: VPC ID (string)
- `subnets_public`: Set of availability zones in current region (list(string))
- `subnets_private`: subnets_private (list(string))

### Outputs

- `availability_zones`: The list of availability zones according with input number
- `subnets_public`: IDs of the public subnets
- `subnets_private`: IDs of the all private subnets
- `subnets_private_ec2`: IDs of the ec2 private subnets
- `subnets_private_db`: IDs of the DB private subnets