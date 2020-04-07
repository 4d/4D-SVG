//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Get_version
  // Created 16/06/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($0)

C_TEXT:C284($File_plist;$Txt_build;$Txt_separator;$Txt_version)

If (False:C215)
	C_TEXT:C284(SVG_Get_version ;$0)
End if 

Compiler_SVG 

$Txt_version:="0.0"

$File_plist:=Get 4D folder:C485(Database folder:K5:14)+"Info.plist"

If (Test path name:C476($File_plist)=Is a document:K24:1)
	
	If (xml_getInfoPListKey ($File_plist;"CFBundleShortVersionString";->$Txt_version))
		
		If (xml_getInfoPListKey ($File_plist;"CFBundleVersion";->$Txt_build))
			
			GET SYSTEM FORMAT:C994(Decimal separator:K60:1;$Txt_separator)
			
			$Txt_version:=Choose:C955($Txt_version="dev";"0";$Txt_version)+"."+$Txt_build
			
		End if 
	End if 
End if 

$0:=$Txt_version