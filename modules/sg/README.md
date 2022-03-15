# Security group

This module creates public, private and private for database security groups with rules according to input parameters.

### Input variables

- `vpc_id`: VPC ID (string)
- `public_inbound`: Rules for SG public_inbound (map(any))
- `public_outbound`: Rules for SG public_outbound (map(any))
- `private_inbound`: Rules for SG private_inbound (map(any))
- `private_outbound`: Rules for SG private_outbound (map(any))
- `private_db_inbound`: Rules for SG private_db_inbound (map(any))
- `private_db_outbound`: Rules for SG private_db_outbound (map(any))

JSON structure for `public_inbound`, `public_outbound`, `private_inbound`, `private_outbound`, `private_db_inbound`, `private_db_outbound` is the same. See example below.
```json
public_inbound = {
  rule_name = {
    protocol   = "tcp"
    from_port  = 80
    to_port    = 80
    cidr_block = "0.0.0.0/0"
  }
}
```

### Outputs

- `sg_public`: ID of the public SG
- `sg_private`: ID of the private SG
- `sg_private_db`: ID of the private_db SG