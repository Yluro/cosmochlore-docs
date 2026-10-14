---
title: Octahedral distortion parameters
tags:
  - theory
---

[[odis|`odis`]] reports the `OctaDist`<sup>[[references|4]]</sup> bond-length and angular distortion parameters for a six-coordinate centre:

| Parameter         | Meaning                                                                                                                                                            |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| $d_{\text{mean}}$ | Mean M–X distance.                                                                                                                                                 |
| $\zeta$           | Bond-length distortion.                                                                                                                                            |
| $\Delta$          | Normalized bond-length variance.                                                                                                                                   |
| $\Sigma$          | Cis-angle distortion.                                                                                                                                              |
| $\Theta$          | Face-twisting distortion: 0° for a perfect octahedron, up to 1170° for the ideal trigonal prism.                                                                   |
| $\tau$            | Trans-angle distortion.                                                                                                                                            |
| $\mu$             | Norm of the mean ligand vector: a measure of how far the centre sits from the ligands' vector centroid.                                                            |
| Volume            | Volume of the coordination polyhedron, in Å³. It is found by decomposing its eight triangular faces into tetrahedra with the ligand centroid as their common apex. |

Additionally, with `--full`, `odis` runs [[cshm|`cshm`]] against the ideal octahedron/trigonal prism and [[csom|`csom`]] against the point groups most commonly seen in octahedral distortions.

> [!todo] To do
> Add the formula for each parameter.
