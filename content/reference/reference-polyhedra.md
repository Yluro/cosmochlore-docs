---
title: Reference polyhedra
tags:
  - reference
---

Cosmochlore defines the geometries of 90 reference polyhedra, from 2 to 60 vertices. The list is taken from the `SHAPE` 2.1 set of reference polyhedra. Select them with [[commands/cshm|`cshm -s/--sh`]] by their index within each vertex count.

> [!note]
> Indices start at 0, so they are one less than the `SHAPE` 2.1 indices.

| Vertices | Index | Label | Shape                                   | Symmetry |
| -------- | ----- | ----- | --------------------------------------- | -------- |
| 2        | 0     | L-2   | Linear                                  | D∞h      |
| 2        | 1     | vT-2  | Divacant tetrahedron (V-shape, 109.47°) | C2v      |
| 2        | 2     | vOC-2 | Tetravacant octahedron (L-shape, 90°)   | C2v      |
| …        |       |       |                                         |          |

> [!todo] To do
> Port the full table of 90 shapes from the [README](https://github.com/Yluro/cosmochlore#reference-polyhedra).
