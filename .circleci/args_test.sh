#!/usr/bin/env bash

set -eu

help (){
    echo "Usage: $0 cc k8s"
    echo " cc - country code (e.g. uk, us)"
    echo " k8s - Kubernetes cluster (e.g uk-dev, us-dev)"
}

check_options(){
  if [[ -z "$1" ]]; then
    echo "==== Please supply $2 to deploy ===="
    help
    exit 2
  fi
}

check_options "${1+x}" "country code"
check_options "${2+x}" "k8s cluster"

CC="$1"
K8S_CLUSTER="$2"
[[ "${CC}" == "uk" ]] && ENV="dev" || ENV="usdev"

echo "env: ${CC} k8s: ${K8S_CLUSTER} ENV: ${ENV}"
