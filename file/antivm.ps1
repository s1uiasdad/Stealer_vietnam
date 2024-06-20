# Lấy thông tin User
$user = $env:username

# Lấy UUID sử dụng Win32_ComputerSystemProduct
$uuid = (Get-WmiObject -Class Win32_ComputerSystemProduct).UUID

# Lấy tên máy tính
$computerName = $env:COMPUTERNAME

# URL chứa danh sách từ GitHub
$url = "https://raw.githubusercontent.com/Blank-c/Blank-Grabber/main/Blank%20Grabber/Components/stub.py"

# Tải nội dung của file từ GitHub
$content = Invoke-WebRequest -Uri $url -UseBasicParsing

# Khởi tạo biến để chứa thông báo trùng
$matchMessage = ""

# Kiểm tra nếu User có trong nội dung file
if ($content.Content -like "*$user*") {
    $matchMessage += "User trùng: $user`n"
}

# Kiểm tra nếu UUID có trong nội dung file
if ($content.Content -like "*$uuid*") {
    $matchMessage += "UUID trùng: $uuid`n"
}

# Kiểm tra nếu Computer Name có trong nội dung file
if ($content.Content -like "*$computerName*") {
    $matchMessage += "Computer Name trùng: $computerName`n"
}

# In thông báo nếu có trùng
if ($matchMessage) {
    Write-Output "VM not allowed!"
    Write-Output $matchMessage
} else {
    Write-Output "User: $user"
    Write-Output "UUID: $uuid"
    Write-Output "Computer Name: $computerName"
}
# kill những ứng dụng :)
