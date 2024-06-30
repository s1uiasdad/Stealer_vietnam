# Giải mã chuỗi Base64 để lấy nội dung của tệp .bat
$code = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("batcodeinhere="))

# Tạo một tệp .bat tạm thời
$tempBatFile = [System.IO.Path]::GetTempFileName() + ".bat"

# Ghi nội dung đã giải mã vào tệp tạm thời
Set-Content -Path $tempBatFile -Value $code

# Chạy tệp .bat và chờ cho nó hoàn thành
Start-Process -FilePath $tempBatFile -NoNewWindow -Wait
