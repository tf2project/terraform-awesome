variable "nginx_host_volume" {
  description = "Nginx docker host volume"
  type        = string
  default     = "/var/lib/docker/volumes"
}


variable "nginx_container_volume_mount" {
  description = "nginx docker container volume"
  type        = string
  default     = "/var/lib/docker/volumes"
}
