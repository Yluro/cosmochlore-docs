---
title: csom
description: Continuous Symmetry Operation Measures against point groups.
tags:
  - command
---

Computes the **Continuous Symmetry Operation Measure** (CSoM): how far a structure is from possessing a given point group's symmetry operations, searching over all orientations for the best fit. $\text{CSoM} = 0$ means that the symmetry of the point group is perfectly conserved in the structure. See [[theory/continuous-symmetry-operation-measures|the csom algorithm]].

```bash
cosmochlore csom <NAME> [OPTIONS]
```

## Options

| Flag                 | Value                                       | Description                                                                                                                                                                                                                                                                                                                                                                                            |
| -------------------- | ------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `-n`, `--nc`         |                                             | Treat the structure as non-centred (see [[cshm\|cshm]]'s `-n`).                                                                                                                                                                                                                                                                                                                               |
| `-c`, `--center`     | `<POSITION>`                                | 1-based position of the atom in the `.xyz` table that is the centre of the structure. Defaults to the first atom (position 1) when omitted. Cannot be combined with `--nc`.                                                                                                                                                                                                                            |
| `-p`, `--pg`         | `<POINT_GROUPS>...`                         | [[reference/point-groups\|Point groups]] to measure the structure against, in Schoenflies notation, separated by whitespace (e.g. `-p Oh D4h C2v`). If omitted, every supported point group (all 47) is analysed.                                                                                                                                                                                      |
| `-m`, `--mode`       | `auto` \| `first` \| `centroid` \| `manual` | Centring mode. `auto` (default) centres on the first atom if the structure has an explicit centre, or on the centroid otherwise.                                                                                                                                                                                                                                                                       |
| `-u`, `--vector`     | `<X> <Y> <Z>`                               | Centring vector, required when `--mode manual` is used.                                                                                                                                                                                                                                                                                                                                                |
| `-t`, `--table`      |                                             | Write a `name_csom_table.csv` summary file (point group, deviation, refined rotation matrix).                                                                                                                                                                                                                                                                                                          |
| `-f`, `--full`       |                                             | Write a `name_<PG>_details.csv` file per analysed point group, listing every individual symmetry operation's matrix and deviation.                                                                                                                                                                                                                                                                     |
| `-o`, `--operated`   |                                             | Write, per analysed point group, a `name_<PG>_operated.xyz` file with every symmetry-operated image of the structure at the minimum-deviation orientation, plus a `name_<PG>_merged.mol2` overlaying all of those images in one 3D structure for viewers such as Mercury. Bonds in the `.mol2` join atoms closer than 1.3 times the sum of their covalent radii, plus the centre atom to every ligand. |
| `-s`, `--seeds`      | `<N>`                                       | Number of candidate symmetry-axis directions, spread over a Fibonacci hemisphere, used to seed the axis search; each is refined at every in-plane orientation the point group tells apart. Defaults to `20`.                                                                                                                                                                                           |
| `-i`, `--iterations` | `<N>`                                       | Maximum number of Nelder-Mead iterations used to refine each seed. Defaults to `200`.                                                                                                                                                                                                                                                                                                                  |
| `-T`, `--tolerance`  | `<TOLERANCE>`                               | Convergence tolerance of the Nelder-Mead refinement (the standard deviation of the deviations across the simplex). Defaults to `1e-6`.                                                                                                                                                                                                                                                                 |
| `-g`, `--ignore`     |                                             | Ignore atom labels when searching for the best atom-to-atom permutation: every atom is treated as interchangeable regardless of element/label, instead of only matching atoms that share a label.                                                                                                                                                                                                      |

> [!warning]
> It is recommended not to change `--seeds`, `--iterations` or `--tolerance`.

## Example

Running the same `FeHS.xyz` structure from the [[cshm#Example|`cshm` example]] against the ideal octahedron symmetry `Oh` and the dihedral point group `D4h`:

```bash
cosmochlore csom FeHS.xyz -p Oh D4h -t
```

Will output:

```text
Input file: FeHS.xyz
========================
 Point group  Deviation
------------------------
 Oh           5.380
 D4h          5.611
------------------------
Writing output table to FeHS_csom_table.csv...
Program finished in 597.8122ms
```

Passing the `-t`/`--table` flag writes the point group / deviation / rotation matrix summary to `FeHS_csom_table.csv`. Passing `-f`/`--full` additionally writes, for every point group requested, a `FeHS_<PG>_details.csv` file breaking the deviation down by individual symmetry operation (e.g. `FeHS_Oh_details.csv` lists every one of `Oh`'s 48 operations separately).
