variable "tags_common" {
  description = "Common tags for all resources"
}

variable "vpc_id" {
  description = "VPC ID"
  type = string
  default = "CloudX"
}

variable "subnets_pub" {
   type = map
   default = {
      a = {
         name = "public_a"
         az = "us-east-1a"
         cidr = "10.10.11.0/24"
      }
      b = {
         name = "public_b"
         az = "us-east-1b"
         cidr = "10.10.12.0/24"
      }
      c = {
         name = "public_c"
         az = "us-east-1c"
         cidr = "10.10.13.0/24"
      }
   }
}

variable "subnets_priv" {
   type = map
   default = {
      a = {
         name = "private_a"
         az = "us-east-1a"
         cidr = "10.10.21.0/24"
      }
      b = {
         name = "private_b"
         az = "us-east-1b"
         cidr = "10.10.22.0/24"
      }
      c = {
         name = "private_c"
         az = "us-east-1c"
         cidr = "10.10.23.0/24"
      }
   }
}

variable "subnets_priv_db" {
   type = map
   default = {
      a = {
         name = "private_db_a"
         az = "us-east-1a"
         cidr = "10.10.31.0/24"
      }
      b = {
         name = "private_db_b"
         az = "us-east-1b"
         cidr = "10.10.32.0/24"
      }
      c = {
         name = "private_db_c"
         az = "us-east-1c"
         cidr = "10.10.33.0/24"
      }
   }
}