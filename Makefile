HOSTNAME = paloaltonetworks.com
NAMESPACE = prismacloud
NAME = prismacloudcompute

VERSION ?= 0.0.1
OS_ARCH ?= darwin_amd64

BINARY = terraform-provider-${NAME}-${OS_ARCH}

default: install

format:
	gofmt -l -w .

build:
	go build -o ${BINARY}

install: build
	mkdir -p ~/.terraform.d/plugins/${HOSTNAME}/${NAMESPACE}/${NAME}/${VERSION}/${OS_ARCH}
	mv ${BINARY} ~/.terraform.d/plugins/${HOSTNAME}/${NAMESPACE}/${NAME}/${VERSION}/${OS_ARCH}

clean:
	rm -rf ~/.terraform.d/plugins/${HOSTNAME}/${NAMESPACE}/${NAME}
