---
title: Cosmochlore in Timeo
tags:
  - timeo
---

Cosmochlore is developed to function either as a standalone CLI tool or as a background process to Timeo. Timeo wraps three of its subcommands. Each one writes its output next to the structure and prints the results table to the Olex2 console.

| Function               | Cosmochlore command     | Description                                                                                           |
| ---------------------- | ----------------------- | ----------------------------------------------------------------------------------------------------- |
| `spy.Timeo.autoCSHM()` | [[cshm\|cshm]] | Continuous Shape Measures against the built-in and user-defined reference polyhedra.                  |
| `spy.Timeo.autoCSOM()` | [[csom\|csom]] | Continuous Symmetry Operation Measures against a list of point groups.                                |
| `spy.Timeo.autoODIS()` | [[odis\|odis]] | Octahedral distortion parameters. Select the central atom of a six-coordinate complex.                |

Every option has a phil parameter, editable in `Options` > `Settings` or from the panel itself. See [[timeo/settings|settings]]. Most options of Cosmochlore are accessible through the GUI.

> [!note]
> The `gidx` command is not wrapped by Timeo.

## Usage

1. Open a structure in Olex2.
2. Select the atoms to include. One atom gives a centered shape, several atoms give a non-centered shape. See [[timeo/usage#Selecting atoms|selecting atoms]].
3. Run a function from the console or from the Tools > Timeo > Cosmochlore panel.
4. Results are printed to the console and saved in `<FilePath>/cosmochlore/`.

## autoCSHM

Runs [[cshm|cshm]]. Two options control the extra files:

- `timeo.cosmochlore.cshm.table`: write `_cshm_table.csv` next to the `.xyz`.
- `timeo.cosmochlore.cshm.ideal`: write `_ideal.xyz` with the reconstructed reference shapes.

### User-defined shapes

Reference shapes beyond the built-in ones can be added as `.yaml` files in the `user_shapes/` folder of the plugin. The CShM panel has an `Open user defined shapes folder` button. The file format is described in [[reference/user-defined-shapes|user-defined shapes]]. A mismatched vertex count is reported as an error by Cosmochlore itself.

## autoCSOM

Runs [[csom|csom]]. Point groups are given as a space-separated list, for example `Oh D4h D3d`.

| Option                         | Description                                                                              |
| ------------------------------ | ---------------------------------------------------------------------------------------- |
| `point_groups`                 | Default list of point groups to test.                                                    |
| `mode`                         | Centering mode: `auto`, `first`, `centroid` or `manual`.                                 |
| `vector`                       | Manual centering vector `x y z`, used only when `mode = manual`.                         |
| `full`, `table`, `operated`    | Write the per-operation details, the summary table and the operated structures.          |
| `ignore_labels`                | Ignore atom labels when matching atoms between structures.                               |
| `seeds`                        | Number of candidate symmetry-axis directions that seed the axis search (default 20).     |
| `iterations`                   | Maximum Nelder-Mead iterations per seed (default 200).                                   |
| `tolerance_exponent`           | Convergence tolerance as a power of ten, `N` meaning 1e-N (default 6).                   |

## autoODIS

Runs [[odis|odis]] on the selected central atom of a six-coordinate complex. With `timeo.cosmochlore.odis.full` it also computes CShM (OC-6/TPR-6) and CSoM against common octahedral distortions, and `timeo.cosmochlore.odis.table` writes `_odis_table.csv`.

This is independent of Timeo's own [[timeo/octahedral-distortion|octahedral distortion]] implementation.
