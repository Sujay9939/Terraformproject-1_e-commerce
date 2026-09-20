variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "launch_template_id" {
  type = string
}

variable "launch_template_version" {
  type = string
}

variable "private_app_subnet_ids" {
  type = list(string)
}

variable "target_group_arn" {
  type = string
}

variable "min_size" {
  type    = number
  default = 2
}

variable "max_size" {
  type    = number
  default = 4
}

variable "desired_capacity" {
  type    = number
  default = 2
}
