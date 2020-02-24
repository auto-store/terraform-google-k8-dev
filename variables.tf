variable "cluster_name" {
  description = "name of GKE cluster"
  type        = string
}

variable "location" {
  description = "location of cluster"
  type        = string
}

variable "pool_name" {
  description = "node pool name"
  type        = string
}

variable "type" {
  description = "size of machine"
  type        = string
  default     = "n1-standard-1"
}

variable "node_count" {
  description = "number of worker nodes"
  type        = number
}

variable "default_project" {
  description = "provider default project"
  type = string 
}