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

## Examples

>[!example]- Five-coordinate copper centre (τ5)
>
>Given the following `ML5.xyz` file, a five-coordinate copper centre halfway between a trigonal bipyramid and a square pyramid:
>
>```text title="ML5.xyz"
>6
>Distorted five-coordinate copper centre (halfway between trigonal bipyramidal and square pyramidal)
>Cu    0.00000    0.00000    0.00000
>N1    0.35000    0.05000    2.00000
>N2   -0.30000   -0.10000   -2.05000
>N3    2.10000    0.00000    0.10000
>N4   -1.78000    1.02000   -0.05000
>N5   -0.56000   -2.08000    0.00000
>```
>
>```bash
>cosmochlore gidx ML5.xyz -t
>```
>
>Will output:
>
>```text
>Input file: ML5.xyz
>==================================
> Geometry indices (CN = 5)
>----------------------------------
> Alpha                150.18  deg
> Beta                 177.91  deg
>----------------------------------
> Tau5                  0.462
>==================================
>Writing output table to ML5_gidx_table.csv...
>```

>[!example]- Four-coordinate copper centre (τ4 and τ4′)
>
>```text title="ML4.xyz"
>5
>Distorted four-coordinate copper centre (between tetrahedral and seesaw)
>Cu    0.00000    0.00000    0.00000
>N1    1.92000    0.31000   -0.60000
>N2   -1.83000   -0.28000   -0.62000
>N3    0.20000    1.62000    1.18000
>N4   -0.10000   -1.55000    1.35000
>```
>
>```bash
>cosmochlore gidx ML4.xyz
>```
>
>Will output:
>
>```text
>Input file: ML4.xyz
>==================================
> Geometry indices (CN = 4)
>----------------------------------
> Alpha                113.23  deg
> Beta                 144.34  deg
>----------------------------------
> Tau4                  0.726
> Tau4'                 0.630
>==================================
>Program finished in 339.4µs
>```
>
>Both indices fall between the seesaw and the tetrahedron. The two values differ because τ4′ also accounts for the difference between the two largest angles.

>[!example]- Six-coordinate iron centre (τ6 and τ6′)
>
>Using the `FeHS.xyz` structure from the [[cshm#Examples|`cshm` example]]:
>
>```bash
>cosmochlore gidx FeHS.xyz
>```
>
>Will output:
>
>```text
>Input file: FeHS.xyz
>==================================
> Geometry indices (CN = 6)
>----------------------------------
> Alpha 1              162.81  deg
> Alpha 2              161.60  deg
> Alpha 3              161.17  deg
> Gamma 1               73.14  deg
> Gamma 2               73.62  deg
> Gamma 3               88.05  deg
> Gamma 4               88.11  deg
> Gamma 5               88.12  deg
>----------------------------------
> Tau6                  0.302
> Tau6'                 0.433
>==================================
>Program finished in 377.4µs
>```

>[!example]- Eight-coordinate tantalum centre (τ8 and τ8′)
>
>A $D_{2d}$ dodecahedral TaCl<sub>4</sub>(PH<sub>3</sub>)<sub>4</sub> complex, with only the donor atoms kept:
>
>```text title="TaCl4_PH3_4_D2d.xyz"
>9
>TaCl4(PH3)4 (D2d), B3LYP/aVTZ optimised geometry, donor atoms only (Turnbull, Wetmore, Gerken, Chem. Eur. J. 2021, SI section 4.2)
>Ta       0.000000      0.000000      0.000000
>Cl1      0.000000      2.388165      0.831610
>Cl2     -2.388165      0.000000     -0.831610
>Cl3      0.000000     -2.388165      0.831610
>Cl4      2.388165      0.000000     -0.831610
>P1       1.719643      0.000000      2.060737
>P2      -1.719643      0.000000      2.060737
>P3       0.000000      1.719643     -2.060737
>P4       0.000000     -1.719643     -2.060737
>```
>
>```bash
>cosmochlore gidx TaCl4_PH3_4_D2d.xyz
>```
>
>Will output:
>
>```text
>Input file: TaCl4_PH3_4_D2d.xyz
>==================================
> Geometry indices (CN = 8)
>----------------------------------
> Theta 1              126.12  deg
> Phi 1                 96.21  deg
> Theta 2              126.12  deg
> Phi 2                 96.21  deg
> Dihedral A            90.00  deg
> Dihedral B            90.00  deg
>----------------------------------
> Tau8 (face 1)         0.913
> Tau8 (face 2)         0.913
> Tau8'                 1.000
> Tau8'-Tau8            0.087
>==================================
>Program finished in 364.3µs
>```
>
>The two faces give the same τ8, as expected from the $D_{2d}$ symmetry of the complex.

Passing the `-t`/`--table` flag writes the angles and the indices to a `<NAME>_gidx_table.csv`. The columns depend on the number of ligands:

| Ligands | Columns                                                                             |
| ------- | ----------------------------------------------------------------------------------- |
| 4       | `alpha,beta,tau4,tau4_prime`                                                        |
| 5       | `alpha,beta,tau5`                                                                   |
| 6       | `alpha1,alpha2,alpha3,tau6,gamma1,gamma2,gamma3,gamma4,gamma5,tau6_prime`           |
| 8       | `theta1,phi1,tau8_1,theta2,phi2,tau8_2,dihedral_a,dihedral_b,tau8_prime,cube_delta` |
