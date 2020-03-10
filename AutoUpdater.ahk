#NoEnv

VersionCheck:

	versionURL := "https://raw.githubusercontent.com/Colinquess/MacroOneForALL/master/CurrentVersion.txt"
	packageURL := "https://github.com/Colinquess/MacroOneForALL/archive/master.zip"
	
	FileRead, currentVersion, CurrentVersion.txt
	
	if (versionURL = "ERROR" || CurrentVersion = "ERROR")
	{
		MsgBox "Unable to read initialization settings. No version check performed."
	}
	
	URLDownloadToFile %versionURL%, CurrentVersion.txt
	
	FileRead, RemoteVersion, CurrentVersion.txt
	RemoteVersion := RegExReplace(RemoteVersion,"`n")
	if (ErrorLevel = 1)
	{
		MsgBox Failed to retrieve latest version number from %versionURL%. Please check your network connection and try again.
		Return
	} 
	else
	{
		match := compareVersions(RemoteVersion,CurrentVersion)
		if (match != 0)
		{
			MsgBox A newer version of this script is available. After clicking OK, your script will be updated and relaunched.
			GoSub Update
		}
		Return
	}
	Return

Update:	

	FileDelete %A_ScriptDir%\..\MacroOneForALL-master.zip
	FileRemoveDir, %A_ScriptDir%\..\MacroOneForALL-master.zip
	FileRemoveDir, %A_ScriptDir%\..\MacroOneForALL-master.zip, 1
	sleep, 500
	PowerShell = Invoke-WebRequest '%packageURL%' -OutFile '%A_ScriptDir%\..\MacroOneForALL-master.zip'
	RunWait, PowerShell %PowerShell%,, Hide
	
	pathing := A_ScriptDir
	
	PowerShell = Expand-Archive -LiteralPath '%pathing%\..\MacroOneForALL-master.zip' %pathing%\..
	
	FileRemoveDir, %A_ScriptDir%
	FileRemoveDir, %A_ScriptDir%, 1
	FileDelete %A_ScriptDir%
	
	msgbox %pathing%
	RunWait, PowerShell %PowerShell%,, Hide UseErrorLevel
	if (ErrorLevel = 0)
	{
		;FileDelete %A_ScriptDir%\MacroOneForALL-master.zip
		MsgBox Script updated successfully!
		Reload
	} 
	else 
	{
		MsgBox An error occurred during the update process. No update was performed. Check if you have 7-Zip installed (executable instalation should be available on the script folder)
		ExitApp
	}
	Return

compareVersions(remoteVersion,localVersion)
{
	StringSplit remoteArray, remoteVersion, "."
	StringSplit localArray, localVersion, "."
	match = 0
	
	Loop %remoteArray0%
	{
		this_r := remoteArray%A_Index%
		this_l := localArray%A_Index%
		if (this_r > this_l)
		{
			++match
		}
	}
	
	Return match
}