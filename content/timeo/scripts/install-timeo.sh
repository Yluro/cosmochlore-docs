#!/usr/bin/env bash
set -euo pipefail

base="${1:?Usage: install-timeo.sh <Olex2 BaseDir>}"
plugin_lib="$base/util/pyUtil/PluginLib"
dest="$plugin_lib/plugin-Timeo"

[ -d "$plugin_lib" ] || { echo "'$base' does not look like an Olex2 base directory (util/pyUtil/PluginLib not found). Use the path printed by 'shell BaseDir()'." >&2; exit 1; }
[ -d "$dest/.git" ] && { echo "$dest is a git clone: update it with 'git pull' instead." >&2; exit 1; }

# Download the latest release
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
api="https://api.github.com/repos/Yluro/timeo/releases/latest"
tag="$(curl -fsSL "$api" | sed -n 's/.*"tag_name": *"\([^"]*\)".*/\1/p')"
echo "Installing Timeo $tag..."
curl -fsSL "https://api.github.com/repos/Yluro/timeo/zipball/$tag" -o "$tmp/timeo.zip"
unzip -q "$tmp/timeo.zip" -d "$tmp"
src="$(find "$tmp" -mindepth 1 -maxdepth 1 -type d | head -n 1)"

# Copy over any previous installation
mkdir -p "$dest"
cp -R "$src"/. "$dest"/

# Register the plugin in plugins.xld
xld="$base/plugins.xld"
if [ ! -f "$xld" ]; then
    printf '<Plugin\n <Timeo>\n>\n' > "$xld"
    echo "Created $xld"
elif grep -q '<Timeo>' "$xld"; then
    echo "plugins.xld already lists Timeo."
else
    close="$(grep -n '^[[:space:]]*>[[:space:]]*$' "$xld" | tail -n 1 | cut -d: -f1)"
    [ -n "$close" ] || { echo "Could not find the closing '>' in $xld. Add <Timeo> by hand." >&2; exit 1; }
    awk -v n="$close" 'NR == n { print " <Timeo>" } { print }' "$xld" > "$tmp/plugins.xld"
    cp "$tmp/plugins.xld" "$xld"
    echo "Added <Timeo> to $xld"
fi

echo "Done. Restart Olex2."
