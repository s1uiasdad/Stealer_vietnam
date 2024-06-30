$array = @("
batcodeinhere
")
$tempBatFile = [System.IO.Path]::GetTempFileName() + ".bat"
Set-Content -Path $tempBatFile -Value $batContent
Start-Process -FilePath $tempBatFile -NoNewWindow -Wait
