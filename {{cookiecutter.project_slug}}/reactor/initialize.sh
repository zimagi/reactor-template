#
#=========================================================================================
# Initialization
#
export OPERATIONS_DOMAIN="${OPERATIONS_SUBDOMAIN}.${PRIMARY_DOMAIN}"
export AUTH_DOMAIN="${AUTH_SUBDOMAIN}.${PRIMARY_DOMAIN}"
export ARGOCD_DOMAIN="argocd.${OPERATIONS_DOMAIN}"
export ZIMAGI_DOMAIN="${ZIMAGI_SUBDOMAIN}.${PRIMARY_DOMAIN}"

export ZIMAGI_APP_NAME="$APP_NAME"

export ZIMAGI_DEFAULT_MODULES='[]'
