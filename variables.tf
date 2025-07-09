variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "example_project" 
}
variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
variable "environment" {
  description = "The environment (e.g., dev, prod)"
  type        = string
  default     = "dev"
}
variable "comman_tags" {
  description = "Common tags to apply to resources"
  type        = map(string)
  default     = {
    "Project"     = "expense",
    "Environment" = "dev",
    "Owner"       = "Mahesh"
  }
}
variable "outband_rules" {
  description = "List of outbound rules for the security group"
  type = list
  default = [
    {
      protocol = "tcp"
      from_port = 0
      to_port = 0
      protocol = "-1" # -1 means all protocols
      cidr_blocks = ["0.0.0.0/0"] 
    }
  ]
  
}
variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type = list
  default = []
}
variable "sg_tags" {
  description = "Tags specific to the security group"
  type        = map(string)
  default     = {}
}

variable "sg_description" {
  description = "Description for the security group"
  type        = string
  default     = "Security group for ${var.project_name} in ${var.environment} environment"
  
}
