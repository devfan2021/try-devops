#!/bin/bash

## https://stackoverflow.com/questions/48513734/error-while-mounting-host-directory-in-nexus-docker
mkdir -p /data/devops-data/nexus
chown -R 200:200 /data/devops-data/nexus