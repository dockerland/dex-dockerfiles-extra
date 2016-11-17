#!/usr/bin/env bash

. ${BADEVOPS_DIR:=$HOME/.badevops}/helpers.sh &>/dev/null || {
  echo "ERROR - badevops-bootstrap helpers are required!"
  exit 1
}

# utility
#########

display_help() {
  cat <<-EOF
  A utility for building docker images and pushing to a registry

  Usage: buildchain.sh <image>[:<tag>] ...[<image>[:<tag>]]

  Options:
    -r | --registry      specify registry to push to
                         [$REGISTRY]

    --skip-pull          pull source images when building
    --skip-push          skip pushing to registry, only build
    --skip-cache         skips the docker cache (passes --no-cache to build)

EOF

exit $1
}

# globals
#########

__cwd=$( cd $(dirname $0) ; pwd -P )
REGISTRY="dexbuilds"
SKIP_PUSH=false
SKIP_PULL=false
SKIP_CACHE=false

# functions
###########

build_image(){

  [ ! -z "$build_tag" ] && [ "$build_tag" != "$2" ] && {
    warn "  ! skipping $1:$2 build. does not match build_tag $build_tag ..."
    return
  }

  local random=$(LC_CTYPE=C tr -dc 'a-zA-Z0-9-_' < /dev/urandom | head -c10)
  local flags=
  local pull=
  local skipcache=

  grep -q "^ARG CACHE_BUST" $3 &&  \
    flags+=" --build-arg CACHE_BUST=$random"

  $SKIP_PULL || \
    flags+=" --pull"

  $SKIP_CACHE && \
    flags+=" --no-cache"

  warn "  + building $1:$2 from $3 ..."
  __local_docker build -t $1:$2 -f $3 $flags  . || return 1
  __local_docker tag $1:$2 $REGISTRY/$1:$2 || return 1

  $SKIP_PUSH && return
  warn "  + pushing $1:$2 to $REGISTRY ..."
  __local_docker push $REGISTRY/$1:$2 || return 1
}

build_images(){

  for build in $@; do
    IFS=":" read -r build_image build_tag <<< $build

    echo
    echo "========================================"
    echo "building $build..."
    echo "========================================"
    echo

    (
      set -e
      cd $__cwd/$build_image
      for Dockerfile in Dockerfile*; do

        __filename=${Dockerfile%.*}
        __extension=${Dockerfile##*.}
        __tag=${__filename//Dockerfile-/}
        __tag=${__tag//Dockerfile/latest}


        [ -L $Dockerfile ] && {
          Dockerfile=$(readlink $Dockerfile)
          __filename=${Dockerfile%.*}
          __extension=${Dockerfile##*.}
        }
        if [ "$__extension" = "vars" ]; then
          continue
        elif [ "$__extension" = "j2" ]; then
          __vars_files=()
          [ -e Dockerfile.vars ] && __vars_files+=( Dockerfile.vars )
          [ -e $__filename.vars ] && __vars_files+=( $__filename.vars )
          log "+ rendering $Dockerfile with vars file(s)" "  ${__vars_files[@]}"

          echo /dev/null > Dockerfile.rendered
          echo -n "BUILD_TAG=$__tag" | badevops-cop \
            --render-template $Dockerfile \
            --stdin-type=shell \
            ${__vars_files[@]} > Dockerfile.rendered

          Dockerfile=Dockerfile.rendered
          build_image $build_image $__tag Dockerfile.rendered
        else
          log "+ detected non-templated $Dockerfile"
          build_image $build_image $__tag $Dockerfile
        fi
      done
    )
  done
}

if [ $# -eq 0 ]; then
  display_help 1
else
  set -- $(normalize_flags_first "" "$@")
  __operand="build_images"
  __operand_args=
  while [ $# -ne 0 ]; do
    case $1 in
      -h|--help|help)   display_help ;;
      -r|--registry)    REGISTRY="$2" ; shift ;;
      --skip-pull)      SKIP_PULL=true ;;
      --skip-push)      SKIP_PUSH=true ;;
      --skip-cache)     SKIP_CACHE=true ;;
      --)               shift ; __operand_args="$@" ; break ;;
      -*)               unrecognized_flag $1 ;;
      *)                __operand_args+=" $1" ;;
    esac
    shift
  done

  $__operand $__operand_args
  exit $?
fi
