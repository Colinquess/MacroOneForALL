VersionCheck:
	
	UpdateURL := "https://raw.githubusercontent.com/Colinquess/MacroOneForALL/master/CurrentVersion.md"
	packageURL := "https://github.com/Colinquess/MacroOneForALL/archive/master.zip"
	
	IniRead versionURL,sc2sm.ini,Options,UpdateURL
	IniRead currentVersion,sc2sm.ini,Options,Version
	if (VersionURL = "ERROR" || currentVersion = "ERROR")
	{
		MsgBox "Unable to read initialization settings. No version check performed."
	}
	
	URLDownloadToFile %versionURL%, latest.txt
	FileRead latest, latest.txt
	latest := RegExReplace(latest,"`n")
	if (ErrorLevel = 1)
	{
		MsgBox Failed to retrieve latest version number from %versionURL%. Please check your network connection and try again.
		Return
	} 
	else
	{
		match := compareVersions(latest,currentVersion)
		if (match != 0)
		{
			MsgBox A newer version of this script is available. After clicking OK, your script will be updated and relaunched.
			GoSub Update
		}
		Return
	}
	Return

Update:	

	IniRead packageURL,sc2sm.ini,Options,PackageURL
	URLDownloadToFile %packageURL%, %A_Temp%\MacroOneForALL-latest.zip
	
	CMD = e -y -o%A_ScriptDir% %A_Temp%\MacroOneForALL-latest.zip
	
	RunWait 7z.exe %CMD%,, Hide UseErrorLevel
	if (ErrorLevel = 0)
	{
		FileDelete %A_Temp%\MacroOneForALL-latest.zip
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




















