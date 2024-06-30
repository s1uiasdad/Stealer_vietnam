$code = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("batcodeinhere="))
$tempBatFile = [System.IO.Path]::GetTempFileName() + ".bat"
Set-Content -Path $tempBatFile -Value $batContent
Start-Process -FilePath $tempBatFile -NoNewWindow -Wait
