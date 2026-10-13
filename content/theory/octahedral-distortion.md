---
title: Octahedral distortion parameters
tags:
  - theory
---

[[commands/odis|`odis`]] reports the OctaDist bond-length and angular distortion parameters for a six-coordinate centre:

| Parameter         | Meaning                                                                                  |
| ----------------- | ---------------------------------------------------------------------------------------- |
| $d_{\text{mean}}$ | Mean M–X distance.                                                                       |
| $\zeta$           | Bond-length distortion.                                                                  |
| $\Delta$          | Normalized bond-length variance.                                                         |
| $\Sigma$          | Cis-angle distortion.                                                                    |
| $\Theta$          | Face-twisting distortion.                                                                |
| $\tau$            | Trans-angle distortion.                                                                  |
| $\mu$             | Norm of the mean ligand vector: how far the centre is from the ligands' vector centroid. |
| Volume            | Volume of the coordination polyhedron, in Å³.                                            |

With `--full`, `odis` also runs [[commands/cshm|`cshm`]] against the ideal octahedron and trigonal prism, and [[commands/csom|`csom`]] against the point groups most often seen in distorted octahedra.

> [!todo] To do
> Add the formula for each parameter.
