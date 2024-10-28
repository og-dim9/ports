VERSION := 10.6.1
PORT_NAME = $(shell basename $(PWD))
OCI_REPO := docker.io/dim9/ports
OCI_RUNTIME := docker

build:
	@echo "Building $(PORT_NAME) $(VERSION)"
	@$(OCI_RUNTIME) build -t $(OCI_REPO):$(PORT_NAME)_$(VERSION) --build-arg VERSION=$(VERSION) .

push:
	echo "Pushing  $(OCI_REPO):$(PORT_NAME)_$(VERSION)"
	@$(OCI_RUNTIME) push $(OCI_REPO):$(PORT_NAME)_$(VERSION)
