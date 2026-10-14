---
title: odis
description: OctaDist-style octahedral distortion parameters.
tags:
  - command
---

Computes the [[theory/octahedral-distortion|octahedral distortion parameters]] of a six-coordinate centre: `OctaDist`-style bond-length and angular distortion parameters.

```bash
cosmochlore odis <NAME> [OPTIONS]
```

> [!important]
> `odis` needs a centred structure with exactly one central atom and six ligands (7 atoms in the `.xyz` file).

## Options

| Flag             | Value        | Description                                                                                                                                       |
| ---------------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-c`, `--center` | `<POSITION>` | 1-based position of the atom in the `.xyz` table that is the centre of the structure. Defaults to the first atom (position 1) when omitted.       |
| `-f`, `--full`   |              | Full analysis of the octahedron, including CShM (against `OC-6`/`TPR-6`) and CSoM (against the common octahedral distortion point groups) values. |
| `-t`, `--table`  |              | Write the output table to a `.csv` file.                                                                                                          |

## Example

Using the `FeHS.xyz` structure from the [[cshm#Example|`cshm` example]]:

```bash
cosmochlore odis FeHS.xyz -t --full
```

Will output:

```text
Input file: FeHS.xyz
==================================
 Octahedral distortion parameters
----------------------------------
 Mean d(M-X)          2.1623  Ang
 Zeta                 0.3622  Ang
 Delta              0.001007
 Sigma                 82.29  deg
 Theta                306.81  deg
 Volume              12.9644  Ang^3
----------------------------------
 Tau                   54.42  deg
 Mu                     0.17  Ang
==================================
Writing output table to FeHS_odis_table.csv...

Input file: FeHS.xyz
============================================
 Symbol  Shape            Symmetry   CShM
--------------------------------------------
 OC-6    Octahedron       Oh         2.089
 TPR-6   Trigonal prism   D3h        11.079
--------------------------------------------
Writing output table to FeHS_cshm_table.csv...

Input file: FeHS.xyz
========================
 Point group  Deviation
------------------------
 Oh           5.380
 D4h          5.611
 D3h          17.716
 D3d          5.691
 D2h          5.948
 C4v          4.947
 C3v          5.198
 C2v          2.420
------------------------
Writing output table to FeHS_csom_table.csv...
Program finished in 922.3647ms
```

Passing the `-t`/`--table` flag writes the distortion parameters to a `<NAME>_odis_table.csv`. Passing the `-f`/`--full` flag additionally computes the CShM against the ideal octahedron and trigonal prism (`OC-6`, `TPR-6`) and the CSoM against the eight point groups most commonly seen in octahedral distortions (`Oh`, `D4h`, `D3h`, `D3d`, `D2h`, `C4v`, `C3v`, `C2v`).
