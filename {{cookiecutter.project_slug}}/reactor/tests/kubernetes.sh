#=======================
# Kubernetes execution
#=======================
#
# Search path
#
# test_{environment}_{phase}
# test_{environment}
# test_{phase}
# test_all
#

function test_kubernetes_status () {
  function verify_core_status () {
    run kubectl cluster-info
    verify_output "\s*Kubernetes control plane\s+is running\s+"
    verify_output "\s*CoreDNS\s+is running\s+"
  }
  wait verify_core_status 10
}

function test_kubernetes_config () {
  function verify_core_config () {
    verify_config argocd argocd-cm \
      url "https://${ARGOCD_DOMAIN}"

    verify_config argocd argocd-cm \
      admin.enabled true

    verify_config argocd argocd-cm \
      exec.enabled true

    verify_config argocd argocd-cm \
      server.rbac.log.enforce.enable true

    verify_config argocd argocd-cm \
      application.instanceLabelKey "argocd.argoproj.io/instance"

    verify_config argocd argocd-cm \
      timeout.hard.reconciliation "0s"

    verify_config argocd argocd-cm \
      timeout.reconciliation "180s"
  }
  wait verify_core_config 10
}

function test_kubernetes_secrets () {
  function verify_core_secrets () {
    cert_environment

    verify_secret argocd origin-cert \
      server.key "${APP_KEY//$'\n'/ }"

    verify_secret argocd origin-cert \
      server.crt "${APP_CERT//$'\n'/ }"

    verify_secret argocd argocd-secret \
      server.secretkey "$ARGOCD_SERVER_SECRET"
  }
  wait verify_core_secrets 10
}

function test_kubernetes_pods () {
  function verify_core_pods () {
    verify_pods_running kube-system \
      "coredns" \
      "etcd-[a-zA-Z0-9\-\_]+" \
      "kube-proxy" \
      "kube-apiserver-[a-zA-Z0-9\-\_]+" \
      "kube-scheduler-[a-zA-Z0-9\-\_]+" \
      "kube-controller-manager-[a-zA-Z0-9\-\_]+" \
      "metrics-server" \
      "storage-provisioner"

    verify_pods_running kubernetes-dashboard \
      "dashboard-metrics-scraper" \
      "kubernetes-dashboard"

    verify_pods_running nginx \
      "nginx-nginx-ingress-controller" \
      "nginx-nginx-ingress-controller-default-backend"

    verify_pods_running argocd \
      "argocd-redis" \
      "argocd-dex-server" \
      "argocd-server" \
      "argocd-repo-server" \
      "argocd-application-controller" \
      "argocd-applicationset-controller" \
      "argocd-notifications-controller"

    verify_pods_running reloader \
      "reloader-reloader"
  }
  wait verify_core_pods 10
}

function test_kubernetes_services () {
  function verify_core_services () {
    verify_internal_services kube-system \
      "kube-dns" \
      "metrics-server"

    verify_internal_services default \
      "kubernetes"

    verify_internal_services kubernetes-dashboard \
      "dashboard-metrics-scraper" \
      "kubernetes-dashboard"

    verify_internal_services nginx \
      "nginx-nginx-ingress-controller-default-backend"

    verify_external_services nginx \
      "nginx-nginx-ingress-controller"

    verify_internal_services argocd \
      "argocd-redis" \
      "argocd-dex-server" \
      "argocd-server" \
      "argocd-repo-server" \
      "argocd-applicationset-controller"
  }
  wait verify_core_services 10
}

function test_kubernetes_ingress () {
  function verify_core_ingress () {
    verify_ingress argocd argocd-server "$ARGOCD_DOMAIN" 80 443
  }
  wait verify_core_ingress 10
}

function test_running () {
  tag system monitoring kubernetes

  add_tag config settings
  run_test test_kubernetes_config

  add_tag secrets settings
  run_test test_kubernetes_secrets

  add_tag status
  run_test test_kubernetes_status

  add_tag pod
  run_test test_kubernetes_pods

  add_tag service
  run_test test_kubernetes_services

  add_tag ingress dns
  run_test test_kubernetes_ingress
}
