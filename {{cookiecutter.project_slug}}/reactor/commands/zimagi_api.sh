#
#=========================================================================================
# <Zimagi API> Command
#

function zimagi_api_description () {
  render "Execute a Zimagi operation within the reactor environment context through the client SDK"
  export PASSTHROUGH="1"
}

function zimagi_api_command () {
  ZIMAGI_CLIENT_IMAGE="command:dev"

  kubernetes_environment
  zimagi_environment

  ZIMAGI_ARGS=(
    "--rm"
    "--interactive"
    "--tty"
    "--network" "host"
    "--env" "ZIMAGI_HOST=cmd.${ZIMAGI_DOMAIN}"
    "--env" "ZIMAGI_PORT=443"
    "--env" "ZIMAGI_USER=admin"
    "--env" "ZIMAGI_TOKEN=$ZIMAGI_DEFAULT_ADMIN_TOKEN"
    "--env" "ZIMAGI_ENCRYPTION_KEY=$ZIMAGI_ADMIN_API_KEY"
  )
  if [[ ! "${@}" ]]; then
    ZIMAGI_ARGS=("${ZIMAGI_ARGS[@]}" "$ZIMAGI_CLIENT_IMAGE" "--help")
  else
    ZIMAGI_ARGS=("${ZIMAGI_ARGS[@]}" "$ZIMAGI_CLIENT_IMAGE" "${@}")
  fi

  debug "ZIMAGI_ARGS = ${ZIMAGI_ARGS[@]}"
  docker run "${ZIMAGI_ARGS[@]}"
}
