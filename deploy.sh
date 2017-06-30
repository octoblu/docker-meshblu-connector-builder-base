#!/bin/bash

set -e

build_and_deploy() {
  local name="$1"
  pushd ./$name > /dev/null
    docker build -t "local/meshblu-connector-builder-base:$name" .
    docker tag "local/meshblu-connector-builder-base:$name" "octoblu/meshblu-connector-builder-base:$name"
    docker push "octoblu/meshblu-connector-builder-base:$name"
  popd > /dev/null
}

main() {
  build_and_deploy 'linux-x64'
  build_and_deploy 'linux-x86'
  build_and_deploy 'linux-armv7'
}

main "$@"
