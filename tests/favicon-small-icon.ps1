param(
    [string]$IconPath = (Join-Path $PSScriptRoot '..\static\favicon-32x32.png')
)

$ErrorActionPreference = 'Stop'

Add-Type -AssemblyName System.Drawing
$bitmap = [System.Drawing.Bitmap]::FromFile((Resolve-Path -LiteralPath $IconPath))

try {
    if ($bitmap.Width -ne 32 -or $bitmap.Height -ne 32) {
        throw "Expected a 32x32 tab icon; got $($bitmap.Width)x$($bitmap.Height)."
    }

    foreach ($index in 0..31) {
        foreach ($coordinate in @(@(0, $index), @(31, $index), @($index, 0), @($index, 31))) {
            if ($bitmap.GetPixel($coordinate[0], $coordinate[1]).A -gt 8) {
                throw 'The icon artwork touches its outer edge; tab icons need a transparent safety margin.'
            }
        }
    }
}
finally {
    $bitmap.Dispose()
}
