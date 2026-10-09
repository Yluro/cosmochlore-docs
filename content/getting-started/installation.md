---
title: Installation
tags:
  - getting-started
---

## Precompiled binaries

Precompiled binaries for the most common operating systems are available on the [releases page](https://github.com/Yluro/cosmochlore/releases).

> [!tip]
> Place the `cosmochlore` executable in a folder on your system `PATH` so you can call it from anywhere.

> [!todo] To do
> Add per-platform instructions (Windows, macOS, Linux) for downloading the binary and adding it to `PATH`.

## Build from source

You need a stable Rust toolchain. The easiest way to get `cargo` is through [`rustup`](https://rustup.rs/).

```bash
git clone https://github.com/Yluro/cosmochlore
cd cosmochlore
cargo build --release
```

The compiled binary is written to `target/release/cosmochlore`.

> [!warning]
> The `main` branch can contain experimental features. Use a tagged release if you need reproducible results.

## Check the installation

```bash
cosmochlore --version
cosmochlore help
```
