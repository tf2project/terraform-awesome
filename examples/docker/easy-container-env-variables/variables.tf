variable redis_memory {
  default = 1024
}
variable redis_cpu_shares {
  default = 2
}
variable redis_ARGS {
  default = "--requirepass redis-stack"
}