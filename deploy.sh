#!/usr/bin/env bash

set -e
set -o pipefail


BUILD_OPTS=''
if [[ "#${BUILD_PATH:-}" != "#" ]]; then
  BUILD_OPTS="${BUILD_OPTS} --from ${BUILD_PATH}"
fi
if [[ "#${CUSTOM_DOCKERFILE:-}" != "#" ]]; then
  BUILD_OPTS="${BUILD_OPTS} --dockerfile ${CUSTOM_DOCKERFILE}"
fi

if [[ "#${CREATE_ENV_SYMLINK:-}" != "#" ]]; then
  ENV_FILE_PATH="${ENV_FILEPATH}"
  ENV_SYMLINK_PATH="${BUILD_PATH:-.}/.env"

  ln -sf "$ENV_FILE_PATH"  "$ENV_SYMLINK_PATH"
fi

# Initialize 
wodby ci init $INSTANCE_UUID
wodby ci build $BUILD_OPTS
wodby ci release
wodby ci deploy
