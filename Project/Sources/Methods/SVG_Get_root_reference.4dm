//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Project method : SVG_Get_root_reference
  // ID[76048F80C779454DB25CFCDC833CF59E]
  // Created 04/07/11 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  // SVG_Get_root_reference (svg_ref) -> svg_ref
  // Retrieves the root SVG element
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($0)
C_TEXT:C284($1)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_svgObject;$kTxt_currentMethod)

If (False:C215)
	C_TEXT:C284(SVG_Get_root_reference ;$0)
	C_TEXT:C284(SVG_Get_root_reference ;$1)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_Get_root_reference"  //Nom methode courante

If (Asserted:C1132($Lon_parameters>=1;Get localized string:C991("error_missingParameter")))
	
	$Dom_svgObject:=$1
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 

  // ----------------------------------------------------
If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
	
	$0:=DOM Get root XML element:C1053($Dom_svgObject)
	
Else 
	
	ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
	
End if 

  // ----------------------------------------------------
  // End