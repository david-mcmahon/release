#!/bin/bash
#
#
project="kubernetes-release-test"

# Build container
gcloud --project=$project container builds submit --config k8s-anago-container.yaml .

# Push container
gcloud docker -- push $project
