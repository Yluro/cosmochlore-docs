---
title: Installation
tags:
  - getting-started
---

## Precompiled binaries

Precompiled binaries for the most common operating systems are available on the [releases page](https://github.com/Yluro/cosmochlore/releases).

| Platform              | Archive                                       |
| --------------------- | --------------------------------------------- |
| Windows (x86_64)      | `cosmochlore-x86_64-pc-windows-msvc.zip`      |
| macOS (Apple Silicon) | `cosmochlore-aarch64-apple-darwin.tar.gz`     |
| macOS (Intel)         | `cosmochlore-x86_64-apple-darwin.tar.gz`      |
| Linux (x86_64)        | `cosmochlore-x86_64-unknown-linux-gnu.tar.gz` |

Each archive contains a single executable. Put it in a folder on your system `PATH` so you can call `cosmochlore` from anywhere.

### Windows

1. Download `cosmochlore-x86_64-pc-windows-msvc.zip` from the [releases page](https://github.com/Yluro/cosmochlore/releases/latest).
2. Extract `cosmochlore.exe` to a permanent folder, for example `%LOCALAPPDATA%\Programs\cosmochlore`.
3. Add that folder to your user `PATH`:
   1. Press <kbd>Win</kbd>, search for **Edit environment variables for your account** and open it.
   2. Select **Path** under *User variables*, click **Edit** > **New** and paste the folder path.
   3. Click **OK** in every dialog.
4. Open a **new** terminal so it picks up the updated `PATH`.

Or do it all from PowerShell:

```powershell
$dir = "$env:LOCALAPPDATA\Programs\cosmochlore"
New-Item -ItemType Directory -Force $dir | Out-Null
$tmp = Join-Path $env:TEMP "cosmochlore-install"
Remove-Item $tmp -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory $tmp | Out-Null
Invoke-WebRequest https://github.com/Yluro/cosmochlore/releases/latest/download/cosmochlore-x86_64-pc-windows-msvc.zip -OutFile "$tmp\cosmochlore.zip"
Expand-Archive "$tmp\cosmochlore.zip" -DestinationPath $tmp
Copy-Item "$tmp\cosmochlore.exe" $dir -Force   # replaces an older install, if any
Remove-Item $tmp -Recurse -Force

$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
$entries = $userPath -split ";" | Where-Object { $_ }
if ($entries -notcontains $dir) {
    [Environment]::SetEnvironmentVariable("Path", (($entries + $dir) -join ";"), "User")
}
```

>[!comment] Installation Folder
> The previous script installs cosmochlore.exe into %APPDATA%\Local\Programs\cosmochlore

### macOS

Pick the archive that matches your Mac: `aarch64` for Apple Silicon (M1 and newer), `x86_64` for Intel. Run `uname -m` if you are not sure (`arm64` means Apple Silicon).

```bash
curl -LO https://github.com/Yluro/cosmochlore/releases/latest/download/cosmochlore-aarch64-apple-darwin.tar.gz
tar -xzf cosmochlore-aarch64-apple-darwin.tar.gz
mkdir -p ~/.local/bin
mv cosmochlore ~/.local/bin/
```

Add `~/.local/bin` to your `PATH` if it is not there yet. The default shell on macOS is zsh:

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

> [!warning] Gatekeeper
> If you downloaded the archive with a browser, macOS may block the binary because it is not signed ("cannot be opened because the developer cannot be verified"). Remove the quarantine flag:
>
> ```bash
> xattr -d com.apple.quarantine ~/.local/bin/cosmochlore
> ```

### Linux

```bash
curl -LO https://github.com/Yluro/cosmochlore/releases/latest/download/cosmochlore-x86_64-unknown-linux-gnu.tar.gz
tar -xzf cosmochlore-x86_64-unknown-linux-gnu.tar.gz
mkdir -p ~/.local/bin
mv cosmochlore ~/.local/bin/
chmod +x ~/.local/bin/cosmochlore
```

Many distributions already include `~/.local/bin` in `PATH`. If `cosmochlore --version` is not found, add it to your shell configuration (`~/.bashrc` for bash, `~/.zshrc` for zsh) and reload:

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

To install for all users instead, move the binary to `/usr/local/bin` with `sudo mv cosmochlore /usr/local/bin/`.

> [!note]
> The Linux binary is built against glibc. If you are on a musl-based distribution (such as Alpine) or another architecture, [[#Build from source|build from source]].

## Build from source

If there is no released binary for your operating system or architecture, or prefer to compile the program, you can build Cosmochlore from source.
You will need [Git](https://git-scm.com/) and the Rust compiler and toolchain (including `cargo`, Rust's package manager and build tool). The easiest way to get Rust and `cargo` is through [`rustup`](https://rustup.rs/).

```bash
git clone https://github.com/Yluro/cosmochlore
cd cosmochlore
git checkout "$(git describe --tags --abbrev=0)"
cargo build --release
```

The compiled binary is written to `target/release/cosmochlore`.

> [!tip] Experimental versions
> The `master` branch contains experimental features. To use them, skip the `git checkout` line, which switches to the latest release.

## Troubleshooting

```bash
cosmochlore --version
cosmochlore help
```
