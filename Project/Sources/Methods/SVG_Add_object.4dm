//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Add_object
  // Created 23/04/10 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_object;$Dom_source;$Dom_target;$kTxt_currentMethod)

If (False:C215)
	C_TEXT:C284(SVG_Add_object ;$0)
	C_TEXT:C284(SVG_Add_object ;$1)
	C_TEXT:C284(SVG_Add_object ;$2)
End if 

  // ----------------------------------------------------
  // Initialisations
Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_Add_object"

  // ----------------------------------------------------

If (Asserted:C1132($Lon_parameters>=2;Get localized string:C991("error_missingParameter")))
	
	$Dom_target:=$1
	$Dom_source:=$2
	
	If (Asserted:C1132(xml_referenceValid ($Dom_source) & xml_referenceValid ($Dom_target);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		$Dom_object:=DOM Append XML element:C1082($Dom_target;$Dom_source)
		
		$0:=$Dom_object*Num:C11(OK=1)
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 