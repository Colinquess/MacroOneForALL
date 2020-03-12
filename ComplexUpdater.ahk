#NoEnv
;#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
versionURL := "https://raw.githubusercontent.com/Colinquess/MacroOneForALL/master/CloudArchive.ahk"
link := "https://raw.githubusercontent.com/Colinquess/MacroOneForALL/master/ArchiveVersions.ahk"

updates = 0

ComplexUpdate:
	updates = 0
	
	#include *i CloudArchive.ahk
	if !FileExist("CloudArchive.ahk") {
		URLDownloadToFile %versionURL%, %A_ScriptDir%\CloudArchive.ahk
		Reload
	}
	URLDownloadToFile %versionURL%, %A_ScriptDir%\CloudArchive.ahk
	
	#include *i ArchiveVersions.ahk
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
Return

if (updates != 0){
	GoSub ComplexUpdate
}