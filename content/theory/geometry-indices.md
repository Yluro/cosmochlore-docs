---
title: Geometry Indices
tags:
  - theory
---

The geometry indices ($\tau$) are structural parameters that indicate which geometry a coordination centre is taking, from the ligand–centre–ligand angles alone, so bond lengths play no part.

They are calculated by [[gidx|gidx]]. The coordination number is the number of ligands in the file (any other count is an error): four ligands give τ4 and τ4′, five give τ5, six give τ6 and τ6′, and eight give τ8 and τ8′. The angles each index is built from are reported too.

>[!note]
> The indices are only dependant on angles, so shapes that share their largest angles share their index.

## Four and five ligands

Only the two largest of all the angles between pairs of ligands are used, the largest as $\beta$ and the second largest as $\alpha$ (so $\beta \ge \alpha$). 

**τ<sub>4</sub>** [@yang_structural_2007] is 0 for a square plane and 1 for a regular tetrahedron; the ideal seesaw (0.64) and trigonal pyramid (0.85) lie in between.

$$
\tau_4 = \frac{360^\circ - (\alpha + \beta)}{360^\circ - 2\theta}
$$

**τ<sub>4</sub>′** [@okuniewski_coordination_2015] has the same limits, but it also weighs the difference between the two angles, so geometries with the same $\alpha + \beta$ (the ideal seesaw and a tetrahedron flattened to 135° and 135°) no longer share a value.

$$
\tau_4' = \frac{\beta - \alpha}{360^\circ - \theta} + \frac{180^\circ - \beta}{180^\circ - \theta}
$$

**τ<sub>5</sub>** [@addison_synthesis_1984] is 0 for a square pyramid and 1 for a trigonal bipyramid.

$$
\tau_5 = \frac{\beta - \alpha}{60^\circ}
$$

## Six ligands

**τ<sub>6</sub>** [@stoeckli_tau6_2025] uses the three principal (trans) angles $\alpha_1 \ge \alpha_2 \ge \alpha_3$. It is 0 for an octahedron and 0.75 for a trigonal prism with trans angles of 135°. The paper gives no rule for picking them in a distorted structure, so `gidx` pairs the six ligands into three disjoint pairs whose angles add up to the most (the three largest angles whenever those do not share a ligand).

$$
\tau_6 = \frac{3 \times 180^\circ - (\alpha_1 + \alpha_2 + \alpha_3)}{180^\circ}
$$

**τ<sub>6</sub>′** is Cosmochlore's own complement to τ<sub>6</sub>. It uses the five smallest of the 15 ligand–centre–ligand angles, $\gamma_1 \le \dots \le \gamma_5$, which may share a ligand. It is 0 for an octahedron (cis angles of 90°), 0.456 for the equal-edge trigonal prism and 1 for a pentagonal pyramid (base angles of 72°). It measures how tightly the ligands pack, so it also grows for chelates with small bite angles, and it can exceed 1 (a planar hexagon gives 1.667).

$$
\tau_6' = \frac{5 \times 90^\circ - \sum_{i=1}^{5} \gamma_i}{90^\circ}
$$

> [!note] Pentagonal pyramid
> The paper quotes $\tau_6 = 1.00$ for a pentagonal pyramid, but it gets there by summing the five angles between adjacent base vectors (5 × 72° = 360°) instead of three trans angles. `gidx` takes three trans angles for $\tau_6$, so the ideal pentagonal pyramid, whose trans angles are 144°, 144° and 90°, reads 0.900 there and 1.000 in $\tau_6'$, which uses those five base angles.

>[!note]
>The uniform trigonal prism (all edges equal) has trans angles of 135.58°, so its τ6 is 0.740. 
>The 0.75 quoted in the paper is for trans angles of exactly 135°.


## Eight ligands

**τ<sub>8</sub>** [@turnbull_stabilisation_2021] is 0 for the square antiprism and the cube, and 1 for the trigonal dodecahedron. $\theta$ and $\phi$ are the angles that the two diagonals of a "square face" of the eight ligands subtend at the centre. As in the paper, the face holding the first ligand is found from the ligand across it (the one at the third largest of its seven angles) and the two ligands closest to both; the other four ligands make the second face. Each face gives a τ<sub>8</sub> and both are reported: two faces that disagree (about 1 and 0) point to a bicapped trigonal prism.

$$
\tau_8 = \frac{|\theta - \phi|}{129.82^\circ - 97.07^\circ}
$$

**τ<sub>8</sub>′** [@turnbull_stabilisation_2021] is 1 for the trigonal dodecahedron and 0 for the square antiprism. The cube also reads 1, so τ<sub>8</sub>′ separates the antiprism from the other two and τ<sub>8</sub> the cube from the dodecahedron. $\delta_A$ and $\delta_B$ are the dihedral angles between the planes through the centre and each pair of A ligands, and of B ligands. The larger diagonal of a face joins its two A ligands and the smaller one its two B ligands; the first A ligand is paired with the A at the smallest angle to it, and the first B with the B at the largest.

$$
\tau_8' = 1 - \frac{|180^\circ - (\delta_A + \delta_B)|}{180^\circ - 2 \times 65.53^\circ}
$$

The paper's $\Delta = \tau_8' - \tau_8$ (`cube_delta`) is output too, with the larger τ<sub>8</sub> of the two faces: it is 1 for a cube and 0 for the ideal dodecahedron and antiprism.

>[!warning]
>τ8 and τ8′ are defined for the dodecahedron, antiprism, cube and bicapped-prism family. For other eight-vertex shapes τ8′ can be negative (`ETBPY-8`: −0.533) or undefined: a plane through the centre and two exactly opposite ligands does not exist, and `gidx` reports an error (`JGBF-8`, `HBPY-8`).


## Exact constants

`gidx` uses the exact angles calculated from the geometry of the reference shapes., so the ideal polyhedra give exactly 0 or 1. For τ<sub>4</sub> and τ<sub>4</sub>′ these are $\theta$ and $360^\circ - 2\theta$ (printed 109.5° and 141°).

For τ<sub>8</sub> and τ<sub>8</sub>′, the paper's 129.8°, 97.1° and 65.5° come from the hard-sphere polyhedra of Kepert [@kepert_aspects_1978]. In his dodecahedron the A and B sites sit at 36.85° and 69.46° from the $S_4$ axis, so the face diagonals subtend $\arccos(-\cos^2 36.85^\circ) = 129.8208^\circ$ and $\arccos(-\cos^2 69.46^\circ) = 97.0714^\circ$. In his antiprism all edges are equal and the planes close to $\arccos(\sqrt{2} - 1) = 65.5302^\circ$.

## Geometry indices of the ideal shapes

The values `gidx` gives for the [[reference/reference-polyhedra|built-in reference shapes]] with four, five and six vertices (centre at the origin), angles in degrees:

| Symbol    | Shape                     | Symmetry | α      | β      | τ4    | τ4′   |
| --------- | ------------------------- | -------- | ------ | ------ | ----- | ----- |
| `SP-4`    | Square                    | D4h      | 180.00 | 180.00 | 0.000 | 0.000 |
| `T-4`     | Tetrahedron               | Td       | 109.47 | 109.47 | 1.000 | 1.000 |
| `SS-4`    | Seesaw                    | C2v      | 90.00  | 180.00 | 0.638 | 0.359 |
| `vTBPY-4` | Vacant trigonal bipyramid | C3v      | 120.00 | 120.00 | 0.851 | 0.851 |

| Symbol    | Shape                          | Symmetry | α      | β      | τ5    |
| --------- | ------------------------------ | -------- | ------ | ------ | ----- |
| `PP-5`    | Pentagon                       | D5h      | 144.00 | 144.00 | 0.000 |
| `vOC-5`   | Vacant octahedron              | C4v      | 180.00 | 180.00 | 0.000 |
| `TBPY-5`  | Trigonal bipyramid             | D3h      | 120.00 | 180.00 | 1.000 |
| `SPY-5`   | Spherical square pyramid       | C4v      | 151.04 | 151.04 | 0.000 |
| `JTBPY-5` | Johnson trigonal bipyramid J12 | D3h      | 120.00 | 180.00 | 1.000 |

| Symbol   | Shape                         | Symmetry | τ6    | τ6′   |
| -------- | ----------------------------- | -------- | ----- | ----- |
| `OC-6`   | Octahedron                    | Oh       | 0.000 | 0.000 |
| `TPR-6`  | Trigonal prism                | D3h      | 0.740 | 0.456 |
| `PPY-6`  | Pentagonal pyramid            | C5v      | 0.900 | 1.000 |
| `JPPY-6` | Johnson pentagonal pyramid J2 | C5v      | 0.900 | 1.000 |
| `HP-6`   | Hexagon                       | D6h      | 0.000 | 1.667 |

Slightly distorted versions of the same shapes are found in the crystal structures below, one six-coordinate cadmium each (coordinates from their CIF files; "Paper τ6" is the value the paper gives for the site):

| Structure          | Closest ideal shape | Paper τ6 | τ6    | τ6′   |
| ------------------ | ------------------- | -------- | ----- | ----- |
| `IQATAY` Cd1       | Octahedron          | 0        | 0.000 | 0.120 |
| `IQATAY` Cd2       | Octahedron          | 0.06     | 0.059 | 0.188 |
| `IQATAY` Cd3       | Octahedron          | 0.16     | 0.159 | 0.305 |
| `IQATAY` Cd4       | Octahedron          | 0.17     | 0.173 | 0.293 |
| Title compound Cd2 | Octahedron          | 0.27     | 0.270 | 0.471 |
| `ULESAH` Cd1       | Trigonal prism      | 0.73     | 0.734 | 0.511 |
| `VAPSAG` Cd1       | Pentagonal pyramid  | 1.02     | 0.820 | 1.044 |
| `CIJBII` Cd1       | Pentagonal pyramid  | 1.0      | 0.682 | 0.995 |

For the two pyramids the paper's value is $(1 + \tau_6')/2$ (1.022 and 0.998), see above.

| Symbol                                                   | Shape                                                       | Symmetry | τ8            | τ8′   | Δ      |
| -------------------------------------------------------- | ----------------------------------------------------------- | -------- | ------------- | ----- | ------ |
| `SAPR-8`                                                 | Square antiprism                                            | D4d      | 0.000         | 0.000 | 0.000  |
| `TDD-8`                                                  | Triangular dodecahedron                                     | D2d      | 1.000         | 1.000 | 0.000  |
| `CU-8`                                                   | Cube                                                        | Oh       | 0.000         | 1.000 | 1.000  |
| `BTPR-8`                                                 | Biaugmented trigonal prism                                  | C2v      | 1.167 / 0.000 | 0.408 | −0.758 |
| `JBTPR-8`                                                | Johnson-Biaugmented trigonal prism (J50)                    | C2v      | 1.167 / 0.000 | 0.408 | −0.758 |
| `JSD-8`                                                  | Snub disphenoid (J84)                                       | D2d      | 1.222         | 1.000 | −0.222 |
| [WF<sub>4</sub>(PH<sub>3</sub>)<sub>4</sub>]<sup>+</sup> | DFT structure from the paper [@turnbull_stabilisation_2021] | D2       | 0.356         | 0.406 | 0.049  |

$\Delta = \tau_8' - \tau_8$ (the larger τ8 of the two faces). The two values of τ8 for the biaugmented trigonal prism are those of its two square faces. The last row is the DFT-optimised structure of the paper's supporting information (donor atoms only, `tests/tau8/WF4_PH3_4_D2.xyz`), in between the dodecahedron and the antiprism; its two faces give the same τ8.

> [!note] Chelate complexes in the supporting information
> For some chelates, the τ<sub>8</sub> values listed in the paper's supporting information [@turnbull_stabilisation_2021] differ from this procedure: it lists τ<sub>8</sub> = 1.22 for [WF<sub>4</sub>(dpb)<sub>2</sub>]<sup>+</sup> (D<sub>2d</sub>), where `gidx` gives 1.10 from the coordinates in the same file, and 0.05 and 0.02 for the C<sub>2</sub> state of [WF<sub>4</sub>(dpe)<sub>2</sub>]<sup>+</sup>, where it gives 0.06 and 0.05. The source of the difference could not be traced.


# References
