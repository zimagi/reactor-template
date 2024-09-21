#
# Copy and rename this file based on the image names defined in reactor.yml
#
# * {example}_initialize.sh -> {image_name}_initialize.sh
#
#-------------------------------------------------------------------------------
set -e
#-------------------------------------------------------------------------------
NO_CACHE=$1
#-------------------------------------------------------------------------------
#
# Set Docker build args
#
# export DOCKER_BUILD_VARS=()
#
