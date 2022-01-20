//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_Get_version
// Created 16/06/08 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE()->$version : Text

If (False:C215)
	C_TEXT:C284(SVG_Get_version; $0)
End if 

var $build; $pathname : Text
var $buildNum : Integer

Compiler_SVG

$pathname:=Get 4D folder:C485(Database folder:K5:14)+"Info.plist"

If (Test path name:C476($pathname)=Is a document:K24:1)
	
	If (xml_getInfoPListKey($pathname; "CFBundleShortVersionString"; ->$version))
		
		If (xml_getInfoPListKey($pathname; "CFBundleVersion"; ->$build))
			
			$version:=Choose:C955($version="dev"; "0"; $version)+"."+$build
			
		End if 
	End if 
End if 

If (Length:C16($version)=0)  // No valid info.plist from build chain
	
	$version:=Application version:C493($buildNum)
	
	If (Num:C11($version[[3]])#0)  // R
		
		$version:=Substring:C12($version; 1; 2)+"R"+$version[[3]]
		
	Else   // LTS
		
		$version:=Substring:C12($version; 1; 2)+"."+$version[[4]]
		
	End if 
	
	$version:=$version+"."+String:C10($buildNum)
	
End if 