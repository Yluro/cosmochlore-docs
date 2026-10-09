---
title: Continuous symmetry operation measures
tags:
  - theory
---

Symmetry operations depend on how a shape is oriented in space. Once the structure is centred, `csom` looks for the orientation that minimizes the average deviation from the symmetry operations of a given point group.

1. **Fibonacci-hemisphere seeding:** `--seeds` candidate directions for the principal axis are spread over the upper hemisphere, and each is rotated onto $z$. When the point group has vertical mirror planes or perpendicular $C_2$ axes, each direction is also tried at several in-plane angles.
2. **Nelder-Mead refinement:** each seed is optimized over the three components of the rotation vector until the simplex converges to `--tolerance` or reaches `--iterations` steps. The best rotation over all seeds is kept.
3. **Pair matching:** the deviation for each operation $\hat{O}$ is $S_Q(\hat{O}RQ)$, where $R$ is the refined rotation, minimized over atom pairings with the Hungarian algorithm. Only atoms with the same label are paired unless `--ignore` is given.

The reported CSoM is the deviation averaged over all symmetry operations of the point group.

> [!todo] To do
> Add a diagram of the seeding step and an example of the `--operated` output.
