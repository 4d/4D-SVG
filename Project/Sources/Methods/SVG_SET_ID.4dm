//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method: SVG_SET_ID
  // Date et heure : 16/03/06, 10:07:53
  // Framework SVgg
  // Author : Gérald Czwiklinski
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (01/07/08)
  // 2004 -> v11
  // ----------------------------------------------------
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_buffer;$Dom_object;$kTxt_currentMethod;$Txt_id)

If (False:C215)
	C_TEXT:C284(SVG_SET_ID ;$1)
	C_TEXT:C284(SVG_SET_ID ;$2)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_SET_ID"  //Nom methode courante

If (Asserted:C1132($Lon_parameters>=2;Get localized string:C991("error_missingParameter")))
	
	$Dom_object:=$1
	$Txt_id:=$2
	
	If (Length:C16($Txt_id)>0)
		
		If (Asserted:C1132(xml_referenceValid ($Dom_object);Get localized string:C991("error_badReference")))
			
			Component_errorHandler ("init";$kTxt_currentMethod)
			
			$Dom_buffer:=DOM Find XML element by ID:C1010(DOM Get root XML element:C1053($Dom_object);$Txt_id)
			
			If ((OK=0)\
				 | ($Dom_buffer=$Dom_object))
				
				DOM SET XML ATTRIBUTE:C866($Dom_object;\
					"id";$Txt_id)
				
			Else 
				
				ASSERT:C1129(Component_putError (8859))  //Duplicate ID
				
			End if 
			
			ASSERT:C1129(Component_errorHandler ("deinit"))
			
		Else 
			
			ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
			
		End if 
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 