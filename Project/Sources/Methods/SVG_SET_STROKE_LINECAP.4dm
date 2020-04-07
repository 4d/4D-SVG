//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_STROKE_LINECAP
  // Created 12/09/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($kTxt_currentMethod;$Txt_linecap;$Txt_objectID)

If (False:C215)
	C_TEXT:C284(SVG_SET_STROKE_LINECAP ;$1)
	C_TEXT:C284(SVG_SET_STROKE_LINECAP ;$2)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Txt_objectID:=$1
	$Txt_linecap:=$2
	
	If (Asserted:C1132(xml_referenceValid ($Txt_objectID);Get localized string:C991("error_badReference")))
		
		If (Position:C15($Txt_linecap+"|";"butt|round|square|inherit|")>0)
			
			Component_errorHandler ("init";$kTxt_currentMethod)
			
			DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
				"stroke-linecap";$Txt_linecap)
			
			ASSERT:C1129(Component_errorHandler ("deinit"))
			
		Else 
			
			ASSERT:C1129(Component_putError (8853;$kTxt_currentMethod))  //Invalid Value for an Attribute
			
		End if 
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 