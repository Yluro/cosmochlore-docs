---
title: Usage
tags:
  - getting-started
---

Cosmochlore is a command line tool with one subcommand per analysis:

```bash
cosmochlore <COMMAND> <NAME> [OPTIONS]
```

| Command                 | Description                                            |
| ----------------------- | ------------------------------------------------------ |
| [[cshm\|cshm]] | Continuous shape measures calculation.                 |
| [[csom\|csom]] | Continuous symmetry operation measures calculation.    |
| [[odis\|odis]] | Octahedral distortion analysis.                        |
| [[gidx\|gidx]] | Geometry indices calculation.                          |
| `help`                  | Print the help or the help of the given subcommand(s). |

`<NAME>` is the path to the input `.xyz` file with the structure to analyze.

## Global options

Global options go before the command:

| Flag              | Description                                                                                                                                                    |
| ----------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-s`, `--silent`  | Print nothing to the terminal (banner, tables and progress messages). Files requested with flags are still written, and errors are still printed to stderr. |
| `-h`, `--help`    | Print the help.                                                                                                                                                |
| `-V`, `--version` | Print the version.                                                                                                                                             |

```bash
cosmochlore -s cshm FeHS.xyz -t
```

> [!warning]
> After the command, `-s` means something else: `--sh` for [[cshm|cshm]] and `--seeds` for [[csom|csom]].

## Input files

Structures are read from standard `.xyz` files: the number of atoms, a comment line, then one `label x y z` line per atom.

```text title="FeHS.xyz"
7
High-spin iron(ii) complex
Fe6 4.93013 10.3906 12.9236
N004 6.21021 10.6927 14.7824
N006 4.99632 8.50231 13.9489
N008 6.81046 10.0777 11.7691
N00B 5.46476 12.2907 12.1187
N00C 3.30099 11.3236 13.8608
N00D 3.74774 9.47633 11.4653
```

By default, the first atom is taken as the centre of the structure. Use `-c/--center` to pick another atom, or `-n/--nc` (where supported) when the file has no central atom.

## Output files

Each command prints its results to the terminal. Extra files are only written when you ask for them with a flag, and they are named after the input file (`FeHS.xyz` gives `FeHS_...`).

| Command                 | Flag               | File written                                                                                                   |
| ----------------------- | ------------------ | -------------------------------------------------------------------------------------------------------------- |
| [[cshm\|cshm]] | `-t`, `--table`    | `name_cshm_table.csv`: the table printed to the terminal.                                                      |
|                         | `-i`, `--ideal`    | `name_ideal.xyz`: the reconstructed ideal structures for all the selected reference shapes.                    |
| [[csom\|csom]] | `-t`, `--table`    | `name_csom_table.csv`: point group, deviation and refined rotation matrix.                                     |
|                         | `-f`, `--full`     | `name_<PG>_details.csv`, one per point group: the matrix and deviation of every symmetry operation.            |
|                         | `-o`, `--operated` | `name_<PG>_operated.xyz` and `name_<PG>_merged.mol2`, one pair per point group.                                |
| [[odis\|odis]] | `-t`, `--table`    | `name_odis_table.csv`: the distortion parameters. With `--full`, the `cshm` and `csom` tables are written too. |
| [[gidx\|gidx]] | `-t`, `--table`    | `name_gidx_table.csv`: the angles and indices.                                                                 |

For options of the specific commands, see [[modules\index|modules]].


## Errors

Cosmochlore will always tell you if something went wrong at run-time. The program never crashes silently and never prints a number without letting you know that something failed.
