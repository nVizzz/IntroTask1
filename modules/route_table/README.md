# Route table

This module creates one public route table for all public subnets and `n` private route tables according to the nuber of availability zones set in `azs` variable of the root module. All traffic in public route table is routed via IGW. All traffic in each private subnet is routed via corresponding NAT gateway.

### Input variables

- `availability_zones`: The list of availability zones according with input number (list(string))
- `subnets_public`: Subnets IDs from subnet module (list(string))
- `subnets_private`: Subnets IDs from subnet module (list(string))
- `subnets_private`: subnets_private (list(string))
- `azs`: The number of AZs (number)
- `vpc_id`: VPC ID (string)
- `subnets_public`: Set of availability zones in current region (list(string))

### Outputs

- `availability_zones`: The list of availability zones according with input number
- `subnets_public`: IDs of the public subnets