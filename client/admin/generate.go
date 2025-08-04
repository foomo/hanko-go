package adminclient

// generate curl -f -H "Accept: application/vnd.github.v3.raw" -o "client.yaml" -L "https://raw.githubusercontent.com/teamhanko/docs/refs/heads/main/openapi-admin.yaml"
//go:generate oapi-codegen -generate types,client -config client.config.yaml -o client_gen.go client.yaml
