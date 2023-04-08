Add-Type -assembly System.Windows.Forms

[System.Windows.Forms.Application]::EnableVisualStyles()

$window = New-Object System.Windows.Forms.Form

$window.Text = "MS-DOS Mode GUI"
$window.Width = 640
$window.Height = 480
$window.AutoSize = $true
$window.MaximizeBox = $false
$window.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon("C:\Data\Coding\ms-dos-mode\assets\ms-dos.ico")

$autoexec = New-Object System.Windows.Forms.TextBox
$autoexec.Multiline = $true
$autoexec.Text = "echo Running in MS-DOS Mode!"
$autoexec.Enabled = $true
$autoexec.ScrollBars = "Vertical"
$autoexec.Location = New-Object System.Drawing.Point(10, 10)
$autoexec.Size = New-Object System.Drawing.Size(600, 150)
$window.Controls.Add($autoexec)

# Create an OK button to close the form
$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(400, 120)
$okButton.Size = New-Object System.Drawing.Size(200, 40)
$okButton.Text = "Restart Now"
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$window.Controls.Add($okButton)

$window.ShowDialog()