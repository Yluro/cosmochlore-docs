---
title: cshm
description: Continuous Shape Measures against reference polyhedra.
tags:
  - command
---

Computes the **Continuous Shape Measure** (CShM) between a structure and one or more ideal reference shapes. $S = 0$ is a perfect match; larger values mean a more distorted structure. See [[theory/continuous-shape-measures|the cshm algorithm]] for the definition.

```bash
cosmochlore cshm <NAME> [OPTIONS]
```

## Options

| Flag             | Value              | Description                                                                                                                           |
| ---------------- | ------------------ | ------------------------------------------------------------------------------------------------------------------------------------- |
| `-n`, `--nc`     |                    | The structure has no explicit central atom (only ligand/vertex coordinates).                                                          |
| `-c`, `--center` | `<POSITION>`       | 1-based position of the central atom. Defaults to 1. Cannot be combined with `--nc`.                                                  |
| `-s`, `--sh`     | `<SHAPES>...`      | Only compare against these [[reference/reference-polyhedra\|built-in shapes]], by index. All applicable shapes are used when omitted. |
| `-r`, `--ref`    | `<USER_SHAPES>...` | Paths to YAML files with [[reference/user-defined-shapes\|user-defined shapes]].                                                      |
| `-t`, `--table`  |                    | Write the results to `name_cshm_table.csv`.                                                                                           |
| `-i`, `--ideal`  |                    | Write the reconstructed ideal structures for all selected shapes to `name_ideal.xyz`.                                                 |

## Example

```bash
cosmochlore cshm FeHS.xyz --ref ebcT-6.yaml -t -i
```

> [!todo] To do
> Add the example output and explain how to read it.
