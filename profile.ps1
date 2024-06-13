$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
$session.UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36"
$session.Cookies.Add((New-Object System.Net.Cookie("__dcfduid", "7c7f48ce1a4711ee91057afb28e707b2", "/", "discord.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("__sdcfduid", "7c7f48ce1a4711ee91057afb28e707b2666168311476d153d72f8a04d280aa9d429471fb38e4e01f9fffc560dad11976", "/", "discord.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("_gcl_au", "1.1.1958763086.1713676798", "/", ".discord.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("_ga_YL03HBJY7E", "GS1.1.1717393239.1.0.1717393239.0.0.0", "/", ".discord.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("_ga", "GA1.1.1386822673.1686301906", "/", ".discord.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("__stripe_mid", "ecc9254e-7814-4a19-a9e3-7e2f6a4b8f19a97b21", "/", ".discord.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("dbind", "a21ac3b2-2386-4a6a-aef8-a51f726d1c22", "/", "discord.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("cf_clearance", "jE1khHjpZwm2MHu6WXlUbOahXTFF6yfwwKQlil4Kl9E-1718011038-1.0.1.1-IpVU9alcbitpIT61TOW6nFeonSGokZX15AmwlTlttIJtHC4s_R3pkUgZf1NEz2BLhgZznh4N90EJe5vxWvL5HA", "/", ".discord.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("_ga_5CWMJQ1S0X", "GS1.1.1718024144.3.1.1718024279.0.0.0", "/", ".discord.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("OptanonConsent", "isIABGlobal=false&datestamp=Tue+Jun+11+2024+12%3A50%3A48+GMT%2B0700+(Gi%E1%BB%9D+%C4%90%C3%B4ng+D%C6%B0%C6%A1ng)&version=6.33.0&hosts=&landingPath=https%3A%2F%2Fdiscord.com%2F&groups=C0001%3A1%2CC0002%3A1%2CC0003%3A1", "/", ".discord.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("_ga_Q149DFWHT7", "GS1.1.1718085048.78.1.1718085636.0.0.0", "/", ".discord.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("__cfruid", "6e8eb6f0660b3f000f8fe23c78d21b602cbc75b3-1718247568", "/", ".discord.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("_cfuvid", "NteBEP6P7qgSkoDcIlxRKLxQierAdiuJYXgGZbj0oDY-1718247568133-0.0.1.1-604800000", "/", ".discord.com")))
Invoke-WebRequest -UseBasicParsing -Uri "https://discord.com/api/v9/users/%40me/profile" `
-Method "PATCH" `
-WebSession $session `
-Headers @{
"authority"="discord.com"
  "method"="PATCH"
  "path"="/api/v9/users/%40me/profile"
  "scheme"="https"
  "accept"="*/*"
  "accept-encoding"="gzip, deflate, br, zstd"
  "accept-language"="vi,fr-FR;q=0.9,fr;q=0.8,en-US;q=0.7,en;q=0.6"
  "authorization"="You_Token"
  "origin"="https://discord.com"
  "priority"="u=1, i"
  "referer"="https://discord.com/channels/1250415673272701030/1250415673272701033"
  "sec-ch-ua"="`"Chromium`";v=`"124`", `"Google Chrome`";v=`"124`", `"Not-A.Brand`";v=`"99`""
  "sec-ch-ua-mobile"="?0"
  "sec-ch-ua-platform"="`"Windows`""
  "sec-fetch-dest"="empty"
  "sec-fetch-mode"="cors"
  "sec-fetch-site"="same-origin"
  "x-debug-options"="bugReporterEnabled"
  "x-discord-locale"="vi"
  "x-discord-timezone"="Asia/Saigon"
  "x-super-properties"="eyJvcyI6IldpbmRvd3MiLCJicm93c2VyIjoiQ2hyb21lIiwiZGV2aWNlIjoiIiwic3lzdGVtX2xvY2FsZSI6InZpIiwiYnJvd3Nlcl91c2VyX2FnZW50IjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEyNC4wLjAuMCBTYWZhcmkvNTM3LjM2IiwiYnJvd3Nlcl92ZXJzaW9uIjoiMTI0LjAuMC4wIiwib3NfdmVyc2lvbiI6IjEwIiwicmVmZXJyZXIiOiIiLCJyZWZlcnJpbmdfZG9tYWluIjoiIiwicmVmZXJyZXJfY3VycmVudCI6IiIsInJlZmVycmluZ19kb21haW5fY3VycmVudCI6IiIsInJlbGVhc2VfY2hhbm5lbCI6InN0YWJsZSIsImNsaWVudF9idWlsZF9udW1iZXIiOjMwMTQwOSwiY2xpZW50X2V2ZW50X3NvdXJjZSI6bnVsbCwiZGVzaWduX2lkIjowfQ=="
} `
-ContentType "application/json" `
-Body ([System.Text.Encoding]::UTF8.GetBytes("{`"bio`":`"https://github.com/s1uiasdad/lisiyang1215v2\nsoftware stealer m$([char]225)y t$([char]237)nh free\nbypass anti virus`"}"))
