# https://github.com/ssbostan/terraform-awesome

variable "config_context" {
  type        = string
  default     = "contextname"
  description = "Config Context name for connecting to cluster"
}

variable "replicas_number" {
  type        = number
  default     = 1
  description = "Number of replicas"
}

variable "max_unavailable_number" {
  type        = number
  default     = 1
  description = "The maximum number of pods that can be unavailable during the update"
}

variable "max_surge_number" {
  type        = number
  default     = 1
  description = "The maximum number of pods that can be scheduled above the desired number of pods"
}

variable "deployment_namespace" {
  type        = string
  default     = "ingress-nginx"
  description = "Namespace of deployment"
}

variable "container_name" {
  type        = string
  default     = "nginx"
  description = "Name of Container"
}

variable "app_label" {
  type        = string
  default     = "nginx"
  description = "Label name of deployment"
}