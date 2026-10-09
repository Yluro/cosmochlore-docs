---
title: gidx
description: Geometry indices τ4, τ4′, τ5, τ6 and τ6′.
tags:
  - command
---

Computes the [[theory/geometry-indices|geometry indices]] of a four-, five- or six-coordinate centre. The indices reported depend on the number of ligands: τ4 and τ4′ for four, τ5 for five, τ6 and τ6′ for six.

```bash
cosmochlore gidx <NAME> [OPTIONS]
```

> [!important]
> `gidx` needs a centred structure with exactly one central atom and four, five or six ligands (5, 6 or 7 atoms in the `.xyz` file).

## Options

| Flag             | Value        | Description                                          |
| ---------------- | ------------ | ---------------------------------------------------- |
| `-c`, `--center` | `<POSITION>` | 1-based position of the central atom. Defaults to 1. |
| `-t`, `--table`  |              | Write the output table to a `.csv` file.             |

## Example

> [!todo] To do
> Add an example run and its output.
