VERSION := 1.5.5
PORT_NAME = $(shell basename $(PWD))
OCI_REPO := docker.io/dim9/ports
OCI_RUNTIME := docker

PATCHES := $(wildcard patches/*.patch)

build: .make/$(PORT_NAME)_$(VERSION)

.make/$(PORT_NAME)_$(VERSION): Dockerfile $(PATCHES)
	@mkdir -pv .make
	@echo "Building $(PORT_NAME) $(VERSION)"
	@$(OCI_RUNTIME) build -t $(OCI_REPO):$(PORT_NAME)_$(VERSION)-devfilter --build-arg VERSION=$(VERSION) .
	cat $^ | sha256sum > $@ 

push: 
	echo "Pushing  $(OCI_REPO):$(PORT_NAME)_$(VERSION)"
	@$(OCI_RUNTIME) push $(OCI_REPO):$(PORT_NAME)_$(VERSION)-devfilter

src:
	@git clone https://github.com/dariobalinzo/kafka-connect-elasticsearch-source -b v.$(VERSION) src

clean-src:
	@rm -rfv src

clean:
	@rm -rfv .make