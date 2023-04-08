Add-Type -assembly System.Windows.Forms

[System.Windows.Forms.Application]::EnableVisualStyles()

$window = New-Object System.Windows.Forms.Form

$window.Text = "MS-DOS Mode GUI"
$window.Width = 640
$window.Height = 480
$window.AutoSize = $true
$window.MaximizeBox = $false
$window.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon("C:\Data\Coding\ms-dos-mode\assets\ms-dos.ico")

# Create a group box to hold the radio buttons
$groupBox = New-Object System.Windows.Forms.GroupBox
$groupBox.Text = "Which MS-DOS mode do you want?"
$groupBox.Location = New-Object System.Drawing.Point(10, 10)
$groupBox.Size = New-Object System.Drawing.Size(600, 100)
$window.Controls.Add($groupBox)

# Create the first radio button
$radioButton1 = New-Object System.Windows.Forms.RadioButton
$radioButton1.Location = New-Object System.Drawing.Point(10, 20)
$radioButton1.Size = New-Object System.Drawing.Size(220, 20)
$radioButton1.Text = "MS-DOS Mode during system boot (recommended)"
$groupBox.Controls.Add($radioButton1)

# Create the second radio button
$radioButton2 = New-Object System.Windows.Forms.RadioButton
$radioButton2.Location = New-Object System.Drawing.Point(10, 40)
$radioButton2.Size = New-Object System.Drawing.Size(220, 30)
$radioButton2.Text = "MS-DOS Mode after login"
$groupBox.Controls.Add($radioButton2)

# Create an OK button to close the form
$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(200, 120)
$okButton.Size = New-Object System.Drawing.Size(200, 40)
$okButton.Text = "OK"
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$window.AcceptButton = $okButton
$window.Controls.Add($okButton)

$result = $window.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
  if ($radioButton1.Checked) {
    Write-Host "Option 1 selected"
  } elseif ($radioButton2.Checked) {
    Write-Host "Option 2 selected"
  }
}