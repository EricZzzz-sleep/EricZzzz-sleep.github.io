GO_VERSION ?= 1.22.12
GO_OS := $(shell uname -s | tr A-Z a-z)
GO_MACHINE := $(shell uname -m)
ifeq ($(GO_MACHINE),arm64)
GO_ARCH := arm64
else ifeq ($(GO_MACHINE),aarch64)
GO_ARCH := arm64
else ifeq ($(GO_MACHINE),x86_64)
GO_ARCH := amd64
else
GO_ARCH := unsupported
endif
GO_CMD := $(shell command -v go 2>/dev/null)
GO_DEP := $(if $(GO_CMD),,.tools/go/bin/go)

export PATH := $(CURDIR)/.tools/go/bin:$(CURDIR)/node_modules/.bin:$(PATH)

.PHONY: run build install clean

run: node_modules $(GO_DEP)
	npm run dev

build: node_modules $(GO_DEP)
	npm run build

install:
	npm install

clean:
	rm -rf public resources

node_modules: package.json package-lock.json
	npm install

.tools/go/bin/go:
	@if [ "$(GO_ARCH)" = "unsupported" ]; then \
		echo "Unsupported CPU architecture: $$(uname -m)"; \
		exit 1; \
	fi
	mkdir -p .tools/downloads
	curl -fsSL "https://go.dev/dl/go$(GO_VERSION).$(GO_OS)-$(GO_ARCH).tar.gz" -o ".tools/downloads/go$(GO_VERSION).$(GO_OS)-$(GO_ARCH).tar.gz"
	rm -rf .tools/go
	tar -C .tools -xzf ".tools/downloads/go$(GO_VERSION).$(GO_OS)-$(GO_ARCH).tar.gz"
