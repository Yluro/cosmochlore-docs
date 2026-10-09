---
title: Continuous shape measures
tags:
  - theory
---

The Continuous Shape Measure of a problem shape $Q$ relative to a reference shape $P$ is

$$
S_P(Q) = \min \left( \frac{\sum_{i}^{N} |q_i - p_i|^2}{\sum_{i}^{N} |p_i - p_0|^2} \right) \times 100
$$

where $N$ is the number of vertices, $q_i$ and $p_i$ are the position vectors of the vertices of $Q$ and $P$, and $p_0$ is the geometric centre. The minimum is taken over all rotations, translations and scalings, and over all $N!$ ways of pairing the vertices.

## Alignment

Rotation, translation and scaling are solved with an SVD-based, Kabsch-style alignment.

## Vertex pairing

- **Fixed centre:** in centred structures, the central atom is always paired with the centre of the reference shape, so it is left out of the search.
- **Branch and bound:** after each partial pairing, a best-case $S$ is computed. Pairings that cannot beat the best $S$ found so far are discarded early.

> [!todo] To do
> Add a worked example and notes on performance at high coordination numbers.

See [[references]] for the original publications.
