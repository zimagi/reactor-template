#
# ArgoCD environment configurations
#
export ARGOCD_PROJECT_SEQUENCE='[
  "system",
  "platform",
  "database",
  "management"
]'
#
# Cluster environment configurations
#
export GATEWAY_NODE_PORT="{{cookiecutter.ingress_node_port}}"
