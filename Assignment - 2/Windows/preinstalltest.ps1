# Preinstalltest.ps1

# Print messages about the system info
Write-Output "Checking disk usage..."
Get-WmiObject Win32_LogicalDisk -Filter "DriveType=3" | Format-Table DeviceID, @{n='Size (GB)';e={$_.Size / 1gb -as [int]}}, @{n='FreeSpace (GB)';e={$_.FreeSpace / 1gb -as [int]}}
Write-Output "Checking RAM size..."
(Get-WmiObject Win32_ComputerSystem).TotalPhysicalMemory / 1gb
Write-Output "Checking RAM usage..."
Get-CimInstance -ClassName CIM_OperatingSystem | Select-Object FreePhysicalMemory, TotalVisibleMemorySize
Write-Output "Checking CPU speed and architecture..."
Get-WmiObject Win32_Processor | Format-Table Name, CurrentClockSpeed, NumberOfCores, NumberOfLogicalProcessors