#!/bin/bash

REPO=${REPO:-luxas/kubeadm-installer}
KUBEADM_VERSION=${KUBEADM_VERSION:-v1.6.0-alpha.0.2074+a092d8e0f95f52}
KUBEADM_REVISION=${KUBEADM_REVISION:-0}
TAG_LATEST=${TAG_LATEST:-1}
PUSH=${PUSH:-0}

docker build -t ${REPO}:${KUBEADM_VERSION}.${KUBEADM_REVISION} .

if [[ ${TAG_LATEST} == 1 ]]; then
	docker tag ${REPO}:${KUBEADM_VERSION}.${KUBEADM_REVISION} luxas/kubeadm-installer
fi

if [[ ${PUSH} == 1 ]]; then
	docker push ${REPO}:${KUBEADM_VERSION}.${KUBEADM_REVISION}
	docker push ${REPO}
fi
