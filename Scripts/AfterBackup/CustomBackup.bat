:: Set local directory to relative path
setlocal && cd /d %~dp0
echo %date% - %time% - starting CustomBackup.bat script >> "CustomBackup.log"

:: Copy SCCMContentLib from Site Server to UNC backup share
robocopy "M:\SCCMContentLib" "\\ar-fs01\Domain_FileShare\Backup_store\ConfigMgr_Backup\CustomBackup\SCCMContentLib" /MIR /W:5 >> CustomBackup.log
:: Copy WSUS Content from Site Server to UNC backup share
robocopy "J:\" "\\ar-fs01\Domain_FileShare\Backup_store\ConfigMgr_Backup\CustomBackup\WSUS" /MIR /W:5 >> CustomBackup.log
:: Copy Content Source Share from Site Server to UNC backup share
robocopy "L:\" "\\ar-fs01\Domain_FileShare\Backup_store\ConfigMgr_Backup\CustomBackup\Sources" /MIR /W:5 >> CustomBackup.log
:: Copy Content Source Share from Site Server to UNC backup share
robocopy "E:\Program Files\Microsoft Configuration Manager\cd.latest" "\\ar-fs01\Domain_FileShare\Backup_store\ConfigMgr_Backup\CustomBackup\CD.Latest" /MIR /W:5 >> CustomBackup.log
:: Done
echo %date% - %time% - CustomBackup.bat complete >> CustomBackup.log