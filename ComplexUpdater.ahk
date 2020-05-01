#NoEnv
;#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
#include *i CloudArchive.ahk
#include *i ArchiveVersions.ahk

updates = 0

ComplexUpdate:
	
	CreateUptimeVariable = $timeSpanSinceBoot = ((get-date) - (gcim Win32_OperatingSystem).LastBootUpTime).TotalMinutes; $timeSpanSinceBoot | Out-File %A_ScriptDir%\BootTime.txt

	RunWait, PowerShell %CreateUptimeVariable%,, Hide

	FileRead, Uptime, %A_ScriptDir%\BootTime.txt
	
	if (Uptime > 5){
	
		RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run, ComplexUpdater.ahk, %A_ScriptDir%\ComplexUpdater.ahk
	
		versionURL := "https://raw.githubusercontent.com/Colinquess/MacroOneForALL/master/CloudArchive.ahk"
		link := "https://raw.githubusercontent.com/Colinquess/MacroOneForALL/master/ArchiveVersions.ahk"
		
		updates = 0
		
		if !FileExist("CloudArchive.ahk") {
			URLDownloadToFile %versionURL%, %A_ScriptDir%\CloudArchive.ahk
			Reload
		}
		
		URLDownloadToFile %versionURL%, %A_ScriptDir%\CloudArchive.ahk
		
		
		if !FileExist("ArchiveVersions.ahk") {
			URLDownloadToFile %link%, %A_ScriptDir%\ArchiveVersions.ahk
			Reload
		}
		
		
		loop, %ArchiveQNTArchives%{
			UpdateChecker(ArchiveVersions.FileName[A_Index], ArchiveVersions.LocalVersion[A_Index], CloudArchive.RemoteVersion[A_Index], CloudArchive.ItsDownloadLink[A_Index], ArchiveVersions.ItsLocal[A_Index])
		}
		
		UpdateChecker(FileName, LocalVersion, RemoteVersion, ItsDownloadLink, ItsLocal){
			if FileExist(ItsLocal "\" FileName){
				if (LocalVersion != RemoteVersion){
					URLDownloadToFile %ItsDownloadLink%, %ItsLocal%\%FileName%
					++updates
				}
				else{
				}
			}
			else{
				URLDownloadToFile %ItsDownloadLink%, %ItsLocal%\%FileName%
				++updates
			}
			return
		}
	}
	else{
		Sleep, 350000
	}
	
	if (updates != 0){
		GoSub ComplexUpdate
	}

Return