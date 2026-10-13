---
title: Cosmochlore
description: Continuous Shape & Symmetry Measurements in Rust.
---

**COSMO**chlo**R**e (**Co**ntinuous **S**hape & **S**ymmetry **M**easurements in **R**ust) is a fast, pure-Rust command line tool for quantifying how closely a molecular structure, or any set of 3D points, matches an idealized reference geometry. Definetly

> [!info] Work in progress
> This site is the new home of the Cosmochlore documentation. Pages marked with a **To do** callout are still being written. Until then, the [README](https://github.com/Yluro/cosmochlore#readme) remains the reference.

## What it measures

| Command                 | Analysis                                                                                     |
| ----------------------- | -------------------------------------------------------------------------------------------- |
| [[commands/cshm\|cshm]] | Continuous Shape Measures (CShM) against 90 built-in reference polyhedra or your own shapes. |
| [[commands/csom\|csom]] | Continuous Symmetry Operation Measures (CSoM) against any of 47 point groups.                |
| [[commands/odis\|odis]] | OctaDist-style bond-length and angular distortion parameters for six-coordinate centres.     |
| [[commands/gidx\|gidx]] | Geometry indices τ4, τ4′, τ5, τ6 and τ6′ for four-, five- and six-coordinate centres.        |

## Where to start

- **New here?** [[getting-started/installation|Install Cosmochlore]], then read the [[getting-started/usage|usage overview]].
- **Looking up a flag?** Go to the [[commands/index|command reference]].
- **Choosing a reference shape or point group?** See [[reference/reference-polyhedra|reference polyhedra]] and [[reference/point-groups|supported point groups]].
- **Want to know how it works?** Read the [[theory/index|theory]] section.

## About the name

The name comes from the mineral [kosmochlor](https://en.wikipedia.org/wiki/Kosmochlor), a rare emerald-green chromium clinopyroxene found in iron meteorites.
