//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Estimate_weight
  // Created 17/06/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // Returns the total size of SVG tree in memory.
  // ----------------------------------------------------
C_REAL:C285($0)
C_TEXT:C284($1)

C_BLOB:C604($Blb_Buffer)
C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_svgObject;$kTxt_currentMethod)

If (False:C215)
	C_REAL:C285(SVG_Estimate_weight ;$0)
	C_TEXT:C284(SVG_Estimate_weight ;$1)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=1)
	
	$Dom_svgObject:=$1
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM EXPORT TO VAR:C863($Dom_svgObject;$Blb_Buffer)
		
		If (OK=1)
			
			$0:=BLOB size:C605($Blb_Buffer)
			
		Else 
			
			If (SVG_Lon_Error=0)
				
				ASSERT:C1129(Component_putError (8858;$kTxt_currentMethod))  //Unknown error
				
			End if 
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 