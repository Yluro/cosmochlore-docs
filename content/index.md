---
title: Cosmochlore
description: Continuous Shape/Symmetry Measurements & Octahedral distortion, in Rust.
---

**Cosm**chlo**r**e (**Co**ntinuous **S**hape & **S**ymmetry **M**easurements in **R**ust) is a fast, pure-Rust toolkit 
to analyse the geometry and symmetry of a molecular structure (or any set of 3-dimensional points), through various 
complementary analyses, including: Continuous Shape Measures (CShM), Continuous Symmetry Operation Measures (CSoM) 
and the calculation of several geometric parameters.

It is a from-scratch command line interface (CLI) tool that reimplements the shape-measure engine found in 
[`cosymlib`](https://github.com/GrupEstructuraElectronicaSimetria/cosymlib) and `SHAPE`[@alvarez_shape_2005] 2.1 in Rust, alongside an original implementation of continuous symmetry operation measures inspired by the works of T. J. Sørensen _et al._[@nielsen_csom_2024] and the octahedral distortion parameters popularized by [`OctaDist`](https://octadist.github.io/)[@ketkaew_octadist_2021]. Cosmochlore accurately reproduces `SHAPE`'s 2.1 results using a pruned branch-and-bound algorithm for significantly faster performance on larger coordination numbers.

Cosmochlore's error handling will always tell the user if something went wrong at run-time: the program will never silently crash or give you a number without you knowing something went wrong.

> [!info] Work in progress
> This site is the new home of the Cosmochlore documentation. Pages marked with a **To do** callout are still being written.

## What it measures

| Command                 | Analysis                                                                                                                                   |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| [[cshm\|cshm]] | Continuous Shape Measures (CShM) against 92 built-in reference polyhedra or your own shapes. A value of `CShM = 0` is a perfect match.     |
| [[csom\|csom]] | Continuous Symmetry Operation Measures (CSoM) against any of 47 point groups. A value of `CSoM = 0` means the symmetry is fully conserved. |
| [[odis\|odis]] | Bond-length and angular distortion parameters for six-coordinate centres.                                                                |
| [[gidx\|gidx]] | Geometry indices τ4 and τ4′ (four-coordinate), τ5 (five), τ6 and τ6′ (six), and τ8 and τ8′ (eight-coordinate centres).                     |

## Where to start

- **New here?** [[getting-started/installation|Install Cosmochlore]], then read the [[getting-started/usage|usage overview]].
- **Looking up a flag?** Go to the [[content/Modules/index|command reference]].
- **Choosing a reference shape or point group?** See [[reference/reference-polyhedra|reference polyhedra]] and [[reference/point-groups|supported point groups]].
- **Want to know how it works?** Read the [[theory/index|theory]] section.

## Future features

- [x] Include Cosmochlore into [[timeo/index|Timeo]], the Olex2 plugin.
- [ ] Automatic point-group detection for `csom` (currently `--pg` selects which of the 47 supported point groups to test, and all of them are tested when it is omitted).

_[See you in 25 years...](https://www.youtube.com/watch?v=BL57-9171pk)_

## About the name

The name of the tool comes from the mineral [Kosmochlor](https://en.wikipedia.org/wiki/Kosmochlor), a rare chromium clinopyroxene found in iron meteorites and as an accessory mineral to various other chromium-containing pyroxenes.
