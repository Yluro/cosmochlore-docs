---
title: Octahedral distortion parameters
tags:
  - theory
---

Given a six-coordinate centre, the octahedral distortion parameters are calculated from the bond distances and the
angles between the centre and its six ligands. Each one is a deviation from the perfect octahedron, so all of them
are $0$ for an ideal $O_h$ geometry. Most of them come from the spin-crossover literature, where they are used to
follow the change in the coordination sphere between spin states; $\zeta$, $\Sigma$ and $\Theta$ are collected in
Collet and Guionneau [@collet_structural_2018].

| Parameter         | Meaning                                                                                                                                                            | Reference                                                          |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------ |
| $d_{\text{mean}}$ | Mean M–X distance.                                                                                                                                                 | n/a                                                                |
| $\zeta$           | Bond-length distortion.                                                                                                                                            | [@buron-le_cointe_intermolecular_2012]                             |
| $\Delta$          | Normalized bond-length variance.                                                                                                                                   | [@lufaso_jahn-teller_2004]                                         |
| $\Sigma$          | Cis-angle distortion.                                                                                                                                              | [@drew_geometric_1995; @guionneau_high_2001; @mccusker_variable-temperature_1996] |
| $\Theta$          | Face-twisting distortion                                                     | [@marchivie_photo-induced_2005]; implementation as in [@ketkaew_octadist_2021] |
| $\tau$            | Trans-angle distortion.                                                                                                                                            | Introduced in Cosmochlore.                                         |
| $\mu$             | Norm of the mean ligand vector: a measure of how far the centre sits from the ligands' vector centroid.                                                            | Introduced in Cosmochlore.                                         |
| Volume            | Volume of the coordination polyhedron, in Å³. It is found by decomposing its eight triangular faces into tetrahedra with the ligand centroid as their common apex. | n/a                                                                |

$\tau$ and $\mu$ are metrics introduced in Cosmochlore.

Additionally, with `--full`, `odis` runs [[cshm|`cshm`]] against the ideal octahedron/trigonal prism and [[csom|`csom`]] against the point groups most commonly seen in octahedral distortions.

## Bond lengths

All bond-length parameters are built from the six centre–ligand distances $d_i = |\mathbf{v}_i|$, where $\mathbf{v}_i = \mathbf{L}_i - \mathbf{M}$ is the vector from the centre $\mathbf{M}$ to ligand $\mathbf{L}_i$.

$d_{\text{mean}}$, the size of the octahedron rather than its distortion:
$$
d_{\text{mean}} = \frac{1}{6} \sum_{i=1}^{6} d_i
$$

$\zeta$ [@buron-le_cointe_intermolecular_2012; @collet_structural_2018] is the total absolute deviation of the distances from their mean, in Å:

$$
\zeta = \sum_{i=1}^{6} \left| d_i - d_{\text{mean}} \right|
$$

$\Delta$ [@lufaso_jahn-teller_2004] is the variance of the distances relative to the mean, so it has no units and is comparable between centres of different size:

$$
\Delta = \frac{1}{6} \sum_{i=1}^{6} \left( \frac{d_i - d_{\text{mean}}}{d_{\text{mean}}} \right)^2
$$

$\mu$ is the length of the average centre–ligand vector, in Å. It is $0$ when the ligand vectors cancel out, as they do in any centrosymmetric octahedron, whatever its bond lengths, and grows as the centre moves off the ligands' centroid:

$$
\mu = \left| \frac{1}{6} \sum_{i=1}^{6} \mathbf{v}_i \right|
$$

## Angles

The 15 ligand–centre–ligand angles are sorted, and the 12 smallest are taken as the cis angles $\phi_i$ and the 3 largest as the trans angles $\psi_i$.

$\Sigma$ [@drew_geometric_1995; @guionneau_high_2001; @mccusker_variable-temperature_1996; @collet_structural_2018] is the total deviation of the cis angles from $90^\circ$:

$$
\Sigma = \sum_{i=1}^{12} \left| 90^\circ - \phi_i \right|
$$

$\tau$ is the total deviation of the trans angles from $180^\circ$:

$$
\tau = \sum_{i=1}^{3} \left| 180^\circ - \psi_i \right|
$$

$\Theta$ [@marchivie_photo-induced_2005; @collet_structural_2018] measures how far the octahedron has twisted towards a trigonal prism: it is $0^\circ$ for a perfect octahedron and goes up to $1170^\circ$ for the ideal trigonal prism. For each of the eight triangular faces, the centre and the three ligands of the opposite face are projected onto the plane of the face. Seen from above, the three face ligands and the three projected ligands alternate around the projected centre, and the six angles $\theta_{k,j}$ between neighbouring ones are all $60^\circ$ in a perfect octahedron (staggered faces). On the two eclipsed triangular faces of a trigonal prism they alternate between $0^\circ$ and $120^\circ$. The implementation of $\Theta$ in `odis` is the same as that of `OctaDist` [@ketkaew_octadist_2021]: the deviations are summed over all eight faces and halved, since each pair of opposite faces is counted once from either side:

$$
\Theta = \frac{1}{2} \sum_{k=1}^{8} \sum_{j=1}^{6} \left| 60^\circ - \theta_{k,j} \right|
$$

> [!note] Eight faces or 24 angles
> $\Theta$ is usually written as a single sum over 24 angles, six for each of the four pairs of opposite faces [@marchivie_photo-induced_2005; @ketkaew_octadist_2021]:
>
> $$
> \Theta = \sum_{j=1}^{24} \left| 60^\circ - \theta_j \right|
> $$
>
> The `odis` implementation, like `OctaDist`'s, instead projects onto each of the eight faces in turn, so every pair of opposite faces is measured twice, once from each side, and the total is halved. When opposite faces are parallel, as in any centrosymmetric octahedron, both views give the same six angles and the two forms are identical. When they are not, the two views differ slightly and the eight-face form reports their average.

## Volume

The octahedron is split into eight tetrahedra, one per triangular face $(\mathbf{L}_a, \mathbf{L}_b, \mathbf{L}_c)$, that share the ligand centroid $\mathbf{G} = \frac{1}{6}\sum_i \mathbf{L}_i$ as their common apex:

$$
V = \sum_{k=1}^{8} \frac{1}{6} \left| (\mathbf{L}_a - \mathbf{G}) \cdot \left[ (\mathbf{L}_b - \mathbf{G}) \times (\mathbf{L}_c - \mathbf{G}) \right] \right|
$$
