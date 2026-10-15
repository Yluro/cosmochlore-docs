---
title: Reference Polyhedra
tags:
  - reference
---

The geometries of 92 reference polyhedra, ranging from 2 to 60 vertices, are internally defined in Cosmochlore. 
This list was derived entirely from the `SHAPE` 2.1 list of reference polyhedra and has been discussed in numerous 
articles by Álvarez, Alemany, Avnir, LLunell, Cirera _et al._ [@alvarez_shape_2005] 
Select them with [[cshm|`cshm -s/--sh`]] by their index within each vertex count, or add your 
own with [[reference/user-defined-shapes|user-defined shapes]].

> [!note] Shape Indices
> The index of each shape differs from `SHAPE`'s 2.1 by 1: indices here start at 0. 
> (The original numbering starting from one is probably due to Fortran arrays being [silly](https://xkcd.com/163/).)

| Vertices | Index | Label      | Shape                                                          | Symmetry |
| -------- | ----- | ---------- | -------------------------------------------------------------- | -------- |
| 2        | 0     | L-2        | Linear                                                         | $D_{\infty h}$|
| 2        | 1     | vT-2       | Divacant tetrahedron (V-shape, 109.47º)                        | $C_{2v}$ |
| 2        | 2     | vOC-2      | Tetravacant octahedron (L-shape, 90º)                          | $C_{2v}$ |
| 3        | 0     | TP-3       | Trigonal planar                                                | $D_{3h}$ |
| 3        | 1     | vT-3       | Pyramid‡ (vacant tetrahedron)                                  | $C_{3v}$ |
| 3        | 2     | fac-vOC-3  | Trivacant octahedron                                           | $C_{3v}$ |
| 3        | 3     | mer-vOC-3  | Trivacant octahedron (T-shape)                                 | $C_{2v}$ |
| 4        | 0     | SP-4       | Square                                                         | $D_{4h}$ |
| 4        | 1     | T-4        | Tetrahedron                                                    | $T_{d}$  |
| 4        | 2     | SS-4       | Seesaw or sawhorse‡ (cis-divacant octahedron)                  | $C_{2v}$ |
| 4        | 3     | vTBPY-4    | Axially vacant trigonal bipyramid                              | $C_{3v}$ |
| 5        | 0     | PP-5       | Pentagon                                                       | $D_{5h}$ |
| 5        | 1     | vOC-5      | Vacant octahedron‡ (Johnson square pyramid, J1)                | $C_{4v}$ |
| 5        | 2     | TBPY-5     | Trigonal bipyramid                                             | $D_{3h}$ |
| 5        | 3     | SPY-5      | Square pyramid§                                                | $C_{4v}$ |
| 5        | 4     | JTBPY-5    | Johnson trigonal bipyramid (J12)                               | $D_{3h}$ |
| 6        | 0     | HP-6       | Hexagon                                                        | $D_{6h}$ |
| 6        | 1     | PPY-6      | Pentagonal pyramid                                             | $C_{5v}$ |
| 6        | 2     | OC-6       | Octahedron                                                     | $O_{h}$  |
| 6        | 3     | TPR-6      | Trigonal prism                                                 | $D_{3h}$ |
| 6        | 4     | JPPY-6     | Johnson pentagonal pyramid (J2)                                | $C_{5v}$ |
| 7        | 0     | HP-7       | Heptagon                                                       | $D_{7h}$ |
| 7        | 1     | HPY-7      | Hexagonal pyramid                                              | $C_{6v}$ |
| 7        | 2     | PBPY-7     | Pentagonal bipyramid                                           | $D_{5h}$ |
| 7        | 3     | COC-7      | Capped octahedron*                                             | $C_{3v}$ |
| 7        | 4     | CTPR-7     | Capped trigonal prism*                                         | $C_{2v}$ |
| 7        | 5     | JPBPY-7    | Johnson pentagonal bipyramid (J13)                             | $D_{5h}$ |
| 7        | 6     | JETPY-7    | Elongated triangular pyramid (J7)                              | $C_{3v}$ |
| 8        | 0     | OP-8       | Octagon                                                        | $D_{8h}$ |
| 8        | 1     | HPY-8      | Heptagonal pyramid                                             | $C_{7v}$ |
| 8        | 2     | HBPY-8     | Hexagonal bipyramid                                            | $D_{6h}$ |
| 8        | 3     | CU-8       | Cube                                                           | $O_{h}$  |
| 8        | 4     | SAPR-8     | Square antiprism                                               | $D_{4d}$ |
| 8        | 5     | TDD-8      | Triangular dodecahedron                                        | $D_{2d}$ |
| 8        | 6     | JGBF-8     | Johnson-Gyrobifastigium (J26)                                  | $D_{2d}$ |
| 8        | 7     | JETBPY-8   | Johnson-Elongated triangular bipyramid (J14)                   | $D_{3h}$ |
| 8        | 8     | JBTPR-8    | Johnson-Biaugmented trigonal prism (J50)                       | $C_{2v}$ |
| 8        | 9     | BTPR-8     | Biaugmented trigonal prism                                     | $C_{2v}$ |
| 8        | 10    | JSD-8      | Snub disphenoid (J84)                                          | $D_{2d}$ |
| 8        | 11    | TT-8       | Triakis tetrahedron                                            | $T_{d}$  |
| 8        | 12    | ETBPY-8    | Elongated trigonal bipyramid (see 8)                           | $D_{3h}$ |
| 9        | 0     | EP-9       | Enneagon                                                       | $D_{9h}$ |
| 9        | 1     | OPY-9      | Octagonal pyramid                                              | $C_{8v}$ |
| 9        | 2     | HBPY-9     | Heptagonal bipyramid                                           | $D_{7h}$ |
| 9        | 3     | JTC-9      | Triangular cupola (J3) = trivacant cuboctahedron               | $C_{3v}$ |
| 9        | 4     | JCCU-9     | Capped cube (Elongated square pyramid, J8)                     | $C_{4v}$ |
| 9        | 5     | CCU-9      | Capped cube                                                    | $C_{4v}$ |
| 9        | 6     | JCSAPR-9   | Capped sq. antiprism (Gyroelongated square pyramid J10)        | $C_{4v}$ |
| 9        | 7     | CSAPR-9    | Capped square antiprism                                        | $C_{4v}$ |
| 9        | 8     | JTCTPR-9   | Tricapped trigonal prism (J51)                                 | $D_{3h}$ |
| 9        | 9     | TCTPR-9    | Tricapped trigonal prism                                       | $D_{3h}$ |
| 9        | 10    | JTDIC-9    | Tridiminished icosahedron (J63)                                | $C_{3v}$ |
| 9        | 11    | HH-9       | Hula-hoop                                                      | $C_{2v}$ |
| 9        | 12    | MFF-9      | Muffin                                                         | $C_{s}$  |
| 10       | 0     | DP-10      | Decagon                                                        | $D_{10h}$|
| 10       | 1     | EPY-10     | Enneagonal pyramid                                             | $C_{9v}$ |
| 10       | 2     | OBPY-10    | Octagonal bipyramid                                            | $D_{8h}$ |
| 10       | 3     | PPR-10     | Pentagonal prism                                               | $D_{5h}$ |
| 10       | 4     | PAPR-10    | Pentagonal antiprism                                           | $D_{5d}$ |
| 10       | 5     | JBCCU-10   | Bicapped cube (Elongated square bipyramid J15)                 | $D_{4h}$ |
| 10       | 6     | JBCSAPR-10 | Bicapped square antiprism (Gyroelongated square bipyramid J17) | $D_{4d}$ |
| 10       | 7     | JMBIC-10   | Metabidiminished icosahedron (J62)                             | $C_{2v}$ |
| 10       | 8     | JATDI-10   | Augmented tridiminished icosahedron (J64)                      | $C_{3v}$ |
| 10       | 9     | JSPC-10    | Sphenocorona (J87)                                             | $C_{2v}$ |
| 10       | 10    | SDD-10     | Staggered dodecahedron (2:6:2)#                                | $D_{2}$  |
| 10       | 11    | TD-10      | Tetradecahedron (2:6:2)                                        | $C_{2v}$ |
| 10       | 12    | HD-10      | Hexadecahedron (2:6:2, or 1:4:4:1)                             | $D_{4h}$ |
| 11       | 0     | HP-11      | Hendecagon                                                     | $D_{11h}$|
| 11       | 1     | DPY-11     | Decagonal pyramid                                              | $C_{10v}$|
| 11       | 2     | EBPY-11    | Enneagonal bipyramid                                           | $D_{9h}$ |
| 11       | 3     | JCPPR-11   | Capped pent. prism (Elongated pentagonal pyramid J9)           | $C_{5v}$ |
| 11       | 4     | JCPAPR-11  | Capped pent. antiprism (Gyroelongated pentagonal pyramid J11)  | $C_{5v}$ |
| 11       | 5     | JAPPR-11   | Augmented pentagonal prism (J52)                               | $C_{2v}$ |
| 11       | 6     | JASPC-11   | Augmented sphenocorona (J87)                                   | $C_{s}$  |
| 12       | 0     | DP-12      | Dodecagon                                                      | $D_{12h}$|
| 12       | 1     | HPY-12     | Hendecagonal pyramid                                           | $C_{11v}$|
| 12       | 2     | DBPY-12    | Decagonal bipyramid                                            | $D_{10h}$|
| 12       | 3     | HPR-12     | Hexagonal prism                                                | $D_{6h}$ |
| 12       | 4     | HAPR-12    | Hexagonal antiprism                                            | $D_{6d}$ |
| 12       | 5     | TT-12      | Truncated tetrahedron                                          | $T_{d}$  |
| 12       | 6     | COC-12     | Cuboctahedron                                                  | $O_{h}$  |
| 12       | 7     | ACOC-12    | Anticuboctahedron (Triangular orthobicupola J27)               | $D_{3h}$ |
| 12       | 8     | IC-12      | Icosahedron                                                    | $I_{h}$  |
| 12       | 9     | JSC-12     | Square cupola (J4)                                             | $C_{4v}$ |
| 12       | 10    | JEPBPY-12  | Elongated pentagonal bipyramid (J16)                           | $D_{6h}$ |
| 12       | 11    | JBAPPR-12  | Biaugmented pentagonal prism (J53)                             | $C_{2v}$ |
| 12       | 12    | JSPMC-12   | Sphenomegacorona (J88)                                         | $C_{s}$  |
| 20       | 0     | DD-20      | Dodecahedron†                                                  | $I_{h}$  |
| 24       | 0     | TCU-24     | Truncated cube                                                 | $O_{h}$  |
| 24       | 1     | TOC-24     | Truncated octahedron                                           | $O_{h}$  |
| 48       | 0     | TCOC-48    | Truncated cuboctahedron                                        | $O_{h}$  |
| 60       | 0     | TIC-60     | Truncated icosahedron (fullerene)                              | $I_{h}$  |

\* Non-regular polyhedron; see the references for the definition of the reference shape.

‡ A regular polyhedron with one or two vertices removed.

§ Spherical distribution of vertices with the centre of mass at the origin (apical-basal bond angles of 104.45º).

† For polyhedra with more than 12 vertices, calculation times may be impractical.

\# Chiral polyhedron. `cshm`'s algorithm does not distinguish the two enantiomers of a chiral shape, so the resulting 
shape measures may refer to the enantiomer of the polyhedron rather than to the polyhedron itself.