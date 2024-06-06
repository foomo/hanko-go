Unfortunetly the provided openapi spec is not valid with oapi-codegen. The following error is thrown:

```bash
error generating code: error creating operation definitions: error describing global parameters for GET//audit_logs: error generating type for param (meta_source_ip): error merging schemas: error merging schemas for AllOf: can not merge incompatible formats
packages/go/clients/hanko/admin/generate.go:4: running "oapi-codegen": exit status 1
```

To get rid of the error remove the following `meta_source_ip` query from the auditlog get parameters in the openapi spec file `client.yaml`

````yaml
- in: query
  name: meta_source_ip
  schema:
    allOf:
      - type: string
        format: ipv4
      - type: string
        format: ipv6
    example: 127.0.0.1
  description: Only audit logs with the specified ip address are included
````

and disable the download of that file during code generation.
