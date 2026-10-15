---
title: User-defined shapes
tags:
  - reference
---

Pass your own reference polyhedra to [[cshm|cshm]] with `-r/--ref`, pointing to one or more YAML files. Each shape must have the same number of vertices as the structure you are analyzing.

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

symbol2:
  ...
```

A single `reference.yaml` file can contain several reference polyhedra. Comments are also supported by the YAML parser: every line that starts with `#` is ignored.

Cosmochlore's YAML parser is somewhat flexible when specifying the key names. It accepts the following synonyms:

| Key        | Synonyms          | Value type  |
| ---------- | ----------------- | ----------- |
| `symbol`   |                   | `name`      |
| `name`     |                   | `name`      |
| `symmetry` | `symm`            | `name`      |
| `vertices` | `ligands`         | `[x, y, z]` |
| `centre`   | `center`, `metal` | `[x, y, z]` |


## Examples
>[!example]- File containing one shape
>
>```yaml title="ebcT-6.yaml"
>ebcT-6:
>  name: Edge-bicapped tetrahedron
>  symm: D2d
>  vertices:
>    - [0.5000, 0.5000, -0.6495]
>    - [1.0000, 1.0000, 0.0000]
>    - [1.0000, 0.0000, 1.0000]
>    - [0.0000, 1.0000, 1.0000]
>    - [0.5000, 0.5000, 1.6495]
>    - [0.0000, 0.0000, 0.0000]
>  centre:
>    - [0.5000, 0.5000, 0.5000]
>```

>[!example]-A file with more than one shape, using key synonyms and commented-out vertices:
>
>```yaml title="reference.yaml"
>ebcT-6:
>  name: Edge-bicapped tetrahedron
>  symm: D2d
>  vertices:
>    - [0.5000, 0.5000, -0.6495]
>    - [1.0000, 1.0000, 0.0000]
>    - [1.0000, 0.0000, 1.0000]
>    - [0.0000, 1.0000, 1.0000]
>    - [0.5000, 0.5000, 1.6495]
>    - [0.0000, 0.0000, 0.0000]
>  centre:
>    - [0.5000, 0.5000, 0.5000]
>
>fvCU-6:
>  name: Face-divacant cube
>  symm: C2v
>  vertices:
>    #    - [ 1.000000000000,  0.000000000000, -0.707106780000]
>    - [0.000000000000, 1.000000000000, -0.707106780000]
>    #    - [-1.000000000000,  0.000000000000, -0.707106780000]
>    - [-0.000000000000, -1.000000000000, -0.707106780000]
>    - [1.000000000000, 0.000000000000, 0.707106780000]
>    - [0.000000000000, 1.000000000000, 0.707106780000]
>    - [-1.000000000000, 0.000000000000, 0.707106780000]
>    - [-0.000000000000, -1.000000000000, 0.707106780000]
>  center:
>    - [0.000000000000, 0.000000000000, 0.000000000000]
>```