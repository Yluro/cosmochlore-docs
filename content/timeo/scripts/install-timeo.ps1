param(
    [Parameter(Mandatory = $true)]
    [string]$BaseDir
)

$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$ProgressPreference = 'SilentlyContinue'

$pluginLib = Join-Path $BaseDir 'util\pyUtil\PluginLib'
if (-not (Test-Path $pluginLib)) {
    throw "'$BaseDir' does not look like an Olex2 base directory (util\pyUtil\PluginLib not found). Use the path printed by 'shell BaseDir()'."
}

$dest = Join-Path $pluginLib 'plugin-Timeo'
if (Test-Path (Join-Path $dest '.git')) {
    throw "$dest is a git clone: update it with 'git pull' instead."
}

# Download the latest release
$release = Invoke-RestMethod 'https://api.github.com/repos/Yluro/timeo/releases/latest'
Write-Host "Installing Timeo $($release.tag_name)..."
$tmp = Join-Path ([IO.Path]::GetTempPath()) ("timeo-" + [guid]::NewGuid())
New-Item -ItemType Directory -Path $tmp | Out-Null
try {
    $zip = Join-Path $tmp 'timeo.zip'
    Invoke-WebRequest $release.zipball_url -OutFile $zip -UseBasicParsing
    Expand-Archive $zip -DestinationPath $tmp
    $src = Get-ChildItem $tmp -Directory | Select-Object -First 1

    # Copy over any previous installation
    New-Item -ItemType Directory -Path $dest -Force | Out-Null
    Copy-Item (Join-Path $src.FullName '*') $dest -Recurse -Force
}
finally {
    Remove-Item $tmp -Recurse -Force -ErrorAction SilentlyContinue
}

# Register the plugin in plugins.xld
$xld = Join-Path $BaseDir 'plugins.xld'
if (-not (Test-Path $xld)) {
    Set-Content $xld -Value "<Plugin", " <Timeo>", ">"
    Write-Host "Created $xld"
}
elseif (Select-String -Path $xld -SimpleMatch '<Timeo>' -Quiet) {
    Write-Host "plugins.xld already lists Timeo."
}
else {
    $lines = [System.Collections.Generic.List[string]](Get-Content $xld)
    $close = $lines.FindLastIndex({ param($l) $l.Trim() -eq '>' })
    if ($close -lt 0) { throw "Could not find the closing '>' in $xld. Add <Timeo> by hand." }
    $lines.Insert($close, ' <Timeo>')
    Set-Content $xld -Value $lines
    Write-Host "Added <Timeo> to $xld"
}

Write-Host "Done. Restart Olex2."
