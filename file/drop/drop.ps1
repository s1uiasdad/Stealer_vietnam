$batContent = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("ENCODE64DROPHERE"))
$tempBatFile = [System.IO.Path]::GetTempFileName() + ".bat"
Set-Content -Path $tempBatFile -Value $batContent
Start-Process -FilePath $tempBatFile -NoNewWindow -Wait
Remove-Item -Path $tempBatFile
