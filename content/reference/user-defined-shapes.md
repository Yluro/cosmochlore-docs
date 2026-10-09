---
title: User-defined shapes
tags:
  - reference
---

Pass your own reference polyhedra to [[commands/cshm|`cshm`]] with `-r/--ref`, pointing to one or more YAML files. Each shape must have the same number of vertices as the structure you are analyzing.

## Format

```yaml title="reference.yaml"
symbol:
  name:
  symmetry:
  vertices:
    - [x, y, z]
    - ...
  centre:
    - [x, y, z]
```

A single file can contain several shapes. Lines starting with `#` are comments.

The parser accepts these synonyms for the keys:

| Key        | Synonyms          | Value type  |
| ---------- | ----------------- | ----------- |
| `symbol`   |                   | name        |
| `name`     |                   | name        |
| `symmetry` | `symm`            | name        |
| `vertices` | `ligands`         | `[x, y, z]` |
| `centre`   | `center`, `metal` | `[x, y, z]` |

## Example

```yaml title="ebcT-6.yaml"
ebcT-6:
  name: Edge-bicapped tetrahedron
  symm: D2d
  vertices:
    - [0.5000, 0.5000, -0.6495]
    - [1.0000, 1.0000, 0.0000]
    - [1.0000, 0.0000, 1.0000]
    - [0.0000, 1.0000, 1.0000]
    - [0.5000, 0.5000, 1.6495]
    - [0.0000, 0.0000, 0.0000]
  centre:
    - [0.5000, 0.5000, 0.5000]
```
