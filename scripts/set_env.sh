#!/bin/bash

export category=$1

export KUBECONFIG=/etc/kubernetes/admin.conf
export PATH=/data/meinKram/scripts/:$PATH

export images_list="/data/meinKram/conf/images.list"
export images_map="/data/meinKram/conf/images.map"

export registry="myregistry.adm13:443"

export helm_dir=/data/helm
export helm_options="--repository-config $helm_dir/config --repository-cache $helm_dir/cache "
export podman_options="-t --rm --network host -v /etc/kubernetes:/etc/kubernetes -v /etc/ssl/certs:/etc/ssl/certs -v $helm_dir:$helm_dir --workdir $PWD -v $PWD:$PWD -e KUBECONFIG=$KUBECONFIG"
alias helmx="podman run ${podman_options} myregistry.adm13:443/helm:v3.7.2 $helm_options"
function helm(){
  podman run ${podman_options} ${registry}/helm:v3.7.2 $helm_options $*
}
export -f helm
export helm_repo=${category}
export helm_url=https://helm.adm13:9443/$helm_repo
export helm_repo_dir=$helm_dir/$helm_repo

export env_is_set=1