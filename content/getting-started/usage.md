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
| [[commands/cshm\|cshm]] | Continuous shape measures calculation.                 |
| [[commands/csom\|csom]] | Continuous symmetry operation measures calculation.    |
| [[commands/odis\|odis]] | Octahedral distortion analysis.                        |
| [[commands/gidx\|gidx]] | Geometry indices calculation.                          |
| `help`                  | Print the help or the help of the given subcommand(s). |

`<NAME>` is the path to the input `.xyz` file with the structure to analyze.

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

By default the first atom is taken as the centre of the structure. Use `-c/--center` to pick another atom, or `-n/--nc` (where supported) when the file has no central atom.

> [!todo] To do
> Document the output files (`-t` tables, `-i` idealized structures, `.mol2` overlays) and how errors are reported.
