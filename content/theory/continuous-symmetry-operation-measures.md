---
title: Continuous Symmetry Operation Measures
tags:
  - theory
  - csom
---

Given a set of $N$ points $Q$ in $\mathbb{R}^3$ and a point group $G$, the continuous symmetry operation measure $S_G(Q)$ describes how far $Q$ is from being invariant under every symmetry operation $\hat{O}$ of $G$, that is, how well the points map onto themselves when the operation is applied [@nielsen_csom_2024].

For a single operation $\hat{O}$, the continuous symmetry operation measure $S_{\hat{O}}(Q)$ is defined as the sum of squared distances between each point
and the position it is moved to, normalized and expressed as a percentage:

$$
S_{\hat{O}}(Q) = \min_{\pi} \left( \frac{\sum_{i}^{N} |q_{\pi(i)} - \hat{O}q_i|^2}{\sum_{i}^{N} |q_i - q_0|^2} \right) \times 100
$$

where $q_i$ are the position vectors of the points, $q_0$ is the centre of the structure, and $\pi$ is the pairing of each
image $\hat{O}q_i$ with one of the original points. This minimization is done only in the permutation $\pi(i)$. 
This formula is analogous to the formulation of the [[continuous-shape-measures|continuous shape measures]]. 

The CSoM of the structure against the point group is the average of this deviation over all of its operations (the identity contributes $0$, as it moves nothing):

$$
S_G(Q) = \min_{R} \frac{1}{|G| - 1} \sum_{\hat{O} \in G, \hat{O} \neq E} S_{\hat{O}}(RQ)
$$

where $|G|$ is the order of the group, $E$ the unitary operation, and $R$ is a 3-D rotation
matrix that orients $Q$ towards the principal axis of the point group.

From the definition it follows that $S_G(RQ) = 0$ if and only if $Q$ has all the symmetry of $G$ in some orientation $R$, 
that is, if $RQ$ is invariant in $G$. The measure is normalized by the size of the structure, so it is independent of scale
and comparable across structures. As with the shape measure, values close to zero mean that the structure conserves 
all the symmetry elements of a given point group while larger values indicate that symmetry is lost.

### Averaging

Averaging over all the group's operations makes the measure a property of
the whole point group $G$ even if $G$ is a poor descriptor of $Q$. If pairings are consistent, the average $\bar{Q}$
of all images $\hat{O}RQ$ is the structure with exactly the symmetry of $G$ that 
is nearest to $Q$, and the normalized squared distance $S_Q(\bar{Q})$ is

$$
S_Q(\hat{Q}) = \frac{|G|-1}{2|G|} \times S_G(Q)
$$

When the pairings are not consistent, that value is only a lower bound on the distance.

### Orientation Matrix

Since the symmetry elements of $G$ are formulated as have a fixed position in space,
the continuous symmetry operation measure orients
the structure in such a way that minimizes $S_G(RQ)$ by refining the values of $R$.

Whenever the image of a point lands near another point of the same kind, the pairing
absorbs the movement and the deviation is small. The deviation of an operation is thus
the cost of making the structure fall onto itself after the operation has been applied.
A structure with small deviations for most operations and a large one for a few has lost
those operations specifically, which is why the individual deviations are as informative
as the average (see `--full` in [[csom]]).

## Reading the results

| Question                         | Shape measure (CShM)            | Symmetry operation measure (CSoM)       |
| -------------------------------- | ------------------------------- | --------------------------------------- |
| What is it compared against?     | A reference polyhedron          | The operations of a point group         |
| What is free to move?            | Rotation, translation and scale | Rotation only                           |
| What does zero mean?             | Exactly the reference shape     | Exactly the symmetry of the point group |
| Does atom type matter?           | No                              | Yes, unless `--ignore` is passed        |

A few things to keep in mind when reading a CSoM:

>[!note] Low symmetry space groups and $S_G(Q)$
>Although it is easy to find low values of $S_G(Q)$ for low symmetry space groups (e.g. $C_{2v}$); a point group 
> that is a subgroup of another one is not guaranteed to give a lower value. 
>The average is taken over a different set of operations, and the best orientation is not the same 
>for both. In the [[csom#Examples|csom example]], a distorted octahedral complex gives $5.38$ for $O_h$ 
>and $5.61$ for its subgroup $D_{4h}$. The groups are better compared through the individual deviations 
>of their operations.

>[!note] High symmetry groups
> Because of the averaging, a group of large order can hide a single poorly conserved operation. 
> Looking at the deviation of each operation tells these cases apart.
