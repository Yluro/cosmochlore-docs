---
title: cshm
description: Continuous Shape Measures against reference polyhedra.
tags:
  - command
---

Computes the [[continuous-shape-measures|Continuous Shape Measures]](CShM) between a structure and one or more idealized reference
shapes. Cosmochlore includes 92 built-in [[reference/reference-polyhedra|reference polyhedra]],
and [[user-defined-shapes|user-defined]] ones can be supplied via YAML.

```bash
cosmochlore cshm <NAME> [OPTIONS]
```

## Options

| Flag             | Value              | Description                                                                                                                                                                                                                          |
|------------------|--------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `-n`, `--nc`     |                    | Treat the problem shape as non-centered, that is, the structure does **not** include an explicit central atom (only ligand/vertex coordinates are given).                                                                            |
| `-c`, `--center` | `<POSITION>`       | 1-based position of the atom in the `.xyz` table that is the centre of the structure. Defaults to the first atom (position 1) when omitted. Cannot be combined with `--nc`.                                                          |
| `-s`, `--sh`     | `<SHAPES>...`      | Restrict the comparison to specific [[reference/reference-polyhedra\|built-in reference shapes]] by index, for the detected vertex count. If omitted, all applicable built-in shapes are used. Separate the indices with whitespace. |
| `-r`, `--ref`    | `<USER_SHAPES>...` | Paths to the YAML files that contain [[reference/user-defined-shapes\|user-defined shapes]] to include in the CShM calculation. Separate the files with whitespace.                                                                  |
| `-t`, `--table`  |                    | Write a `name_cshm_table.csv` file containing the output of the calculation.                                                                                                                                                         |
| `-i`, `--ideal`  |                    | Write a `name_ideal.xyz` file containing the reconstructed idealised structures for **all** the selected reference shapes.                                                                                                           |

_Oh..., I lost my crab here. 🦀 Thanks for finding it!_

## Optimal transformation finding

For any given shapes, it can be shown that the optimal translation and scaling are obtained by centring both shapes on 
their geometric centres and normalizing their size. The optimal rotation $R$ is then the one that minimizes 
$\sum_i^N |R q_i - p_i|^2$, which is solved via singular-value decomposition of the covariance matrix $H = P^TQ$.
### Vertex pairing

Naively finding the best point-pair matches between $Q$ and $P$, grows with $N!$. The combinatorial problem is tackled by:

- **Fixed centre:** for centred structures, the central atom is paired with the reference shape's centre, reducing the dimensionality of the problem to $(N-1)!$
- **Branch and bound:** after each partial assignment of point pairs, a best-scenario $S$ value is calculated. Permutations that cannot beat the best $S$ found so far are discarded early.

>[!bug] Computational cost
>Even by taking these measures, the calculation becomes impractical at $N > 13$ and completely unaccessible for $N > 24$. There is a plan to include heuristic matching for large shapes in [[cshm]] in the future.

## Examples

>[!example]- Distorted octahedral iron(II) complex, with a user-defined shape
>
>Given the following `FeHS.xyz` file:
>
>```text title="FeHS.xyz"
>7
>High-spin iron(ii) complex
>Fe6 4.93013 10.3906 12.9236
>N004 6.21021 10.6927 14.7824
>N006 4.99632 8.50231 13.9489
>N008 6.81046 10.0777 11.7691
>N00B 5.46476 12.2907 12.1187
>N00C 3.30099 11.3236 13.8608
>N00D 3.74774 9.47633 11.4653
>```
>
>Running:
>
>```bash
>cosmochlore cshm FeHS.xyz --ref ebcT-6.yaml -t -i
>```
>
>Will output:
>
>```text
>Input file: FeHS.xyz
>============================================================
> Symbol   Shape                           Symmetry   CShM
>------------------------------------------------------------
> HP-6     Hexagon                         D6h        33.210
> PPY-6    Pentagonal pyramid              C5v        23.050
> OC-6     Octahedron                      Oh         2.089
> TPR-6    Trigonal prism                  D3h        11.079
> JPPY-6   Johnson pentagonal pyramid J2   C5v        27.050
> ebcT-6   Edge-bicapped tetrahedron       D2d        14.277
>------------------------------------------------------------
>Writing output table to FeHS_cshm_table.csv...
>Writing idealised polyhedra coordinates to table to FeHS_ideal.xyz...
>Program finished in 6.8154ms
>```
>
>The lowest CShM is against the octahedron (`OC-6`, 2.089), meaning the iron centre has a moderately distorted octahedral coordination environment.
>
>The output of the calculation is saved in the file `FeHS_cshm_table.csv` by passing the `-t`/`--table` flag.
>
>```csv title="FeHS_cshm_table.csv"
>Symbol,Name,Symmetry,CShM
>HP-6,Hexagon,D6h,33.210
>PPY-6,Pentagonal pyramid,C5v,23.050
>OC-6,Octahedron,Oh,2.089
>TPR-6,Trigonal prism,D3h,11.079
>JPPY-6,Johnson pentagonal pyramid J2,C5v,27.050
>ebcT-6,Edge-bicapped tetrahedron,D2d,14.277
>```
>
>The `FeHS_ideal.xyz` file was produced by passing the `-i`/`--ideal` flag. The coordinates of the ideal octahedron placed in the correct position of the structure can be extracted from it.
>
><img width="411" height="355" alt="ideal reference octahedron superimposed with the problem shape" src="https://github.com/user-attachments/assets/490458e7-a4a5-4c0b-b82d-3444ace939e6" />
>
>Note that `ebcT-6` is a non-standard reference shape included by passing the `--ref` flag. Its YAML definition is on the [[reference/user-defined-shapes|user-defined shapes]] page.

>[!example]- Non-centred structure: a pyridine ring
>
>A pyridine ring has no central atom, so the `-n`/`--nc` flag is needed. All six atoms are then treated as vertices.
>
>```text title="Co110_pyridine.xyz"
>6
>Co110 part 0
>N14 2.178776 6.987902 12.271005
>C19 0.680230 6.204588 14.464450
>C20 1.483930 5.816450 12.233931
>C25 0.735126 5.411294 13.325930
>C30 1.384024 7.394160 14.494005
>C17 2.124076 7.759082 13.373102
>```
>
>```bash
>cosmochlore cshm Co110_pyridine.xyz -n
>```
>
>Will output:
>
>```text
>Input file: Co110_pyridine.xyz
>============================================================
> Symbol   Shape                           Symmetry   CShM
>------------------------------------------------------------
> HP-6     Hexagon                         D6h        0.014
> PPY-6    Pentagonal pyramid              C5v        27.994
> OC-6     Octahedron                      Oh         33.244
> TPR-6    Trigonal prism                  D3h        33.535
> JPPY-6   Johnson pentagonal pyramid J2   C5v        25.135
>------------------------------------------------------------
>Program finished in 906.3µs
>```
>
>The ring is an almost perfect hexagon (`HP-6`, 0.014). CShM only compares positions, so the nitrogen atom is treated like any other vertex.

>[!example]- Restricting the comparison to selected shapes
>
>For a five-coordinate cadmium centre, only the trigonal bipyramid and the square pyramid are of interest. Their [[reference/reference-polyhedra|indices]] for five vertices are `2` (`TBPY-5`) and `3` (`SPY-5`):
>
>```text title="CdONCl3.xyz"
>6
>Five-coordinate Cd1 (CdONCl3) of Acta Cryst. E81, 393-400 (CCDC 2441688)
>Cd1     6.18403    12.69910     7.20280
>O1      5.03750    12.82268     5.15546
>N3      7.81940    12.17629     5.69285
>Cl1     4.30070    11.74221     8.44098
>Cl2     6.38607    15.10826     7.98044
>Cl3     8.04110    12.06770     9.04477
>```
>
>```bash
>cosmochlore cshm CdONCl3.xyz -s 2 3
>```
>
>Will output:
>
>```text
>Input file: CdONCl3.xyz
>=======================================================
> Symbol   Shape                      Symmetry   CShM
>-------------------------------------------------------
> TBPY-5   Trigonal bipyramid         D3h        2.871
> SPY-5    Spherical square pyramid   C4v        2.039
>-------------------------------------------------------
>Program finished in 470.9µs
>```
>
>The cadmium centre is closer to a square pyramid than to a trigonal bipyramid, but it is distorted from both.
