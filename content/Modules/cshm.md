---
title: cshm
description: Continuous Shape Measures against reference polyhedra.
tags:
  - command
---

Computes the [**C**ontinuous **Sh**ape **M**easure](continuous-shape-measures)(CShM) between a structure and one or more idealised reference shapes. $S = 0$ is a perfect match; larger values mean a more distorted structure. 92 built-in reference polyhedra are included (see [[reference/reference-polyhedra|reference polyhedra]]), and user-defined ones can be supplied via YAML. See [[theory/continuous-shape-measures|the cshm algorithm]] for the definition.

```bash
cosmochlore cshm <NAME> [OPTIONS]
```

## Options

| Flag             | Value              | Description                                                                                                                                                                                                                          |
| ---------------- | ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `-n`, `--nc`     |                    | The structure does **not** include an explicit central atom (only ligand/vertex coordinates are given). If a structure contains a central atom, Cosmochlore assumes it is in the first position of the `.xyz` file.                  |
| `-c`, `--center` | `<POSITION>`       | 1-based position of the atom in the `.xyz` table that is the centre of the structure. Defaults to the first atom (position 1) when omitted. Cannot be combined with `--nc`.                                                          |
| `-s`, `--sh`     | `<SHAPES>...`      | Restrict the comparison to specific [[reference/reference-polyhedra\|built-in reference shapes]] by index, for the detected vertex count. If omitted, all applicable built-in shapes are used. Separate the indices with whitespace. |
| `-r`, `--ref`    | `<USER_SHAPES>...` | Paths to the YAML files that contain [[reference/user-defined-shapes\|user-defined shapes]] to include in the CShM calculation. Separate the files with whitespace.                                                                  |
| `-t`, `--table`  |                    | Write a `name_cshm_table.csv` file containing the output of the calculation.                                                                                                                                                         |
| `-i`, `--ideal`  |                    | Write a `name_ideal.xyz` file containing the reconstructed idealised structures for **all** the selected reference shapes.                                                                                                           |

_Oh..., I lost my crab here. 🦀 Thanks for finding it!_

## Example

Given the following `FeHS.xyz` file:

```text title="FeHS.xyz"
7
High-spin iron(ii) complex
Fe6 4.93013 10.3906 12.9236
N004 6.21021 10.6927 14.7824
N006 4.99632 8.50231 13.9489
N008 6.81046 10.0777 11.7691
N00B 5.46476 12.2907 12.1187
N00C 3.30099 11.3236 13.8608
N00D 3.74774 9.47633 11.4653
```

Running:

```bash
cosmochlore cshm FeHS.xyz --ref ebcT-6.yaml -t -i
```

Will output:

```text
Input file: FeHS.xyz
============================================================
 Symbol   Shape                           Symmetry   CShM
------------------------------------------------------------
 HP-6     Hexagon                         D6h        33.210
 PPY-6    Pentagonal pyramid              C5v        23.050
 OC-6     Octahedron                      Oh         2.089
 TPR-6    Trigonal prism                  D3h        11.079
 JPPY-6   Johnson pentagonal pyramid J2   C5v        27.050
 ebcT-6   Edge-bicapped tetrahedron       D2d        14.277
------------------------------------------------------------
Writing output table to FeHS_cshm_table.csv...
Writing idealised polyhedra coordinates to table to FeHS_ideal.xyz...
Program finished in 6.8154ms
```

The lowest CShM is against the octahedron (`OC-6`, 2.089), so the iron centre is a slightly distorted octahedron.

The output of the calculation is saved in the file `FeHS_cshm_table.csv` by passing the `-t`/`--table` flag.

```csv title="FeHS_cshm_table.csv"
Symbol,Name,Symmetry,CShM
HP-6,Hexagon,D6h,33.210
PPY-6,Pentagonal pyramid,C5v,23.050
OC-6,Octahedron,Oh,2.089
TPR-6,Trigonal prism,D3h,11.079
JPPY-6,Johnson pentagonal pyramid J2,C5v,27.050
ebcT-6,Edge-bicapped tetrahedron,D2d,14.277
```

The `FeHS_ideal.xyz` file was produced by passing the `-i`/`--ideal` flag. The coordinates of the ideal octahedron placed in the correct position of the structure can be extracted from it.

<img width="411" height="355" alt="ideal reference octahedron superimposed with the problem shape" src="https://github.com/user-attachments/assets/490458e7-a4a5-4c0b-b82d-3444ace939e6" />

Note that `ebcT-6` is a non-standard reference shape included by passing the `--ref` flag. Its YAML definition is on the [[reference/user-defined-shapes|user-defined shapes]] page.
