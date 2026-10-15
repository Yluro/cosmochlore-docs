---
title: Usage
tags:
  - timeo
---

Timeo functions can be run from the Olex2 console as `spy.Timeo.*` or from the panels under Tools > Timeo.

## Selecting atoms

All analyses use the same selection rules:

- **One atom selected:** the neighbouring atoms are taken into account to form a _centered_ shape, such as a coordination complex.
- **Several atoms selected:** they are interpreted as a _non-centered_ shape, such as a borane cluster.

>[!fail] Grown Structures
> Selecting symmetry-generated atoms from a *grown* structure will result in either an error or a wrong calculation. Selecting an atom whose neighbours are outside the unit cell is no problem. 


Workflow:

1. Open a structure in Olex2.
2. Select the atoms you want to include.
3. Run a function from the console or the panel. See [[timeo/cosmochlore|Cosmochlore]], [[other-programs|autoSHAPE]] and [[timeo/octahedral-distortion|octahedral distortion]].

| Function                  | Analysis                                           |
| ------------------------- | -------------------------------------------------- |
| `spy.Timeo.autoCSHM()`    | Continuous shape measures (Cosmochlore).           |
| `spy.Timeo.autoCSOM()`    | Continuous symmetry operation measures (Cosmochlore). |
| `spy.Timeo.autoODIS()`    | Octahedral distortion (Cosmochlore).               |
| `spy.Timeo.autoSHAPE()`   | Continuous shape measures through SHAPE 2.1.       |
| `spy.Timeo.autoOCTADIST()` | Octahedral distortion (Timeo's own implementation). |

## π-bonded ligands

Timeo can detect η<sup>n</sup> π-bonded ligands. When `merge_ligands` is enabled, the coordinates of all the donor atoms of each ligand are averaged to its centroid before measuring, following Cirera _et al._<sup>[[references|1]]</sup>

> [!note]
> Centroid search does not work with ligands outside the asymmetric unit.

Use `exclude_h` to leave hydrogen and deuterium atoms out of the coordination polyhedron. Both options are described in [[timeo/settings|settings]].

## Disorder

Disorder is handled automatically. If more than two parts are found in the selected structure, the calculation is run on each part separately.

By default every measurement uses part 0 plus part N. If the selected atom is in part 0 and has connected atoms in parts 1 and 2, the measures run on parts 0 + 1 and 0 + 2.

You can set the parts yourself with part codes (`part_codes` in [[timeo/settings|settings]]). Codes are separated by spaces, and each code is measured as one structure. Every digit of a code is a part:

| Part codes | Measurements                                                |
| ---------- | ----------------------------------------------------------- |
| _(empty)_  | Part 0 with each other part (default).                      |
| `0`        | Atoms in part 0 only.                                       |
| `01`       | Atoms in parts 0 and 1.                                     |
| `01 02`    | Two measurements: parts 0 + 1 and parts 0 + 2.              |
| `12 34`    | Two measurements: parts 1 + 2 together, and parts 3 + 4 together. |

## Output

Results are printed to the Olex2 console. Files are written next to the structure:

| Analysis                                                          | Location                                                   |
| ----------------------------------------------------------------- | ---------------------------------------------------------- |
| Cosmochlore ([[timeo/cosmochlore\|autoCSHM, autoCSOM, autoODIS]]) | `<FilePath>/cosmochlore/`                                  |
| [[other-programs\|autoSHAPE]]                                    | `<FilePath>\autoSHAPE\<FileName>_<part>_<atoms>\<run>`     |
| [[timeo/octahedral-distortion\|autoOCTADIST]]                     | `<FilePath>/OH_distortion`                                 |
