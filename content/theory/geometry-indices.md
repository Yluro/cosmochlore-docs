---
title: Geometry indices
tags:
  - theory
---

[[commands/gidx|`gidx`]] places a coordination centre between ideal geometries using only its ligand–centre–ligand angles; bond lengths play no part. For four and five ligands, $\beta$ and $\alpha$ are the largest and second-largest of those angles.

## Four-coordinate: τ4 and τ4′

$$
\tau_4 = \frac{360^\circ - (\alpha + \beta)}{360^\circ - 2\theta}
\qquad
\tau_4' = \frac{\beta - \alpha}{360^\circ - \theta} + \frac{180^\circ - \beta}{180^\circ - \theta}
$$

with $\theta = \arccos(-1/3) \approx 109.47^\circ$. Both are 0 for a square plane and 1 for a regular tetrahedron.

## Five-coordinate: τ5

$$
\tau_5 = \frac{\beta - \alpha}{60^\circ}
$$

0 for a square pyramid, 1 for a trigonal bipyramid.

## Six-coordinate: τ6 and τ6′

$$
\tau_6 = \frac{3 \times 180^\circ - (\alpha_1 + \alpha_2 + \alpha_3)}{180^\circ}
\qquad
\tau_6' = \frac{5 \times 90^\circ - (\gamma_1 + \dots + \gamma_5)}{90^\circ}
$$

$\alpha_1 \ge \alpha_2 \ge \alpha_3$ are the three trans angles, and $\gamma_1 \le \dots \le \gamma_5$ are the five smallest angles. τ6′ is Cosmochlore's own complement to τ6.

> [!todo] To do
> Port the tables of indices for the ideal shapes and the notes on pairing trans angles from the [README](https://github.com/Yluro/cosmochlore#geometry-indices).
