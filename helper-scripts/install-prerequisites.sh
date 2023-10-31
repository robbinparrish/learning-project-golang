#!/bin/bash
#
# Install Prerequisites those mostly requires during CI pipeline build.
#

# Fail on error.
set -e

export DEBIAN_FRONTEND=noninteractive

# Install common utilities and tools.
apt-get update
apt-get install -y --no-install-recommends --no-install-suggests \
        curl wget tar zip bzip2 unzip ca-certificates gnupg git


# Install GO.
export GO_LANG_VERSION=1.21.3
wget https://go.dev/dl/go${GO_LANG_VERSION}.linux-amd64.tar.gz
tar -zxf go${GO_LANG_VERSION}.linux-amd64.tar.gz -C /usr/local/
rm -f go${GO_LANG_VERSION}.linux-amd64.tar.gz
mkdir -p /etc/profile.d/
echo "export PATH=/usr/local/go/bin:${PATH}" | tee /etc/profile.d/go-env.sh


# Update Path.
export PATH=/usr/local/go/bin:${PATH}

# Print GO version.
go version
