---
title: csom
description: Continuous Symmetry Operation Measures against point groups.
tags:
  - command
---

Computes the [[theory/continuous-symmetry-operation-measures|continuous symmetry operation measure]] (CSoM): how far a 
structure is from possessing a given point group's symmetry operations, searching over all orientations for the 
best fit. Cosmochlore supports 47 chemically important [[point-groups|point groups]].

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
> Changing `--seeds`, `--iterations` or `--tolerance` may result in long run times. It is recommended to leave them at their defaults.

## Orientation search

The symmetry operations of every [[reference/point-groups|point group]] are tabulated with the principal axis along $z$, 
so the structure first has to be rotated into the orientation $R$ that minimizes $S_G(RQ)$ (see 
[[theory/continuous-symmetry-operation-measures#Orientation Matrix|orientation matrix]]). Once the structure is centred 
(see `--mode`), `csom` searches for $R$ in three steps:

1. **Fibonacci-hemisphere seeding:** `--seeds` candidate directions for the principal axis are spread evenly over the 
   upper hemisphere (an axis and its opposite are the same axis), and each seed is the rotation that carries one of them 
   onto $z$. Whatever the input orientation, some seed therefore starts with the true axis within the lattice spacing of $z$. 
   Aligning the axis leaves the spin about it free. When the point group has vertical mirror planes or perpendicular $C_2$ 
   axes, which make that spin matter, every direction is also tried at several in-plane angles, in steps no coarser than the 
   lattice spacing, up to the angle after which the group repeats: 90° for $C_{2v}$ or $O_h$, 30° for $D_{6h}$, and none 
   at all for $C_n$, $S_n$, $C_{nh}$, $C_s$ or $C_i$.
2. **Nelder-Mead refinement:** every seed is refined with the derivative-free Nelder-Mead method over the three components 
   of the rotation vector, until the simplex converges to `--tolerance` or `--iterations` steps are reached. The refined 
   rotation with the lowest deviation over all seeds is kept as the orientation for that point group.
3. **Atom pairing:** for every operation $\hat{O}$, the pairing $\pi$ of each image $\hat{O}Rq_i$ with an original point is 
   found with the Hungarian algorithm. Atoms are only paired with atoms of the same element, read from the start of their 
   label (`N004` and `N006` are both `N`), unless `--ignore` is passed. When the structure is centred on an atom, that atom 
   sits at the origin and is invariant under every operation, so it is paired with itself and left out of the search. This 
   reduces the size of the assignment by one at no cost in accuracy.

## Examples

>[!example]- Distorted octahedral iron(II) complex
>
>Running the same `FeHS.xyz` structure from the [[cshm#Examples|`cshm` example]] against the ideal octahedron symmetry `Oh` and the dihedral point group `D4h`:
>
>```bash
>cosmochlore csom FeHS.xyz -p Oh D4h -t
>```
>
>Will output:
>
>```text
>Input file: FeHS.xyz
>========================
> Point group  Deviation
>------------------------
> Oh           5.380
> D4h          5.611
>------------------------
>Writing output table to FeHS_csom_table.csv...
>Program finished in 597.8122ms
>```
>
>> [!note]
>> Since the orientation is searched and the problem space is not convex,
>> the reported value is the lowest one found, but there is no guarantee that it is the true minimum.
>> It is guaranteed to be the an upper bound to the true $S_G(Q), though, the default search settings are enough for the usual coordination polyhedra.
>
>Passing the `-t`/`--table` flag writes the point group / deviation / rotation matrix summary to `FeHS_csom_table.csv`. Passing `-f`/`--full` additionally writes, for every point group requested, a `FeHS_<PG>_details.csv` file breaking the deviation down by individual symmetry operation (e.g. `FeHS_Oh_details.csv` lists every one of `Oh`'s 48 operations separately).

>[!example]- Ignoring atom labels
>
>Analysing the symmetry of a pyridine ring.
>
>```bash
>cosmochlore csom Co110_pyridine.xyz -n -p D6h C2v
>```
>
>Will output:
>
>```text
>Input file: Co110_pyridine.xyz
>====================
> Point group  CSoM
>--------------------
> D6h          58.886
> C2v          0.007
>--------------------
>Program finished in 125.383ms
>```
>
>By default, atoms are only matched to atoms with the same label, so the nitrogen cannot be swapped with a carbon and the ring is far from `D6h`. Passing `-g`/`--ignore` treats all atoms as interchangeable:
>
>```bash
>cosmochlore csom Co110_pyridine.xyz -n -p D6h C2v -g
>```
>
>```text
>Input file: Co110_pyridine.xyz
>====================
> Point group  CSoM
>--------------------
> D6h          0.030
> C2v          0.007
>--------------------
>Program finished in 94.4138ms
>```
>
>The ring geometry is then almost perfectly hexagonal, in agreement with its CShM of 0.014 against `HP-6`.

>[!example]- Writing the symmetry-operated structures
>
>For a water molecule, the `-o`/`--operated` flag writes the structure after every operation of `C2v`:
>
>```text title="ideal_water.xyz"
>3
>XYZ file generated by Avogadro.
>O     -4.5397776977    3.1473492733    0.0333348403
>H     -4.9536404076    3.4919675150   -0.7976641349
>H     -3.5781806052    3.0596193558   -0.1862963625
>```
>
>```bash
>cosmochlore csom ideal_water.xyz -p C2v -o
>```
>
>Will output:
>
>```text
>Input file: ideal_water.xyz
>====================
> Point group  CSoM
>--------------------
> C2v          0.000
>--------------------
>Writing operated coordinates to ideal_water_C2v_operated.xyz...
>Writing merged mol2 to ideal_water_C2v_merged.mol2...
>Program finished in 40.1069ms
>```
>
>The `.xyz` file holds one frame per operation, with the deviation of that operation in the comment line. In the `C2` and $\sigma_v(yz)$ frames, the two hydrogen atoms have swapped places:
>
>```text title="ideal_water_C2v_operated.xyz"
>3
>C2v E dev = 0.000
>O  -4.539778  3.147349  0.033335
>H  -4.953640  3.491968  -0.797664
>H  -3.578181  3.059619  -0.186296
>
>3
>C2v C2 dev = 0.000
>O  -4.539778  3.147349  0.033335
>H  -3.578169  3.059645  -0.186256
>H  -4.953607  3.492004  -0.797666
>
>3
>C2v sigma_v(xz) dev = 0.000
>O  -4.539778  3.147349  0.033335
>H  -4.953630  3.492028  -0.797644
>H  -3.578178  3.059632  -0.186292
>
>3
>C2v sigma_v(yz) dev = 0.000
>O  -4.539778  3.147349  0.033335
>H  -3.578179  3.059585  -0.186276
>H  -4.953609  3.491991  -0.797670
>```
>
>The `ideal_water_C2v_merged.mol2` file overlays all four images, which can be opened in a viewer such as Mercury.
