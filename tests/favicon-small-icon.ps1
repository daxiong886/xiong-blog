param(
    [string]$IconPath = (Join-Path $PSScriptRoot '..\static\favicon-32x32.png'),
    [string]$SourcePath = (Join-Path $PSScriptRoot '..\static\favicon.png')
)

$ErrorActionPreference = 'Stop'

Add-Type -AssemblyName System.Drawing
$bitmap = [System.Drawing.Bitmap]::FromFile((Resolve-Path -LiteralPath $IconPath))
$source = [System.Drawing.Bitmap]::FromFile((Resolve-Path -LiteralPath $SourcePath))

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

    $expected = New-Object System.Drawing.Bitmap(32, 32, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $graphics = [System.Drawing.Graphics]::FromImage($expected)
    try {
        $graphics.Clear([System.Drawing.Color]::Transparent)
        $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
        $graphics.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
        $graphics.DrawImage($source, (New-Object System.Drawing.Rectangle(3, 3, 26, 26)))
    }
    finally {
        $graphics.Dispose()
    }

    foreach ($y in 0..31) {
        foreach ($x in 0..31) {
            if ($bitmap.GetPixel($x, $y).ToArgb() -ne $expected.GetPixel($x, $y).ToArgb()) {
                throw 'The tab icon must use the complete source logo, scaled with a transparent safety margin.'
            }
        }
    }

    $expected.Dispose()
}
finally {
    $bitmap.Dispose()
    $source.Dispose()
}
