---
title: Continuous Symmetry Operation Measures
tags:
  - theory
  - csom
---

Given a shape defined by a set $N$ points $Q$ in $\mathbb{R}^3$ and a point group $G$, the continuous symmetry operation 
measure $S_G(Q)$ describes how far $Q$ is from being invariant under every symmetry operation $\hat{O}$ of $G$,
that is, how well the points map onto themselves when the operation is applied [@nielsen_csom_2024].

For a single symmetry operation $\hat{O}$, the continuous symmetry operation measure $S_{\hat{O}}(Q)$ is defined as 
the sum of squared distances between the points $Q$ and the points of the $\hat{O}Q$, normalized and expressed as a percentage:

$$
S_{\hat{O}}(Q) = \min_{\pi} \left( \frac{\sum_{i}^{N} |q_{\pi(i)} - \hat{O}q_i|^2}{\sum_{i}^{N} |q_i - q_0|^2} \right) \times 100
$$

where $q_0$ is the geometrical centre of the structure, and $\pi$ is the permutation that pairs each
image $\hat{O}q_i$ with one of the original points. The minimization runs only over the permutations $\pi$.
This formula is analogous to the formulation of the [[continuous-shape-measures|continuous shape measures]]: it quantifies
how far the image $\hat{O}Q$ lands from the original set $Q$.

The CSoM of the structure against the point group $G$ is the average of this deviation over all of its operations
except the identity $E$, which contributes $0$ as it moves nothing.

$$
S_G(Q) = \min_{R} \frac{1}{|G| - 1} \sum_{\hat{O} \in G \setminus \{E\}} S_{\hat{O}}(RQ)
$$

where $|G|$ is the order of the group (i.e. its number of operations) and R is a rotation matrix in $\mathbb{R}^3$ about 
$q_0$.  and

From the definition it follows that $S_G(RQ) = 0$ if and only if $Q$ has all the symmetry of $G$ in some orientation $R^*$, 
that is, if $R^*Q$ is invariant in $G$. 

Whenever the image of a point lands near another point of the same kind, the pairing
absorbs the movement and the deviation is small. The deviation of an operation is thus
the cost of making the structure fall onto itself after the operation has been applied.

The measure is normalized by the size of the structure, so it is independent of scale
and comparable across structures. As with the continuous shape measure, values close to zero mean that the structure conserves
all the symmetry elements of a given point group while larger values indicate gradual symmetry is loss.

### Averaging

Averaging over all the group's operations makes the measure a property of the whole point group $G$ even if $G$ 
is a poor descriptor of $Q$. If pairings are consistent, the average $\bar{Q}$
of all images $\hat{O}R^*Q$ is the structure with exactly the symmetry of $G$ that 
is nearest to $Q$, and the normalized squared distance $S_Q(\bar{Q})$ is

$$
S_Q(\bar{Q}) = \frac{|G|-1}{2|G|} \times S_G(Q)
$$

When the pairings are not consistent, that value is only a lower bound on the distance.

The same averaging has a cost: $S_G(Q)$ is a mean over $|G| - 1$ operations, so for a group of large order a single
poorly conserved operation contributes only a fraction $1/(|G| - 1)$ of its deviation and can be hidden by the
rest. A small $S_G(Q)$ therefore says that the structure is close to $G$ on average, not that every operation of
$G$ is conserved; the individual deviations $S_{\hat{O}}(R^{*}Q)$ distinguish these cases.

### Orientation Matrix

Since the symmetry elements of $G$ have a fixed position in space, the average is evaluated on a rotated
copy $RQ$. The orientation matrix $R^*$ of is the rotation that attains the minimum value for $S_G(Q)$:

$$
R^{*} = \arg \min_R S_G(Q)
$$

thus:

$$
S_G(Q) = \frac{1}{|G| - 1} \sum_{\hat{O} \neq E} S_{\hat{O}}(R^{*}Q)
$$

That is, given the set of symmetry operation measures $\{S_{\hat{O}}\}_{\hat{O} \in G}$, $R^{*}$ is the matrix that
orients $Q$ such that $R^{*}Q$ has the minimum score.

### Comparing point groups

$S_G(Q)$ is defined by two things that both depend on $G$: the set of operations and the orientation $R^{*}$ that 
minimizes that average. $S_G(Q)$ is therefore not monotonic along the subgroup lattice: if $H$ is a subgroup of $G$, 
then, in general, neither $S_H(Q) \leq S_G(Q)$ nor $S_H(Q) \geq S_G(Q)$ hold since the two measures average over 
different sets of operations with different optimal orientations, $R^{*}_H \neq R^{*}_G$. 
In the [[csom#Examples|csom example]], a distorted octahedral complex gives $5.38$ for $O_h$ and $5.61$ for its subgroup $D_{4h}$.

Likewise, low values of $S_G(Q)$ are easy to reach for groups with few operations, such as $C_{2}$, because
the average then involves few constraints on $Q$. A single value of $S_G(Q)$ is thus not enough to rank
point groups: they are better compared through the individual deviations $S_{\hat{O}}(R^{*}Q)$ of their operations
(see `--full` in [[csom]]).
