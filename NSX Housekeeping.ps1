
# ------------------------------------------------------------------------------
# Script: NSXHousekeeping.ps1   
# Author: Jason Smith
# Date: 05th September 2016
# Comments: PowerShell script to export housekeep NSX backups 
# Change Log:        v1. 05th September 2016.  First version
#-------------------------------------------------------------------------------

$ErrorActionPreference = ‘Stop’
$Error.clear()
$Date = get-date -Format yyyy-MM-dd-H-mm

$NSXBackupLocation = "D:\inetpub\ftproot\Archive\"
$RemoveLogFilesOlderThanDays = "7"
$ErrorLogDir = "Directory here"
$ErrorLogFile = "$Date.txt"
$LogMessageFail = "NSX Backup housekeeping task has failed. See log file $ErrorLogDir\$ErrorLogFile for more details"

Try 
{
    Get-ChildItem $NSXBackupLocation| Where-Object {$_.CreationTime -lt (Get-Date).AddDays(-$RemoveLogFilesOlderThanDays)} | Remove-Item -Confirm:$false
}
Catch
{
      write-eventlog -logname Application -source "NSXBackupHousekeeping" -eventID 1 -entrytype Error -message $LogMessageFail
     
        Foreach ($e in $Error) {

            Write-Output "******************************************" | Out-File  $ErrorLogfile -Append
    
            Write-Output "Excuction String:" $e.InvocationInfo.Line | out-file $ErrorLogfile -Append
            Write-Output "Error Returned:" $e.Exception | out-file $ErrorLogfile -Append
            Write-Output "******************************************" | Out-File  $ErrorLogfile -Append
        }
}





