#!/bin/sh

# Arangodb-docker doesn't support the env vars needed to run in starter mode,
# so we have to run this via a regular command and lose out on some configurability.
CMD="arangodb --starter.mode=single --starter.address=0.0.0.0"

if [[ -z $INPUT_BIND_MOUNT_TARGET_DIR ]]; then
    BIND_MOUNT=""
else
    BIND_MOUNT="-v $GITHUB_WORKSPACE:$INPUT_BIND_MOUNT_TARGET_DIR"
fi

docker_run="docker run $BIND_MOUNT --name=$INPUT_CONTAINER_NAME -d -p 8529:8529 arangodb:$INPUT_ARANGODB_VERSION $CMD"

echo "running docker command: $docker_run -- current directory = $(pwd) - bind_mount=$BIND_MOUNT INPUT_BIND_MOUNT_TARGET_DIR=$INPUT_BIND_MOUNT_TARGET_DIR gh-workspace=$GITHUB_WORKSPACE"
sh -c "$docker_run"
