variable "cluster_name" {
  type        = string
  description = "GKE Cluster Name"
}

variable "cluster_endpoint" {
  type        = string
  description = "GKE endpoint"
}

variable "cluster_client_ca_cert" {
  type        = string
  description = "GKE CA Cert"
}
