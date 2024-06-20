Add-Type -AssemblyName System.Windows.Forms

# Tạo Form chính
$form = New-Object System.Windows.Forms.Form
$form.Text = 'File Pumper'
$form.Size = New-Object System.Drawing.Size(400, 250)
$form.StartPosition = 'CenterScreen'

# Tạo Label và TextBox để chọn file
$lblFile = New-Object System.Windows.Forms.Label
$lblFile.Location = New-Object System.Drawing.Point(10, 20)
$lblFile.Size = New-Object System.Drawing.Size(80, 20)
$lblFile.Text = 'Select File:'
$form.Controls.Add($lblFile)

$txtFile = New-Object System.Windows.Forms.TextBox
$txtFile.Location = New-Object System.Drawing.Point(100, 20)
$txtFile.Size = New-Object System.Drawing.Size(250, 20)
$form.Controls.Add($txtFile)

$btnBrowse = New-Object System.Windows.Forms.Button
$btnBrowse.Location = New-Object System.Drawing.Point(360, 20)
$btnBrowse.Size = New-Object System.Drawing.Size(30, 20)
$btnBrowse.Text = '...'
$btnBrowse.Add_Click({
    $ofd = New-Object System.Windows.Forms.OpenFileDialog
    if ($ofd.ShowDialog() -eq 'OK') {
        $txtFile.Text = $ofd.FileName
    }
})
$form.Controls.Add($btnBrowse)

# Tạo Label và ComboBox để chọn đơn vị kích thước
$lblUnit = New-Object System.Windows.Forms.Label
$lblUnit.Location = New-Object System.Drawing.Point(10, 60)
$lblUnit.Size = New-Object System.Drawing.Size(80, 20)
$lblUnit.Text = 'Size Unit:'
$form.Controls.Add($lblUnit)

$cmbUnit = New-Object System.Windows.Forms.ComboBox
$cmbUnit.Location = New-Object System.Drawing.Point(100, 60)
$cmbUnit.Size = New-Object System.Drawing.Size(100, 20)
$cmbUnit.Items.AddRange(@('KB', 'MB'))
$cmbUnit.SelectedIndex = 0
$form.Controls.Add($cmbUnit)

# Tạo Label và TextBox để nhập kích thước
$lblSize = New-Object System.Windows.Forms.Label
$lblSize.Location = New-Object System.Drawing.Point(10, 100)
$lblSize.Size = New-Object System.Drawing.Size(80, 20)
$lblSize.Text = 'Size:'
$form.Controls.Add($lblSize)

$txtSize = New-Object System.Windows.Forms.TextBox
$txtSize.Location = New-Object System.Drawing.Point(100, 100)
$txtSize.Size = New-Object System.Drawing.Size(100, 20)
$form.Controls.Add($txtSize)

# Tạo Button để thực hiện Pump
$btnPump = New-Object System.Windows.Forms.Button
$btnPump.Location = New-Object System.Drawing.Point(100, 140)
$btnPump.Size = New-Object System.Drawing.Size(75, 23)
$btnPump.Text = 'Pump'
$btnPump.Add_Click({
    $file = $txtFile.Text
    $size = [int]$txtSize.Text
    $unit = $cmbUnit.SelectedItem

    if (-not (Test-Path $file)) {
        [System.Windows.Forms.MessageBox]::Show('File not found!', 'Error', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        return
    }

    if ($size -eq 0) {
        [System.Windows.Forms.MessageBox]::Show('Size must be greater than 0!', 'Error', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        return
    }

    Invoke-Pumper -file $file -added_size $size -size_unit $unit -output "$file"

    [System.Windows.Forms.MessageBox]::Show('File pumped successfully!', 'Success', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
})
$form.Controls.Add($btnPump)

# Hàm Pump File
function Invoke-Pumper {
    param (
        [string]$file,
        [int]$added_size,
        [string]$size_unit,
        [string]$output
    )

    $insides = [System.IO.File]::ReadAllBytes($file)

    # Chuyển đổi kích thước sang bytes dựa trên đơn vị
    switch ($size_unit.ToUpper()) {
        "KB" { $added_bytes = $added_size * 1KB }
        "MB" { $added_bytes = $added_size * 1MB }
        default {
            Write-Output "Unsupported size unit. Please use KB or MB."
            return
        }
    }

    $outputStream = [System.IO.File]::OpenWrite($output)
    $outputStream.Write($insides, 0, $insides.Length)
    $other_by = New-Object byte[] $added_bytes
    $outputStream.Write($other_by, 0, $other_by.Length)
    $outputStream.Close()
}

# Hiển thị Form
$form.ShowDialog()
