---
title: csom
description: Continuous Symmetry Operation Measures against point groups.
tags:
  - command
---

Computes the **Continuous Symmetry Operation Measure** (CSoM): how far a structure is from having the symmetry operations of a given point group, searching over all orientations for the best fit. $\text{CSoM} = 0$ means the point group's symmetry is perfectly kept. See [[theory/continuous-symmetry-operation-measures|the csom algorithm]].

```bash
cosmochlore csom <NAME> [OPTIONS]
```

## Options

| Flag                 | Value                                       | Description                                                                                                          |
| -------------------- | ------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `-n`, `--nc`         |                                             | Treat the structure as non-centred.                                                                                  |
| `-c`, `--center`     | `<POSITION>`                                | 1-based position of the central atom. Defaults to 1. Cannot be combined with `--nc`.                                 |
| `-p`, `--pg`         | `<POINT_GROUPS>...`                         | [[reference/point-groups\|Point groups]] to test, in Schoenflies notation (e.g. `-p Oh D4h C2v`). All 47 if omitted. |
| `-m`, `--mode`       | `auto` \| `first` \| `centroid` \| `manual` | Centring mode. `auto` (default) uses the first atom if the structure is centred, or the centroid otherwise.          |
| `-u`, `--vector`     | `<X> <Y> <Z>`                               | Centring vector, required with `--mode manual`.                                                                      |
| `-t`, `--table`      |                                             | Write a `name_csom_table.csv` summary (point group, deviation, refined rotation matrix).                             |
| `-f`, `--full`       |                                             | Write a `name_<PG>_details.csv` per point group with every operation's matrix and deviation.                         |
| `-o`, `--operated`   |                                             | Write the symmetry-operated images (`name_<PG>_operated.xyz`) and an overlay (`name_<PG>_merged.mol2`).              |
| `-s`, `--seeds`      | `<N>`                                       | Number of axis seeds on the Fibonacci hemisphere. Defaults to `20`.                                                  |
| `-i`, `--iterations` | `<N>`                                       | Maximum Nelder-Mead iterations per seed. Defaults to `200`.                                                          |
| `-T`, `--tolerance`  | `<TOLERANCE>`                               | Nelder-Mead convergence tolerance. Defaults to `1e-6`.                                                               |
| `-g`, `--ignore`     |                                             | Ignore atom labels when matching atoms: any atom can be paired with any other.                                       |

> [!warning]
> Changing `--seeds`, `--iterations` or `--tolerance` is not recommended.

## Example

> [!todo] To do
> Add an example run and its output.
