$webhook = "YOUR_WEBHOOK_HERE"
# Địa chỉ IP và cổng của server
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
