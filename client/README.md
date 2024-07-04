Unfortunately the provided openapi spec is not valid with oapi-codegen. The following error is thrown:

```bash
error loading swagger spec in client.yaml
: error unmarshaling JSON: while decoding JSON: failed to unmarshal property "components" (*openapi3.Components): failed to unmarshal property "schemas" (*openapi3.Schemas): failed to unmarshal property "items" (*openapi3.SchemaRef): failed to unmarshal property "properties" (*openapi3.Schemas): failed to unmarshal property "required" (*[]string): json: cannot unmarshal bool into Go value of type []stringpackages/go/clients/hanko/public/generate.go:4: running "oapi-codegen": exit status 1
```

There are several places in `client.yaml` where the `required` field is set to `false` instead of a list of strings. This is not valid according to the OpenAPI 3.0 specification. To fix this issue, replace all occurrences of `required: false` with `required: ["false"]`.

```yaml
timeout:
  type: number
  format: int64
  example: 60000
```

should be rewritten to:

```yaml
timeout:
  type: integer
  format: int64
  example: 60000
```

And last but not least, due to name conflict during code generation, we must rename `CreateUserResponse` to `CreateUserResponseObject`.
