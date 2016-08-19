#!/usr/bin/env bash

export DEX_DOCKER_WORKSPACE_DOS="${DEX_DOCKER_WORKSPACE//\//\\}"

# convert arguments resembling posix paths => dos paths, resolving symlinks
args=()
while [ $# -ne 0 ]; do
  arg=$1
  case $arg in
    /*)   [ ${#arg} -gt 3 ] && {
            arg=$(readlink -m $arg)
            arg=${arg//\//\\}
          } ;;
    *)    arg=${arg//\//\\} ;;
  esac

  args+=( $arg )
  shift
done

exec dosemu "edit ${args[@]}"
exit $?
