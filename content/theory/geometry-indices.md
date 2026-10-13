---
title: Geometry Indices
tags:
  - theory
---

The Geometry Index ($\tau$) is a structural parameter that ranges from 0 to 1 that indicates the what geometry a coordination centre is taking into account the ligand–centre–ligand angles. 

They can be calculated by calling [[gidx]]. 
# Four-coordinate

The four coordinate indices τ<sub>4</sub> and τ<sub>4</sub>′  were developed by [@yang_structural_2007] and are calculated by the formulas:

$$
\tau_4 = \frac{360^\circ - (\alpha + \beta)}{360^\circ - 2\theta}
\qquad
\tau_4' = \frac{\beta - \alpha}{360^\circ - \theta} + \frac{180^\circ - \beta}{180^\circ - \theta}
$$

with $\theta = \arccos(-1/3) \approx 109.47^\circ$. Both range from 0 for the square-planar geometry and 1 for a regular tetrahedron.

## Five-coordinate: τ<sub>5</sub>

The five coordinate index was developed by 
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

# References
