//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_CLASS
  // Created 30/11/09 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_element;$kTxt_currentMethod;$Txt_class)

If (False:C215)
	C_TEXT:C284(SVG_SET_CLASS ;$1)
	C_TEXT:C284(SVG_SET_CLASS ;$2)
End if 

  // ----------------------------------------------------
  // Initialisations
Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_SET_CLASS"  //Nom methode courante

  // ----------------------------------------------------

If ($Lon_parameters>=2)
	
	$Dom_element:=$1
	$Txt_class:=$2
	
	If (Asserted:C1132(xml_referenceValid ($Dom_element);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM SET XML ATTRIBUTE:C866($Dom_element;\
			"class";$Txt_class)
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 