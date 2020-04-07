//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Read_element_type
  // Created 23/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_svgObject;$kTxt_currentMethod;$Txt_name)

If (False:C215)
	C_TEXT:C284(SVG_Read_element_type ;$0)
	C_TEXT:C284(SVG_Read_element_type ;$1)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=1)
	
	$Dom_svgObject:=$1
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM GET XML ELEMENT NAME:C730($Dom_svgObject;$Txt_name)
		
		If (OK=1)
			
			$0:=$Txt_name
			
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 