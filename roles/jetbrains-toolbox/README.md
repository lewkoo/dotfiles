# JetBrains Toolbox

Installs JetBrains Toolbox.

## Requirements

- [JMESPath](http://jmespath.org/libraries.html)

## Role Variables

| Variable                    | Required | Default | Description                                  |
| --------------------------- | -------- | ------- | -------------------------------------------- |
| `jetbrains_toolbox_version` | :x:      | `1.8`   | The version of JetBrains Toolbox to install. Can be a specific version number or "latest" |

## Dependencies

None

## Example Playbook

```yaml
- hosts: localhost
  vars:
    jetbrains_toolbox_version: 1.8
  roles:
    - jaredhocutt.jetbrains_toolbox
```
