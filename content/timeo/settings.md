---
title: Settings
tags:
  - timeo
---

Timeo options are phil parameters. Edit them in `Options` > `Settings` or from the panels. All names below are relative to `timeo`.

## General

| Parameter       | Default    | Description                                                                                                                                                                                                                                                            |
| --------------- | ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `gui.location`  | `'tools'`  | The tab item where the Timeo GUI appears.                                                                                                                                                                                                                              |
| `gui.before`    | `'images'` | The tool before which the Timeo GUI appears.                                                                                                                                                                                                                           |
| `merge_ligands` | `False`    | Merge π-bonded ligands into their centroid before measuring.                                                                                                                                                                                                           |
| `exclude_h`     | `False`    | Leave hydrogen and deuterium atoms out of the coordination polyhedron.                                                                                                                                                                                                 |
| `part_codes`    | `''`       | Space-separated disorder part codes, each measured as one structure. Every digit of a code is a part: `01 02` measures parts 0+1 and 0+2, `34` parts 3+4, `0` part 0 only. Leave empty to measure part 0 with each other part. See [[timeo/usage#Disorder\|disorder]]. |

## External programs

| Parameter                 | Default | Description                                                                |
| ------------------------- | ------- | -------------------------------------------------------------------------- |
| `shape.exe_path`          | `''`    | Explicit path to the SHAPE executable. Leave empty to search `PATH`.       |
| `cosmochlore.exe_path`    | `''`    | Explicit path to the Cosmochlore executable. Leave empty to search `PATH`. |

## Cosmochlore: cshm

| Parameter           | Default | Description                                             |
| ------------------- | ------- | ------------------------------------------------------- |
| `cosmochlore.cshm.table` | `False` | Write a `_cshm_table.csv` file next to the `.xyz`.      |
| `cosmochlore.cshm.ideal` | `False` | Write a `_ideal.xyz` file with the reconstructed reference shapes. |

## Cosmochlore: csom

| Parameter                                | Default  | Description                                                                                                           |
| ---------------------------------------- | -------- | --------------------------------------------------------------------------------------------------------------------- |
| `cosmochlore.csom.point_groups`          | `''`     | Default space-separated point groups for `autoCSOM()`, e.g. `Oh D4h D3d`.                                             |
| `cosmochlore.csom.mode`                  | `'auto'` | Default centering mode: `auto`, `first`, `centroid` or `manual`.                                                      |
| `cosmochlore.csom.vector`                | `''`     | Manual centering vector `x y z`, used only when `mode = manual`.                                                      |
| `cosmochlore.csom.full`                  | `False`  | Write a per-operation `_details.csv` file for each point group.                                                       |
| `cosmochlore.csom.table`                 | `False`  | Write a `_csom_table.csv` summary file.                                                                               |
| `cosmochlore.csom.operated`              | `False`  | Write operated `.xyz`/`.mol2` files showing each symmetry operation applied.                                          |
| `cosmochlore.csom.ignore_labels`         | `False`  | Ignore atom labels when matching atoms between structures.                                                            |
| `cosmochlore.csom.seeds`                 | `20`     | Number of candidate symmetry-axis directions (Fibonacci hemisphere) that seed the axis search. Range 1–1000.          |
| `cosmochlore.csom.iterations`            | `200`    | Maximum number of Nelder-Mead iterations spent refining each seed. Range 1–10000.                                     |
| `cosmochlore.csom.tolerance_exponent`    | `6`      | Convergence tolerance of the Nelder-Mead refinement as a power of ten, `N` meaning 1e-N. Range 1–15.                  |

## Cosmochlore: odis

| Parameter                 | Default | Description                                                                  |
| ------------------------- | ------- | ---------------------------------------------------------------------------- |
| `cosmochlore.odis.full`   | `False` | Also compute CShM (OC-6/TPR-6) and CSoM against common octahedral distortions. |
| `cosmochlore.odis.table`  | `False` | Write a `_odis_table.csv` file next to the `.xyz`.                           |
