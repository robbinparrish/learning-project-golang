#!/bin/bash
#
# Install additional tools in the docker image during build.
#

# Fail on error.
set -e

# Install some GO Extension.
echo "Installing GO Extension ..."
go install golang.org/x/tools/gopls@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/ramya-rao-a/go-outline@v0.0.0-20210608161538-9736a4bde949
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/stamblerre/gocode@v1.0.0
go install github.com/rogpeppe/godef@v1.1.2
go install github.com/stamblerre/gocode@v1.0.0
go install honnef.co/go/tools/cmd/staticcheck@latest

echo "GO Extentions Installation Finished."
