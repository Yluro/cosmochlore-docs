---
title: License and acknowledgements
---

## Acknowledgements

This project reimplements several shape and symmetry algorithms found in other programs such as:

- [`cosymlib`](https://github.com/GrupEstructuraElectronicaSimetria/cosymlib), for the `cshm` branch-and-bound search and model shapes.
- [Continuous Symmetry Operation Measure](https://github.com/VRMNielsen/Continous-Symmetry-Operation-Measure-Program), for the `csom` seeding and point group tables.
- [OctaDist](https://github.com/OctaDist/OctaDist), for the `odis` parameters.

Cosmochlore is an independent, from-scratch implementation of all these measurements and is not affiliated with any of the original authors.

## License

**The code, binaries and sample tests are provided as is, with no warranty of any kind.** This program is licensed under the [GNU General Public Licence v3.0](https://www.gnu.org/licenses/gpl-3.0.html) (GPL-3.0). See the `LICENSE.md` file in the repository for the full terms.

### Third-party code

- The branch and bound, the partial assignment method and the model shapes of the `cshm` module are based on `cosymlib` (`shp.f90`), Copyright (c) 2021 Pere Alemany, Efrem Bernuz, Abel Carreras and Miquel Llunell, licensed under the MIT Licence.
- The Fibonacci seeding and point group tables of the `csom` module are based on `csom_main.py`, Copyright (c) 2024 Villads R. M. Nielsen, Boris Le Guennic and Thomas Just Sørensen, licensed under the GNU General Public Licence v3.0 (GPL-3.0).
- Parts of the `odis` module are based on the [`OctaDist`](https://octadist.github.io/)<sup>[[references|4]]</sup> algorithm, Copyright (c) 2019-2026 Rangsiman Ketkaew et al., licensed under the GNU General Public Licence v3.0 (GPL-3.0).

### Dependencies

| Crate                                                                                                 | Used for                                                 | Licence           |
| ----------------------------------------------------------------------------------------------------- | -------------------------------------------------------- | ----------------- |
| [`clap`](https://crates.io/crates/clap)                                                               | Argument parsing.                                        | Apache 2.0 or MIT |
| [`nalgebra`](https://docs.rs/nalgebra/latest/nalgebra/)                                               | Fast linear algebra computations.                        | Apache 2.0        |
| [`itertools`](https://crates.io/crates/itertools)                                                     | Combinatorial iteration.                                 | Apache 2.0 or MIT |
| [`argmin`](https://crates.io/crates/argmin) and [`argmin-math`](https://crates.io/crates/argmin-math) | Nelder-Mead optimization of the symmetry axis in `csom`. | Apache 2.0 or MIT |
