//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Open_file
  // Created 17/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // Open a svg file
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_BOOLEAN:C305($2)

C_BOOLEAN:C305($Boo_validate)
C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($kTxt_currentMethod;$Txt_path;$Txt_pathDTD;$Txt_rootReference)

If (False:C215)
	C_TEXT:C284(SVG_Open_file ;$0)
	C_TEXT:C284(SVG_Open_file ;$1)
	C_BOOLEAN:C305(SVG_Open_file ;$2)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=1)
	
	$Txt_path:=$1
	
	If ($Lon_parameters>=2)
		
		$Boo_validate:=$2
		
	End if 
	
	If (Test path name:C476($Txt_path)=Is a document:K24:1)
		
		$Txt_pathDTD:=Get 4D folder:C485(Current resources folder:K5:16)
		$Txt_pathDTD:=$Txt_pathDTD+"DTD"+Folder separator:K24:12+"svg10.dtd"
		
		If (Test path name:C476($Txt_pathDTD)=Is a document:K24:1)
			
			Component_errorHandler ("init";$kTxt_currentMethod)
			
			If ($Boo_validate)
				
				  //parse & validate
				$Txt_rootReference:=DOM Parse XML source:C719($Txt_path;True:C214;$Txt_pathDTD)
				
			Else 
				
				$Txt_rootReference:=DOM Parse XML source:C719($Txt_path)
				
			End if 
			
			If (OK=1)
				
				  // Store the reference {
				Use (Storage:C1525.svg)
					
					If (Storage:C1525.svg.docs=Null:C1517)
						
						Storage:C1525.svg.docs:=New shared collection:C1527
						
					End if 
					
					Storage:C1525.svg.docs.push($Txt_rootReference)
					
				End use 
				  //}
				
				$0:=$Txt_rootReference
				
			Else 
				
				  //Keep the error
				ASSERT:C1129(Component_errorHandler ("keep"))
				
			End if 
			
			ASSERT:C1129(Component_errorHandler ("deinit"))
			
		Else 
			
			ASSERT:C1129(Component_putError (8856;$kTxt_currentMethod))  //The DTD file was not found
			
		End if 
		
	Else 
		
		ASSERT:C1129(Component_putError (-43;$kTxt_currentMethod))  //Parameters Missing
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 