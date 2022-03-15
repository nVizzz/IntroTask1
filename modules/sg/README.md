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

### Outputs

- `sg_public`: ID of the public SG
- `sg_private`: ID of the private SG
- `sg_private_db`: ID of the private_db SG