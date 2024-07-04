# hanko-go

[![Build Status](https://github.com/foomo/keel/actions/workflows/test.yml/badge.svg?branch=main&event=push)](https://github.com/foomo/hanko-go/actions/workflows/test.yml)
[![Go Report Card](https://goreportcard.com/badge/github.com/foomo/hanko-go)](https://goreportcard.com/report/github.com/foomo/hanko-go)
[![GoDoc](https://godoc.org/github.com/foomo/hanko-go?status.svg)](https://godoc.org/github.com/foomo/hanko-go)

The `hanko-go` repository provides Go clients for integrating with Hanko Auth. It includes a public client and an admin client, allowing developers to easily incorporate Hanko authentication into their Go applications.

To get started, refer to the documentation and examples provided in the repository. The public client offers functionalities for user authentication and verification, while the admin client provides capabilities for managing Hanko Auth resources and configurations.

## How to Contribute

Feel free to explore the code and contribute to the development of `hanko-go` on GitHub.

Download required binaries:

```shell
$ make brew
```

Regenerate code:

```shell
$ make generate
```

Run linter & tests:

```shell
$ make lint
$ make test
```


## License

Distributed under MIT License, please see license file within the code for more details.
