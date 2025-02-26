#!/bin/bash
# Requires yq (e.g., 'sudo snap install yq' or similar)
TECH_STACK=$(yq e '.project.teck_stack' blueprint.yaml)
BUILD_TYPE=$(yq e '.project.build_type' blueprint.yaml)
DEPLOY_METHOD=$(yq e '.project.deploy_method' blueprint.yaml)
STAGES=$(yq e '.stages | keys | join(",")' blueprint.yaml | sed 's/,/","/g' | sed 's/^/["/'| sed 's/$/"]/')
echo "tech_stack=$TECH_STACK" >> $GITHUB_OUTPUT
echo "build_type=$BUILD_TYPE" >> $GITHUB_OUTPUT
echo "deploy_method=$DEPLOY_METHOD" >> $GITHUB_OUTPUT
echo "stages=$STAGES" >> $GITHUB_OUTPUT