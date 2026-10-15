---
title: Timeo
description: An Olex2 plugin that brings Cosmochlore, SHAPE 2.1 and octahedral distortion analysis into a single graphical interface.
---

[Timeo](https://github.com/Yluro/timeo) is an [Olex2](https://www.olexsys.org/olex2/) plugin that integrates several symmetry and shape analysis tools into a single graphical interface. Cosmochlore was developed in parallel to Timeo and is designed to run as its background engine.

> [!info] Formerly Timaeus
> Timeo was called Timaeus before version 1.2.0. If you have Timaeus installed, see [[timeo/installation#Upgrading from Timaeus|upgrading from Timaeus]].

## Features

- **Input/output file managing.** Every analysis reads atomic coordinates directly from the Olex2 refinement model and produces the necesary I/O files, so there is nothing to write by hand.
- **GUI panel.** Almost[^almost] every function is available from the Timeo panel under the Tools tab.
- **Cosmochlore integration.** All the options of [[content/Modules/index|Cosmochlore's commands]] are reachable through the Cosmochlore tab. See [[timeo/cosmochlore|Cosmochlore in Timeo]].
- **SHAPE 2.1 wrapper.** Timeo can write the input files for SHAPE 2.1, run it and parse the results. See [[other-programs|autoSHAPE]].
- **Octahedral distortion parameters.** A topology-based reimplementation of the OctaDist algorithm, independent of Cosmochlore's. See [[other-programs#Octahedral Distortion|Octahedral Distoriton]].
- **η<sup>n</sup> π-bonded ligands.** Timeo can detect π-bonding and can average the donor atoms to the ligand centroid.
- **Disorder handling.** Disordered parts are measured automatically, and you can choose which parts to combine. See [[timeo/usage#Disorder|disorder]].

## Where to start

1. Check the [[timeo/installation#Requirements|requirements]] and [[timeo/installation|install the plugin]].
2. Read the [[timeo/usage|usage guide]] to learn how atoms are selected and how the results are reported.
3. Look up individual options in the [[timeo/settings|settings reference]].

## Pages in this section

| Page                                                  | Contents                                                                      |
| ----------------------------------------------------- | ----------------------------------------------------------------------------- |
| [[timeo/installation\|Installation]]                  | Requirements, step-by-step setup, troubleshooting and upgrading from Timaeus. |
| [[timeo/usage\|Usage]]                                | Selecting atoms, π-bonded ligands, disorder handling and output locations.    |
| [[timeo/cosmochlore\|Cosmochlore in Timeo]]           | `autoCSHM`, `autoCSOM`, `autoODIS` and user-defined shapes.                   |
| [[other-programs\|autoSHAPE]]                        | Running and parsing SHAPE 2.1 from Olex2.                                     |
| [[timeo/octahedral-distortion\|Octahedral distortion]] | Timeo's own implementation of the OctaDist parameters.                        |
| [[timeo/settings\|Settings]]                          | Every phil parameter, with defaults.                                          |

## License

Timeo is free software, released under the [GNU General Public License v3.0](https://github.com/Yluro/timeo/blob/main/LICENSE.MD) or (at your option) any later version.

[^almost]: Functions not available throught the GUI are probably not meant to be used by the common user base.