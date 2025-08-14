# System-Monitor.ps1
# Author: Your Name
# Description: Checks CPU, RAM, and disk usage and outputs to a text file

# Get timestamp
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# CPU Usage
$cpuLoad = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue

# RAM Usage
$memory = Get-CimInstance Win32_OperatingSystem
$freeRAM = [math]::round($memory.FreePhysicalMemory / 1MB, 2)
$totalRAM = [math]::round($memory.TotalVisibleMemorySize / 1MB, 2)
$usedRAM = [math]::round($totalRAM - $freeRAM, 2)

# Disk Usage
$diskInfo = Get-PSDrive -PSProvider 'FileSystem' | ForEach-Object {
    [PSCustomObject]@{
        Drive = $_.Name
        UsedGB = [math]::round(($_.Used / 1GB), 2)
        FreeGB = [math]::round(($_.Free / 1GB), 2)
        TotalGB = [math]::round(($_.Used + $_.Free) / 1GB, 2)
    }
}

# Output to screen
Write-Host "`n=== System Resource Report ($timestamp) ==="
Write-Host "CPU Load: $([math]::Round($cpuLoad, 2))%"
Write-Host "RAM: $usedRAM GB used / $totalRAM GB total"
Write-Host "`nDisk Usage:"
$diskInfo | Format-Table -AutoSize

# Optional: Output to file
$outputPath = "$env:USERPROFILE\Desktop\system_report.txt"
Add-Content -Path $outputPath -Value "`n=== System Resource Report ($timestamp) ==="
Add-Content -Path $outputPath -Value "CPU Load: $([math]::Round($cpuLoad, 2))%"
Add-Content -Path $outputPath -Value "RAM: $usedRAM GB used / $totalRAM GB total"
Add-Content -Path $outputPath -Value "`nDisk Usage:"
$diskInfo | Out-String | Add-Content -Path $outputPath
