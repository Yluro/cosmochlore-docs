---
title: Installation
tags:
  - timeo
---

## Requirements

- Olex2 1.5.
- [[getting-started/installation|Cosmochlore]] 1.2.0 or newer. Cosmochlore is developed specifically to work with Timeo.
- _(Optional)_ SHAPE 2.1, downloadable from the [Electronic Structure Group's downloads page](https://www.ee.ub.edu/downloads/). It is only needed for [[other-programs|autoSHAPE]].

> [!warning] SHAPE 2.1 on macOS and Linux
> SHAPE 2.1 is known to give trouble on macOS newer than 2022 and on some Linux systems. The ESG has not published a precompiled SHAPE version since 2013, so this cannot be fixed from Timeo. Cosmochlore does not depend on SHAPE.

## Install the plugin

1. [Download the files](https://github.com/Yluro/timeo/releases) from the latest GitHub release.
2. Open the base directory of your Olex2 installation by typing `shell BaseDir()` in the Olex2 console.
3. Create a file called `plugins.xld` in that directory with the following contents:

   ```xml title="plugins.xld"
   <Plugin
    <Timeo>
   >
   ```

>[!note]
>If there is already a file named `plugins.xld`, edit it and write <Timeo> into the line.

4. Go to `<BaseDir>\util\pyUtil\PluginLib\` and create a folder called `plugin-Timeo`.
5. Extract the downloaded zip and drop the contents of the `timeo-X.X.X` folder into `plugin-Timeo`, so that `Timeo.py` sits directly at `<BaseDir>\util\pyUtil\PluginLib\plugin-Timeo\Timeo.py`.
6. Restart Olex2. A Timeo panel should appear under the Tools tab.

> [!tip] Keeping up to date
> Development changes are pushed constantly to the `master` branch. If you `git clone` the repository into `plugin-Timeo`, the plugin updates automatically. Changes are usually only pushed when the plugin is in a usable state, but I cannot guarantee that nothing will break.

### Install with a script

Instead of the steps above, the scripts below download the latest release, copy it to `plugin-Timeo`, and add `<Timeo>` to `plugins.xld` (creating the file if needed, and leaving other plugins in place). Run them with the path printed by `shell BaseDir()` in the Olex2 console (on macOS this is a folder inside the Olex2 application bundle) and restart Olex2 afterwards. Running them again updates an existing installation, overwriting its files but leaving your own files (such as the ones in `user_shapes`) alone. They do not touch a `git clone` installation.

#### Windows (PowerShell)

<a href="scripts/install-timeo.ps1" download>Download `install-timeo.ps1`</a> and run `.\install-timeo.ps1 -BaseDir "C:\Program Files\Olex2-1.5"`. If PowerShell refuses to run it, use `powershell -ExecutionPolicy Bypass -File .\install-timeo.ps1 -BaseDir "..."`.

> [!example]- View install-timeo.ps1
>
> ```powershell
> param(
>     [Parameter(Mandatory = $true)]
>     [string]$BaseDir
> )
>
> $ErrorActionPreference = 'Stop'
> [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
> $ProgressPreference = 'SilentlyContinue'
>
> $pluginLib = Join-Path $BaseDir 'util\pyUtil\PluginLib'
> if (-not (Test-Path $pluginLib)) {
>     throw "'$BaseDir' does not look like an Olex2 base directory (util\pyUtil\PluginLib not found). Use the path printed by 'shell BaseDir()'."
> }
>
> $dest = Join-Path $pluginLib 'plugin-Timeo'
> if (Test-Path (Join-Path $dest '.git')) {
>     throw "$dest is a git clone: update it with 'git pull' instead."
> }
>
> # Download the latest release
> $release = Invoke-RestMethod 'https://api.github.com/repos/Yluro/timeo/releases/latest'
> Write-Host "Installing Timeo $($release.tag_name)..."
> $tmp = Join-Path ([IO.Path]::GetTempPath()) ("timeo-" + [guid]::NewGuid())
> New-Item -ItemType Directory -Path $tmp | Out-Null
> try {
>     $zip = Join-Path $tmp 'timeo.zip'
>     Invoke-WebRequest $release.zipball_url -OutFile $zip -UseBasicParsing
>     Expand-Archive $zip -DestinationPath $tmp
>     $src = Get-ChildItem $tmp -Directory | Select-Object -First 1
>
>     # Copy over any previous installation
>     New-Item -ItemType Directory -Path $dest -Force | Out-Null
>     Copy-Item (Join-Path $src.FullName '*') $dest -Recurse -Force
> }
> finally {
>     Remove-Item $tmp -Recurse -Force -ErrorAction SilentlyContinue
> }
>
> # Register the plugin in plugins.xld
> $xld = Join-Path $BaseDir 'plugins.xld'
> if (-not (Test-Path $xld)) {
>     Set-Content $xld -Value "<Plugin", " <Timeo>", ">"
>     Write-Host "Created $xld"
> }
> elseif (Select-String -Path $xld -SimpleMatch '<Timeo>' -Quiet) {
>     Write-Host "plugins.xld already lists Timeo."
> }
> else {
>     $lines = [System.Collections.Generic.List[string]](Get-Content $xld)
>     $close = $lines.FindLastIndex({ param($l) $l.Trim() -eq '>' })
>     if ($close -lt 0) { throw "Could not find the closing '>' in $xld. Add <Timeo> by hand." }
>     $lines.Insert($close, ' <Timeo>')
>     Set-Content $xld -Value $lines
>     Write-Host "Added <Timeo> to $xld"
> }
>
> Write-Host "Done. Restart Olex2."
> ```

#### Linux and macOS (bash)

Needs `curl` and `unzip`, both present on macOS and most Linux distributions. <a href="scripts/install-timeo.sh" download>Download `install-timeo.sh`</a> and run `bash install-timeo.sh /path/to/olex2`.

> [!example]- View install-timeo.sh
>
> ```bash
> #!/usr/bin/env bash
> set -euo pipefail
>
> base="${1:?Usage: install-timeo.sh <Olex2 BaseDir>}"
> plugin_lib="$base/util/pyUtil/PluginLib"
> dest="$plugin_lib/plugin-Timeo"
>
> [ -d "$plugin_lib" ] || { echo "'$base' does not look like an Olex2 base directory (util/pyUtil/PluginLib not found). Use the path printed by 'shell BaseDir()'." >&2; exit 1; }
> [ -d "$dest/.git" ] && { echo "$dest is a git clone: update it with 'git pull' instead." >&2; exit 1; }
>
> # Download the latest release
> tmp="$(mktemp -d)"
> trap 'rm -rf "$tmp"' EXIT
> api="https://api.github.com/repos/Yluro/timeo/releases/latest"
> tag="$(curl -fsSL "$api" | sed -n 's/.*"tag_name": *"\([^"]*\)".*/\1/p')"
> echo "Installing Timeo $tag..."
> curl -fsSL "https://api.github.com/repos/Yluro/timeo/zipball/$tag" -o "$tmp/timeo.zip"
> unzip -q "$tmp/timeo.zip" -d "$tmp"
> src="$(find "$tmp" -mindepth 1 -maxdepth 1 -type d | head -n 1)"
>
> # Copy over any previous installation
> mkdir -p "$dest"
> cp -R "$src"/. "$dest"/
>
> # Register the plugin in plugins.xld
> xld="$base/plugins.xld"
> if [ ! -f "$xld" ]; then
>     printf '<Plugin\n <Timeo>\n>\n' > "$xld"
>     echo "Created $xld"
> elif grep -q '<Timeo>' "$xld"; then
>     echo "plugins.xld already lists Timeo."
> else
>     close="$(grep -n '^[[:space:]]*>[[:space:]]*$' "$xld" | tail -n 1 | cut -d: -f1)"
>     [ -n "$close" ] || { echo "Could not find the closing '>' in $xld. Add <Timeo> by hand." >&2; exit 1; }
>     awk -v n="$close" 'NR == n { print " <Timeo>" } { print }' "$xld" > "$tmp/plugins.xld"
>     cp "$tmp/plugins.xld" "$xld"
>     echo "Added <Timeo> to $xld"
> fi
>
> echo "Done. Restart Olex2."
> ```

## Make external executables available

Timeo calls the `cosmochlore` and `shape` executable as a background process. Either:

- put them in a folder on your system `PATH` (see [[getting-started/installation|Cosmochlore installation]]), or
- put them in the same folder as `timeo.py`, or
- put them in the same folder as `olex.exe`, or
- set the explicit path in `Options` > `Settings` (`timeo.cosmochlore.exe_path`). See [[timeo/settings|settings]].

The same applies to SHAPE through `timeo.shape.exe_path`.

## Troubleshooting

> [!failure]- The Timeo panel does not appear (`Failed to load plugin`)
> If the panel does not appear, the Olex2 console prints `Failed to load plugin 'X'`.
>
> - `No module named 'X'` means the name in `plugins.xld` does not match `<BaseDir>\util\pyUtil\PluginLib\plugin-X\X.py` letter for letter (including case), or `Timeo.py` is nested one folder too deep.
> - `ModuleNotFoundError: No module named 'timeo'` occurs when the plugin name is written in lowercase. It must be `Timeo`.
> - Make sure `plugins.xld` is not saved as `plugins.xld.txt`.
> - If `plugins.xld` already exists, do not overwrite it. Add the `<Timeo>` line between `<Plugin` and `>`.

> [!failure]- Timeo cannot find the `cosmochlore` or `shape` executable
> Before each run Timeo looks for the executable and prints one of these messages in the Olex2 console if it cannot use it:
>
> | Message                                                                       | Fix                                                                                                                                                                     |
> | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
> | `cosmochlore executable not found on PATH.`                                   | Add the folder that holds `cosmochlore` to your `PATH` and restart Olex2, or set `timeo.cosmochlore.exe_path` (see [[#Make external executables available\|above]]). |
> | `Unable to find shape.exe in the system path.`                                | The same for SHAPE, or set `timeo.shape.exe_path`.                                                                                                                      |
> | `timeo.cosmochlore.exe_path is set to "...", but that file does not exist.`   | The saved path is wrong. Point it at the executable itself, not the folder that holds it, or clear it to fall back to `PATH`.                                         |
> | `Could not determine the version of the cosmochlore executable at "..."`      | The file exists but does not run. Check that it is the build for your system and, on macOS and Linux, that it is executable (`chmod +x cosmochlore`).                   |
> | `cosmochlore at "..." is version X, but 1.2.0 or newer is required.`          | Install a newer Cosmochlore. An older copy earlier in `PATH` can shadow a newer one.                                                                                    |
>
> Olex2 reads `PATH` once, when it starts, so restart it after changing `PATH`. To check what Timeo finds without running anything, type `spy.Timeo.check_cosmochlore(False)` or `spy.Timeo.check_shape(False)` in the Olex2 console. They print the path (and, for Cosmochlore, the version) of the executable Timeo will use.

> [!failure]- The install script does not run, or fails with "Access denied"
> **`running scripts is disabled on this system`**: PowerShell's execution policy blocks scripts by default. Run it for this one script only, without changing the policy:
>
> ```powershell
> powershell -ExecutionPolicy Bypass -File .\install-timeo.ps1 -BaseDir "C:\Program Files\Olex2-1.5"
> ```
>
> If PowerShell warns that the file came from the internet, unblock it first with `Unblock-File .\install-timeo.ps1`.
>
> **`Access to the path '...' is denied`**: Olex2 is usually installed in `C:\Program Files`, which only administrators can write to. Open PowerShell with **Run as administrator** (right-click it in the Start menu) and run the script again. The same applies to the manual steps: creating `plugins.xld` and `plugin-Timeo` inside `Program Files` needs administrator rights.
>
> **macOS and Linux**: if the script stops with `Permission denied` while copying, the Olex2 folder belongs to another user (or to root). Run it with `sudo bash install-timeo.sh /path/to/olex2`.

## Upgrading from Timaeus

1. Delete the `<BaseDir>\util\pyUtil\PluginLib\plugin-Timaeus` folder and install Timeo as described above.
2. In `plugins.xld`, replace the `<Timaeus>` line with `<Timeo>`.
3. Console commands are now `spy.Timeo.*` instead of `spy.Timaeus.*`.
