add-type -AssemblyName System.windows.forms; 
$handleProcess = Start-Process -NoNewWindow node $args[0] -PassThru

#create a form
$form = New-Object system.windows.forms.form
$form.Text = "powershell webviewer for node.js - express"
$form.Width = 1024
$form.Height = 600
$form.icon = [System.Drawing.Icon]::ExtractAssociatedIcon("$pshome\powershell.exe")

#create a webviewer
$webro = New-Object System.Windows.Forms.WebBrowser
$webro.IsWebBrowserContextMenuEnabled = $false
$webro.ScriptErrorsSuppressed = $true
$webro.ScrollBarsEnabled = $false
$webro.Dock = 'Fill'

#navigate web net
$webro.Navigate("http://localhost:7777")

#add webviewer to form
$form.Controls.Add($webro)

#show GUI
$form.ShowDialog()
Stop-Process -Id $handleProcess.Id