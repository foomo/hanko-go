.DEFAULT_GOAL:=help
-include .makerc

# --- Config -----------------------------------------------------------------

export BIN_DIR=$(shell pwd)/bin
export TEMP_DIR=$(shell pwd)/tmp
export PATH=${BIN_DIR}:$(shell echo $$PATH)

OAPI_CODEGEN_VERSION:=1.12.4

# --- Targets -----------------------------------------------------------------

# This allows us to accept extra arguments
%:
	@:

## === Tasks ===

.PHONY: doc
## Run tests
doc:
	@open "http://localhost:6060/pkg/github.com/foomo/hanko-go/"
	@godoc -http=localhost:6060 -play

.PHONY: test
## Run tests
test:
	@go test -p 1 -coverprofile=coverage.out -race -json ./... | gotestfmt

.PHONY: lint
## Run linter
lint:
	@golangci-lint run

.PHONY: lint.fix
## Fix lint violations
lint.fix:
	@golangci-lint run --fix

.PHONY: tidy
## Run go mod tidy
tidy:
	@go mod tidy

.PHONY: outdated
## Show outdated direct dependencies
outdated:
	@go list -u -m -json all | go-mod-outdated -update -direct

.PHONY: generate
## Generate code
generate:
	@go generate ./...

brew:os=$(shell uname -s | tr '[:upper:]' '[:lower:]')
brew:arch=$(shell arch)
brew:
	@mkdir -p bin tmp
	@curl https://raw.githubusercontent.com/foomo/ownbrew-tap/main/oapi-codegen/oapi-codegen.sh | bash -s -- ${os} ${arch} ${OAPI_CODEGEN_VERSION}
	@ln -sf oapi-codegen-${OAPI_CODEGEN_VERSION}-${os}-${arch} bin/oapi-codegen

## === Utils ===

## Show help text
help:
	@awk '{ \
			if ($$0 ~ /^.PHONY: [a-zA-Z\-\_0-9]+$$/) { \
				helpCommand = substr($$0, index($$0, ":") + 2); \
				if (helpMessage) { \
					printf "\033[36m%-23s\033[0m %s\n", \
						helpCommand, helpMessage; \
					helpMessage = ""; \
				} \
			} else if ($$0 ~ /^[a-zA-Z\-\_0-9.]+:/) { \
				helpCommand = substr($$0, 0, index($$0, ":")); \
				if (helpMessage) { \
					printf "\033[36m%-23s\033[0m %s\n", \
						helpCommand, helpMessage"\n"; \
					helpMessage = ""; \
				} \
			} else if ($$0 ~ /^##/) { \
				if (helpMessage) { \
					helpMessage = helpMessage"\n                        "substr($$0, 3); \
				} else { \
					helpMessage = substr($$0, 3); \
				} \
			} else { \
				if (helpMessage) { \
					print "\n                        "helpMessage"\n" \
				} \
				helpMessage = ""; \
			} \
		}' \
		$(MAKEFILE_LIST)
