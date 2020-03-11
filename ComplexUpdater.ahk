#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
versionURL := "https://raw.githubusercontent.com/Colinquess/MacroOneForALL/master/CloudArchive.ahk"


ComplexUpdate:
	updates = 0
	URLDownloadToFile %versionURL%, %A_ScriptDir%\CloudArchive.ahk

	#include CloudArchive.ahk
	#include ArchiveVersions.ahk

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
