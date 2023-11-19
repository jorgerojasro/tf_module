resource "kubernetes_service_account" "argocd_manager" {
  metadata {
    name      = "argocd-manager"
    namespace = "kube-system"
  }
}

resource "kubernetes_secret" "argocd_manager" {
  metadata {
    annotations = {
      "kubernetes.io/service-account.name" = kubernetes_service_account.argocd_manager.metadata[0].name
    }
    name      = kubernetes_service_account.argocd_manager.metadata[0].name
    namespace = kubernetes_service_account.argocd_manager.metadata[0].namespace
  }
  type = "kubernetes.io/service-account-token"
}

resource "kubernetes_cluster_role" "argocd_manager" {
  # checkov:skip=CKV_K8S_49: ADD REASON
  metadata {
    name = "argocd-manager-role"
  }

  rule {
    api_groups = ["*"]
    resources  = ["*"]
    verbs      = ["*"]
  }

  rule {
    non_resource_urls = ["*"]
    verbs             = ["*"]
  }
}

resource "kubernetes_cluster_role_binding" "argocd_manager" {
  metadata {
    name = "argocd-manager-role-binding"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role.argocd_manager.metadata[0].name
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.argocd_manager.metadata[0].name
    namespace = kubernetes_service_account.argocd_manager.metadata[0].namespace
  }
}



resource "argocd_cluster" "gke" {
  server = format("https://%s", var.cluster_endpoint)
  name   = var.cluster_name

  config {
    bearer_token = kubernetes_secret.argocd_manager.data["token"]
    tls_client_config {
      ca_data = base64decode(var.cluster_client_ca_cert)
    }
  }
}
