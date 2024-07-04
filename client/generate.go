package client

// generate curl -f -H "Accept: application/vnd.github.v3.raw" -o "client.yaml" -L "https://raw.githubusercontent.com/teamhanko/hanko/backend/v0.12.0/docs/static/spec/public.yaml"
//go:generate oapi-codegen -generate types,client -config client.config.yaml -o client_gen.go client.yaml
