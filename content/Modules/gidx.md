---
title: gidx
description: Geometry indices τ4, τ4′, τ5, τ6, τ6′, τ8 and τ8′.
tags:
  - command
---

Computes the [[theory/geometry-indices|geometry indices]] of a four-, five-, six- or eight-coordinate centre. The indices that apply are chosen from the number of ligands: τ4 and τ4′ for four, τ5 for five, τ6 and its complement τ6′ for six, and τ8 and τ8′ for eight.

```bash
cosmochlore gidx <NAME> [OPTIONS]
```

> [!important]
> `gidx` needs a centred structure with exactly one central atom and four, five, six or eight ligands (5, 6, 7 or 9 atoms in the `.xyz` file).

## Options

| Flag             | Value        | Description                                                                                                                                 |
| ---------------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `-c`, `--center` | `<POSITION>` | 1-based position of the atom in the `.xyz` table that is the centre of the structure. Defaults to the first atom (position 1) when omitted. |
| `-t`, `--table`  |              | Write the output table to a `.csv` file.                                                                                                    |

## Example

Given the following `ML5.xyz` file, a five-coordinate copper centre halfway between a trigonal bipyramid and a square pyramid:

```text title="ML5.xyz"
6
Distorted five-coordinate copper centre (halfway between trigonal bipyramidal and square pyramidal)
Cu    0.00000    0.00000    0.00000
N1    0.35000    0.05000    2.00000
N2   -0.30000   -0.10000   -2.05000
N3    2.10000    0.00000    0.10000
N4   -1.78000    1.02000   -0.05000
N5   -0.56000   -2.08000    0.00000
```

```bash
cosmochlore gidx ML5.xyz -t
```

Will output:

```text
Input file: ML5.xyz
==================================
 Geometry indices (CN = 5)
----------------------------------
 Alpha                150.18  deg
 Beta                 177.91  deg
----------------------------------
 Tau5                  0.462
==================================
Writing output table to ML5_gidx_table.csv...
```

Passing the `-t`/`--table` flag writes the angles and the indices to a `<NAME>_gidx_table.csv`. The columns depend on the number of ligands:

| Ligands | Columns                                                                             |
| ------- | ----------------------------------------------------------------------------------- |
| 4       | `alpha,beta,tau4,tau4_prime`                                                        |
| 5       | `alpha,beta,tau5`                                                                   |
| 6       | `alpha1,alpha2,alpha3,tau6,gamma1,gamma2,gamma3,gamma4,gamma5,tau6_prime`           |
| 8       | `theta1,phi1,tau8_1,theta2,phi2,tau8_2,dihedral_a,dihedral_b,tau8_prime,cube_delta` |
