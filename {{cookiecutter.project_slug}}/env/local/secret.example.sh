#
# Generic environment variables
#
# [template:secrets]: Generic development secret variable used across applications
export DEV_SECRET="{{cookiecutter.dev_secret}}"
# [template:secrets]: Generic development password used across applications
export DEV_PASSWORD="{{cookiecutter.dev_password}}"
# [template:secrets]: Generic development 32B encryption key used across applications
export DEV_ENCRYPTION_KEY="{{cookiecutter.dev_encryption_key}}"

# Directories to share with reactor development container (enter command)
export HOME_SHARES=(
  ".ssh"
  ".bashrc"
  ".profile"
  ".gitconfig"
)

#
# Cert-Manager
#
# [template:certs]: Let's Encrypt certificate issuer email address [required]
export ISSUER_EMAIL="{{cookiecutter.issuer_email}}"

#
# ArgoCD environment variables
#
# ArgoCD server secret variable (used for authentication)
export ARGOCD_SERVER_SECRET="$DEV_SECRET"
# ArgoCD administrative (admin) user password
export ARGOCD_ADMIN_PASSWORD="$DEV_PASSWORD"

#
# PostgreSQL environment variables
#
# PostgreSQL database password
export POSTGRESQL_PASSWORD="$DEV_PASSWORD"

#
# Redis environment variables
#
# Redis database password
export REDIS_PASSWORD="$DEV_PASSWORD"

#
# GitHub environment variables
#
# [template:github]: Platform GitHub organization
export GITHUB_ORG="{{cookiecutter.github_org}}"
# [template:github]: GitHub granular access token that grants privileges to GitHub organization
export GITHUB_TOKEN="{{cookiecutter.github_token}}"

#
# Grafana environment variables
#
# [template:grafana]: Grafana administrative user name
export GRAFANA_ADMIN_USER="{{cookiecutter.grafana_admin_user}}"
# Grafana administrative (admin) user password
export GRAFANA_ADMIN_PASSWORD="$DEV_PASSWORD"

#
# Zimagi environment configurations
#
# Zimagi PostgreSQL connection password value (same as PostgreSQL database password)
export ZIMAGI_POSTGRESQL_PASSWORD="$POSTGRESQL_PASSWORD"
# Zimagi Redis connection password value (same as Redis database password)
export ZIMAGI_REDIS_PASSWORD="$REDIS_PASSWORD"

# Zimagi Django secret key value
export ZIMAGI_SECRET_KEY="$DEV_SECRET"

# [template:zimagi]: Zimagi administrative (root) user name
export ZIMAGI_ADMIN_USER="{{cookiecutter.zimagi_admin_user}}"
# Zimagi initial Django admin user token (password)
export ZIMAGI_DEFAULT_ADMIN_TOKEN="$DEV_PASSWORD"
# Zimagi Django admin user 32B encryption key
export ZIMAGI_ADMIN_API_KEY="$DEV_ENCRYPTION_KEY"

# [template:zimagi]: Zimagi email SMTP hostname (domain only)
export ZIMAGI_EMAIL_HOST="{{cookiecutter.zimagi_email_host}}"
# [template:zimagi]: Zimagi email SMTP port
export ZIMAGI_EMAIL_PORT="{{cookiecutter.zimagi_email_port}}"
# [template:zimagi]: Zimagi use TLS?
export ZIMAGI_EMAIL_USE_TLS="{{cookiecutter.zimagi_email_use_tls}}"
# [template:zimagi]: Zimagi SMTP user email address
export ZIMAGI_EMAIL_HOST_USER="{{cookiecutter.zimagi_email_host_user}}"
# [template.env:zimagi]: Zimagi SMTP user email password
export ZIMAGI_EMAIL_HOST_PASSWORD="{{cookiecutter.local_zimagi_email_host_password}}"

# Zimagi GitHub organization (same as default GitHub organization)
export ZIMAGI_GITHUB_ORG="$GITHUB_ORG"
# Zimagi GitHub granular access token that grants privileges to Zimagi GitHub organization (same as default GitHub access token)
export ZIMAGI_GITHUB_TOKEN="$GITHUB_TOKEN"
