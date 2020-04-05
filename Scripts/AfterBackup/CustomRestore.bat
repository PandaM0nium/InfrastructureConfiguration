:: Set local directory to relative path
setlocal && cd /d %~dp0
echo %date% - %time% - starting CustomRestore.bat script >> "CustomRestore.log"

:: Restore SCCMContentLib from Site Server to UNC backup share
robocopy "\\ar-fs01\Domain_FileShare\Backup_store\ConfigMgr_Backup\CustomBackup\SCCMContentLib" "M:\SCCMContentLib" /MIR /W:5 >> CustomRestore.log
:: Restore WSUS Content from Site Server to UNC backup share
robocopy "\\ar-fs01\Domain_FileShare\Backup_store\ConfigMgr_Backup\CustomBackup\WSUS" "J:\" /MIR /W:5 >> CustomRestore.log
:: Restore Content Source Share from Site Server to UNC backup share
robocopy "\\ar-fs01\Domain_FileShare\Backup_store\ConfigMgr_Backup\CustomBackup\Sources" "L:\" /MIR /W:5 >> CustomRestore.log
:: Restore Content Source Share from Site Server to UNC backup share
robocopy "\\ar-fs01\Domain_FileShare\Backup_store\ConfigMgr_Backup\CustomBackup\CD.Latest" "D:\cd.latest" /MIR /W:5 >> CustomRestore.log
:: Done
echo %date% - %time% - CustomRestore.bat complete >> CustomRestore.log