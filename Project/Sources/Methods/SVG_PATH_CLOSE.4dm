//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_PATH_CLOSE
  // Created 23/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($kTxt_currentMethod;$Txt_name;$Txt_parentReference;$Txt_Path)

If (False:C215)
	C_TEXT:C284(SVG_PATH_CLOSE ;$1)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=1)
	
	$Txt_parentReference:=$1
	
	If (Asserted:C1132(xml_referenceValid ($Txt_parentReference);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM GET XML ELEMENT NAME:C730($Txt_parentReference;$Txt_name)
		
		If ($Txt_name="path")
			
			DOM GET XML ATTRIBUTE BY NAME:C728($Txt_parentReference;"d";$Txt_Path)
			
			If (OK=1)
				
				If ($Txt_Path[[Length:C16($Txt_Path)]]#"z")
					
					$Txt_Path:=$Txt_Path+"z"
					DOM SET XML ATTRIBUTE:C866($Txt_parentReference;\
						"d";$Txt_Path)
					
				End if 
			End if 
			
			ASSERT:C1129(Component_errorHandler ("deinit"))
			
		Else 
			
			ASSERT:C1129(Component_putError (8854))  //Impossible to apply this Command for this Node
			
		End if 
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 