$Path = "$env:TEMP\main.ps1"
if (-not $Path) {
    $Path = Read-Host "path to ps1 script:"
    if (-not (Test-Path -Path $Path -PathType Leaf)) {
        Write-Host "invalid path lol"
        return
    }
}

$scrcont = Get-Content $Path -Raw
$encscr = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($scrcont))

$Seed = Get-Random
$MixedBase64 = [Text.Encoding]::ASCII.GetString(([Text.Encoding]::ASCII.GetBytes($encscr) | Sort-Object { Get-Random -SetSeed $Seed }))

$Var1 = -Join ((65..90) + (97..122) | Get-Random -Count ((1..12) | Get-Random) | % { [char]$_ })
$Var2 = -Join ((65..90) + (97..122) | Get-Random -Count ((1..12) | Get-Random) | % { [char]$_ })

$obfedscr = "# Obfuscated by: https://github.com/EvilBytecode`n`n" +
"`$$($Var1) = [Text.Encoding]::ASCII.GetString(([Text.Encoding]::ASCII.GetBytes(`'$($MixedBase64)') | Sort-Object { Get-Random -SetSeed $($Seed) })); `$$($Var2) = [Text.Encoding]::ASCII.GetString([Convert]::FromBase64String(`$$($Var1))); IEX `$$($Var2)"

$putfile = "Obfuscated-" + ([System.IO.Path]::GetRandomFileName() -replace '\.', '') + ".ps1"
$obfedscr | Out-File -FilePath $putfile

Write-Host "[+] obf script saved as $putfile" -ForegroundColor Green
