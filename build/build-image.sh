#!/bin/bash
#****************************************************************#
# Create Date: 2019-02-02 22:16
#********************************* ******************************#

ROOTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

NAME="wstunnel"
TAG="v0.1.0-$(date +%Y''%m''%d''%H''%M''%S)"

docker build -t "${NAME}:${TAG}" -f ${ROOTDIR}/Dockerfile ${ROOTDIR}/../

array=( registry.cn-hangzhou.aliyuncs.com )
for registry in "${array[@]}"
do
    echo "push images to ${registry}/kstarter/${NAME}:${TAG}"
    docker tag "${NAME}:${TAG}" "${registry}/kstarter/${NAME}:${TAG}"
    docker push "${registry}/kstarter/${NAME}:${TAG}"

    docker tag "${NAME}:${TAG}" "${registry}/kstarter/${NAME}:latest"
    docker push "${registry}/kstarter/${NAME}:latest"
done
