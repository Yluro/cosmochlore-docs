---
title: Continuous Shape Measures
tags:
  - theory
  - shape
---

Given two sets of $N$ points $P$ and $Q$ in $\mathbb{R}^n$ (normally $n = 3$), find the transformation $T$ that best maps $Q$ onto $P$, that is, the one that minimizes the sum of squared distances between paired points $p_i$ and $Tq_i$.

The Continuous Shape Measure of a problem shape $Q$ relative to a reference shape $P$ is the value of this minimisation, normalised and expressed as a percentage [@pinsky_continuous_1998; @casanova_minimal_2004; @alvarez_shape_2005]:

$$
S_P(Q) = \min \left( \frac{\sum_{i}^{N} |q_i - p_i|^2}{\sum_{i}^{N} |p_i - p_0|^2} \right) \times 100
$$

where $N$ is the number of vertices in the structures being compared, $q_i$ and $p_i$ are the position vectors of the vertices of $Q$ and $P$, and $p_0$ is the geometric centre of the reference structure $P$. The minimum is taken over all rotations, translations and scaling, and over all $N!$ ways of pairing the vertices.

From the definition it follows that $S_P(Q) = 0$ if and only if $P$ and $Q$ have exactly the same shape. The maximum value of $S_P(Q)$ is 100, reached in the unrealistic case where all points of $Q$ collapse into a single point in space [@alvarez_shape_2005].

For coordination compounds, $S_P(Q) < 1$ is generally read as a small distortion from the reference shape, while larger values indicate a progressively more distorted, or different, geometry. The measure is independent of size and orientation, and is therefore comparable across structures [@alvarez_shape_2005].

## Optimal transformation

For any given shapes, it can be shown that the optimal translation and scaling are obtained by centring both shapes on their geometric centres and normalizing their size. The optimal rotation $R$ is then the one that minimizes $\sum_i^N |R q_i - p_i|^2$, which is solved via singular-value decomposition of the covariance matrix $H = P^TQ$.

### Vertex pairing

Naively finding the best point-pair matches between $Q$ and $P$, grows with $N!$. The combinatorial problem is tackled by:

- **Fixed centre:** for centred structures, the central atom is paired with the reference shape's centre, reducing the dimensionality of the problem to $(N-1)!$
- **Branch and bound:** after each partial assignment of point pairs, a best-scenario $S$ value is calculated. Permutations that cannot beat the best $S$ found so far are discarded early.

>[!note]
>Even by taking these measures, the calculation becomes impractical at $N > 13$ and completely unaccessible for $N > 24$. There is a plan to include heuristic matching for large shapes in [[cshm]].