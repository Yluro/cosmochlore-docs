---
title: odis
description: OctaDist-style octahedral distortion parameters.
tags:
  - command
---

Computes the [[theory/octahedral-distortion|octahedral distortion parameters]] of a six-coordinate centre.

```bash
cosmochlore odis <NAME> [OPTIONS]
```

> [!important]
> `odis` needs a centred structure with exactly one central atom and six ligands (7 atoms in the `.xyz` file).

## Options

| Flag             | Value        | Description                                                                                                     |
| ---------------- | ------------ | --------------------------------------------------------------------------------------------------------------- |
| `-c`, `--center` | `<POSITION>` | 1-based position of the central atom. Defaults to 1.                                                            |
| `-f`, `--full`   |              | Full analysis, adding CShM (against `OC-6` and `TPR-6`) and CSoM (against common octahedral distortion groups). |
| `-t`, `--table`  |              | Write the output table to a `.csv` file.                                                                        |

## Example

> [!todo] To do
> Add an example run and its output.
