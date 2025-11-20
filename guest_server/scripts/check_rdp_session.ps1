$regPath = "HKLM:\Software\WinBoatVncCheck"
$valueName = "Checked"

$checkedValue = Get-ItemProperty -Path $regPath -Name $valueName -ErrorAction SilentlyContinue

if ($checkedValue.$valueName -eq 0) {
    Add-Type -AssemblyName System.Windows.Forms
    
    [System.Windows.Forms.MessageBox]::Show(
        "NOTICE: You are currently using a noVNC/console session.`n`nFor the best experience and full functionality, it is recommended to connect via Remote Desktop (RDP) instead.`n`nSome features may not work properly in noVNC sessions.",
        "RDP Connection Recommended",
        [System.Windows.Forms.MessageBoxButtons]::OK,
        [System.Windows.Forms.MessageBoxIcon]::Information
    )
    
    Set-ItemProperty -Path $regPath -Name $valueName -Value 1
}