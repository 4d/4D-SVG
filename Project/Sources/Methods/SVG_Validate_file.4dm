//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Validate_file
  // Created 17/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_BOOLEAN:C305($0)
C_TEXT:C284($1)

C_BOOLEAN:C305($Boo_isSVG)
C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_root;$File_pathname;$kTxt_currentMethod;$Txt_buffer)

If (False:C215)
	C_BOOLEAN:C305(SVG_Validate_file ;$0)
	C_TEXT:C284(SVG_Validate_file ;$1)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=1)
	
	$File_pathname:=$1
	
	If (Test path name:C476($File_pathname)=Is a document:K24:1)
		
		  //#ACI0093752 {
		  //$Txt_pathDTD:=Get 4D folder(Current resources folder)+"DTD"+Folder separator+"svg10.dtd"
		  //If (Test path name($Txt_pathDTD)=Is a document)
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		  //$Txt_rootReference:=DOM Parse XML source($Txt_pathname;True;$Txt_pathDTD)
		$Dom_root:=DOM Parse XML source:C719($File_pathname;True:C214)
		
		$Boo_isSVG:=(OK=1)
		
		If ($Boo_isSVG)
			
			DOM GET XML ELEMENT NAME:C730(DOM Get root XML element:C1053($Dom_root);$Txt_buffer)
			
			$Boo_isSVG:=($Txt_buffer="svg")
			
			DOM CLOSE XML:C722($Dom_root)
			
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
		  //Else
		  //ASSERT(Component_putError (8856;$kTxt_currentMethod))  //The DTD file was not found
		  //End if
		  //}
		
	Else 
		
		ASSERT:C1129(Component_putError (-43;$kTxt_currentMethod))  //Parameters Missing
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 

$0:=$Boo_isSVG  //true if the file is a svg