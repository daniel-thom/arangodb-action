# ArangoDB GitHub Action

This [GitHub Action](https://github.com/features/actions) sets up ArangoDB.

# Usage

See [action.yml](action.yml)

Basic:
```yaml
steps:
- uses: xinova/arangodb-action@v1
  with:
    arangodb version: 'latest'  # See https://hub.docker.com/_/arangodb for available versions
```

The action starts a Docker container with the name `arangodb_container`, which can be customized
with the parameter `container_name`. This is useful if you need to connect to the database with
ArangoDB tools.

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)
