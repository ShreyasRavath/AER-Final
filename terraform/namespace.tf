resource "kubernetes_namespace" "sock_shop_primary" {
  provider = kubernetes.primary
  metadata {
    name = "sock-shop"
    labels = {
      environment = "dev"
      region      = var.primary_region
    }
  }
}

resource "kubernetes_namespace" "sock_shop_standby" {
  provider = kubernetes.standby
  metadata {
    name = "sock-shop"
    labels = {
      environment = "dev"
      region      = var.standby_region
    }
  }
}
