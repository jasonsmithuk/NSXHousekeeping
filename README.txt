Script: 	NSXHousekeeping.ps1
Author: 	Jason Smith (jason.3.smith@atos.net)

Function
=========

Performs housekeeping of NSX backups stored on Window Servers older than the specified number of days in the script variable $RemoveLogFilesOlderThanDays.

The following variable need to be updated as per requirements

$NSXBackupLocation
	
	Specifies the location of where the backup files are

$RemoveLogFilesOlderThanDays

	Specifies after how many days the backups should be deleted

$ErrorLogDIR

	Specifies where failure logs should saved to


Change Log
==========

1.0	Inital Version