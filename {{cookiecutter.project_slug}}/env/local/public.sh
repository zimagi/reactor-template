#
# Cluster environment variables
#
# [template:minikube]: Minikube memory limit in KB
export MINIKUBE_MEMORY="{{cookiecutter.minikube_memory}}"
# [template:minikube]: Minikube ingress gateway node port
export GATEWAY_NODE_PORT="{{cookiecutter.gateway_node_port}}"

# [template:domains]: Root operations subdomain (lives under environment primary domain)
export OPERATIONS_SUBDOMAIN="{{cookiecutter.operations_subdomain}}"
# [template:domains]: Root authorization subdomain (lives under environment primary domain)
export AUTH_SUBDOMAIN="{{cookiecutter.auth_subdomain}}"

#
# ArgoCD environment variables
#
# ArgoCD project sequence (project directories processed in this order)
export ARGOCD_PROJECT_SEQUENCE='[
  "system",
  "platform",
  "database",
  "management"
]'
# [template:argocd]: ArgoCD Terraform provisioner project stage wait time
export PROJECT_UPDATE_WAIT="{{cookiecutter.project_update_wait}}"

#
# Implementation Providers
#
# Reactor provisioner provider (used for managing all Kubernetes resources)
export PROVISIONER_PROVIDER=terraform
# Reactor Kubernetes provider
export KUBERNETES_PROVIDER=minikube
# Reactor DNS provider
export DNS_PROVIDER=host

#
# Zimagi environment variables
#
# [template:zimagi]: Root Zimagi webservice subdomain (lives under environment primary domain)
export ZIMAGI_SUBDOMAIN="{{cookiecutter.zimagi_subdomain}}"

# [template:zimagi]: Zimagi development Docker tag
export ZIMAGI_DOCKER_TAG="{{cookiecutter.zimagi_docker_tag}}"
# [template:zimagi]: Zimagi base Docker image
export ZIMAGI_BASE_IMAGE="{{cookiecutter.zimagi_base_image}}"
# [template:zimagi]: Zimagi production Docker tag
export ZIMAGI_PROD_TAG="{{cookiecutter.zimagi_prod_tag}}"

# [template:zimagi]: Zimagi max PostgreSQL simultanious connections
export ZIMAGI_DB_MAX_CONNECTIONS="{{cookiecutter.zimagi_db_max_connections}}"
# [template:zimagi]: Zimagi parallel processing enabled
export ZIMAGI_PARALLEL="{{cookiecutter.zimagi_parallel}}"
# [template:zimagi]: Zimagi parallel thread count
export ZIMAGI_THREAD_COUNT="{{cookiecutter.zimagi_thread_count}}"
# [template:zimagi]: Zimagi platform mutex expiration in seconds
export ZIMAGI_MUTEX_TTL_SECONDS="{{cookiecutter.zimagi_mutex_ttl_seconds}}"

# [template:zimagi]: Zimagi debug mode enabled
export ZIMAGI_DEBUG="{{cookiecutter.zimagi_debug}}"
# [template:zimagi]: Zimagi debug command profiles mode enabled
export ZIMAGI_DEBUG_COMMAND_PROFILES="{{cookiecutter.zimagi_debug_command_profiles}}"
# [template:zimagi]: Zimagi log level (debug, info, warning, error)
export ZIMAGI_LOG_LEVEL="{{cookiecutter.zimagi_log_level}}"
# [template:zimagi]: Zimagi restart system services on module updates
export ZIMAGI_RESTART_SERVICES="{{cookiecutter.zimagi_restart_services}}"
# [template:zimagi]: Zimagi queue background commands to run on workers
export ZIMAGI_QUEUE_COMMANDS="{{cookiecutter.zimagi_queue_commands}}"

# [template:zimagi]: Zimagi auto update code base on the running containers as it changes
export ZIMAGI_AUTO_UPDATE="{{cookiecutter.zimagi_auto_update}}"

# [template:zimagi]: Zimagi API server request timeout
export ZIMAGI_SERVER_TIMEOUT="{{cookiecutter.zimagi_server_timeout}}"
# [template:zimagi]: Zimagi API server worker processes
export ZIMAGI_SERVER_WORKERS="{{cookiecutter.zimagi_server_workers}}"
# [template:zimagi]: Zimagi disable HTTPS (insecurely serve over HTTP)
export ZIMAGI_DISABLE_HTTPS="{{cookiecutter.zimagi_disable_https}}"
# [template:zimagi]: Zimagi encrypt command API endpoints and authentication processing
export ZIMAGI_ENCRYPT_COMMAND_API="{{cookiecutter.zimagi_encrypt_command_api}}"

# [template:zimagi]: Zimagi encrypt data API endpoints and authentication processing
export ZIMAGI_ENCRYPT_DATA_API="{{cookiecutter.zimagi_encrypt_data_api}}"
# [template:zimagi]: Zimagi disable data API page cache
export ZIMAGI_DISABLE_PAGE_CACHE="{{cookiecutter.zimagi_disable_page_cache}}"
# [template:zimagi]: Zimagi data API page cache expiration in seconds
export ZIMAGI_PAGE_CACHE_SECONDS="{{cookiecutter.zimagi_page_cache_seconds}}"
# [template:zimagi]: Zimagi default data API list page item count
export ZIMAGI_REST_PAGE_COUNT="{{cookiecutter.zimagi_rest_page_count}}"

# [template:zimagi]: Zimagi worker max processes
export ZIMAGI_WORKER_MAX_PROCESSES="{{cookiecutter.zimagi_worker_max_processes}}"
# [template:zimagi]: Zimagi worker lifetime when inactive (no active, reserved, or available tasks)
export ZIMAGI_WORKER_TIMEOUT="{{cookiecutter.zimagi_worker_timeout}}"
# [template:zimagi]: Zimagi worker check for exit signal interval in seconds
export ZIMAGI_WORKER_CHECK_INTERVAL="{{cookiecutter.zimagi_worker_check_interval}}"
# [template:zimagi]: Zimagi worker scaling task ratio
export ZIMAGI_WORKER_TASK_RATIO="{{cookiecutter.zimagi_worker_task_ratio}}"
