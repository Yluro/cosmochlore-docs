---
title: Continuous Shape Measures
tags:
  - theory
  - shape
---

Given two sets of $N$ points $P$ and $Q$ in $\mathbb{R}^n$ (normally $n = 3$), find the transformation $T$ that best maps $Q$ onto $P$, that is, the one that minimizes the sum of squared distances between paired points $p_i$ and $Tq_i$.

The Continuous Shape Measure of a problem shape $Q$ relative to a reference shape $P$ is the squared distance from $Q$ to $P$, normalised and expressed as a percentage [@pinsky_continuous_1998; @casanova_minimal_2004; @alvarez_shape_2005]:

$$
S_P(Q) = \min \left( \frac{\sum_{i}^{N} |q_i - p_i|^2}{\sum_{i}^{N} |p_i - p_0|^2} \right) \times 100
$$

where $N$ is the number of vertices in the structures being compared, $q_i$ and $p_i$ are the position vectors of the vertices of $Q$ and $P$, and $p_0$ is the geometric centre of the reference structure $P$. The minimum is taken over all rotations, translations and scaling, and over all $N!$ ways of pairing the vertices.

From the definition it follows that $S_P(Q) = 0$ if and only if $P$ and $Q$ have exactly the same shape. The maximum value of $S_P(Q)$ is 100, reached in the unrealistic case where all points of $Q$ collapse into a single point in space [@alvarez_shape_2005].

For coordination compounds, $S_P(Q) < 1$ is generally read as a small distortion from the reference shape, while larger values indicate a progressively more distorted, or different, geometry. The measure is independent of size and orientation, and is therefore comparable across structures [@alvarez_shape_2005].