---
title: Other Programs
tags:
  - timeo
  - shape
  - octadist
---
## SHAPE 2.1

[SHAPE 2.1](https://www.ee.ub.edu/continuous-shape-and-symmetry-measures/) is software published by the Electronic Structure Group (ESG) to calculate Continuous Shape Measures. `autoSHAPE` is the collection of Python scripts included in Timeo to run and parse SHAPE input and output files. It does the following:

- Generates the necessary `.dat` input files for SHAPE automatically.
- Runs SHAPE and parses the resulting `.tab` output.
- Outputs a summary table from the `.out` and `.tab` files.
### Setup

Make sure SHAPE 2.1 is installed and either on your system `PATH`, or set `timeo.shape.exe_path` in `Options` > `Settings`. See [[timeo/installation#Requirements|requirements]] for known platform issues.

### Usage

1. `autoSHAPE` uses the same selection criteria as Cosmochlore. Select a single atom for a centered measurement or several for a non-centered one. See [[timeo/usage#Selecting atoms|selecting atoms]].
2. Run `spy.Timeo.autoSHAPE()` from the Olex2 command line, or from the Tools > Timeo > SHAPE 2.1 panel.

### Output

autoSHAPE does not overwrite previous runs. Each run is stored in its own folder:

```text
<FilePath>\autoSHAPE\<FileName>_<part>_<atoms>\<run>
```

## Octahedral Distortion

Timeo includes its own Python reimplementation of the [OctaDist](https://octadist.github.io/)[@ketkaew_octadist_2021] algorithm. It is separate from the one in Cosmochlore (`spy.Timeo.autoODIS()`, see [[odis|odis]] and [[theory/octahedral-distortion|the theory page]]).

Unlike the original implementation, this version identifies opposite faces and vertices of an octahedron using topological criteria. It constructs a convex hull that is topologically equivalent to an octahedron and uses face-vertex relationships to identify the oposite pairs of faces.

> [!warning] Limitations
> The algorithm may fail when more than three vertices are coplanar, because the convex hull then degenerates into a different polyhedral shape. Calculated values are generally consistent with OctaDist, but discrepancies may occur for highly distorted octahedra or for structures approaching an ideal trigonal prism.
>
> Several features of the original OctaDist program were omitted to simplify the integration with Olex2 and to remove redundant functionality.

### Usage

1. Open a structure in Olex2.
2. Select the central atom of a six-coordinate complex.
3. Run `spy.Timeo.autoOCTADIST()` from the Olex2 console or from the Tools > Timeo panel.
4. Results are printed in the console. A graph showing the extracted octahedron is saved in `<FilePath>/OH_distortion`.


