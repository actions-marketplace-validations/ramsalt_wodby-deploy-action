#!/usr/bin/env sh

set -e
set -o pipefail


BUILD_OPTS=''
if [[ "#${BUILD_PATH:-}" != "#" ]]; then
  BUILD_OPTS="${BUILD_OPTS} --from ${BUILD_PATH}"
fi
if [[ "#${CUSTOM_DOCKERFILE:-}" != "#" ]]; then
  BUILD_OPTS="${BUILD_OPTS} --dockerfile ${CUSTOM_DOCKERFILE}"
fi

# Initialize 
wodby ci init --dind $INSTANCE_UUID
wodby ci build $BUILD_OPTS
wodby ci release
wodby ci deploy
