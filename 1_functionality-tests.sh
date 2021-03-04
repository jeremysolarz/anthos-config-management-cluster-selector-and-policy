#!/bin/bash

# setup of ACM procedure
set -o errexit          # Exit on most errors (see the manual)
set -o errtrace         # Make sure any error trap is inherited
set -o nounset          # Disallow expansion of unset variables
set -o pipefail         # Use last non-zero exit code in a pipeline

export BASE_DIR=$(realpath $(dirname $BASH_SOURCE))

. demo-magic.sh

######################################################
# TEST CONFIG MANAGEMENT
######################################################

pe "kubectx"

pe "kubectx frankfurt-dz"
# list cluster roles
pe "kubectl get clusterroles -l app.kubernetes.io/managed-by=configmanagement.gke.io"

# list roles
pe "kubectl get rolebinding --all-namespaces -l app.kubernetes.io/managed-by=configmanagement.gke.io"
#

pe "kubectl get clusterroles auditor"

pe "kubectx hannover-dz"

pe "kubectl get clusterroles -l app.kubernetes.io/managed-by=configmanagement.gke.io"

pe "kubectx frankfurt-dz"
# list cluster roles

# list namepsaces
pe "kubectl get ns"

## attempt to modify
pe "kubectl delete namespace shipping-dev"
#
## test
pe "kubectl get ns shipping-dev"
#
## examine ClusterRole
# pe "kubectl get clusterrole namespace-reader -o yaml --watch"
#
## edit role (remove watch)
# kubectl edit clusterrole namespace-reader


