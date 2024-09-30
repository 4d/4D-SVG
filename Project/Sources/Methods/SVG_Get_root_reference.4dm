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
#DECLARE($svgObject : Text) : Text

var $CURRENT_METHOD : Text

$CURRENT_METHOD:="SVG_Get_root_reference"

If (Count parameters:C259<1)
	
	ASSERT:C1129(Component_putError(8850; $CURRENT_METHOD))  // Parameters Missing
	
	return 
	
End if 

If (Asserted:C1132(xml_referenceValid($svgObject); Localized string:C991("error_badReference")))
	
	return DOM Get root XML element:C1053($svgObject)
	
Else 
	
	ASSERT:C1129(Component_putError(8852; $CURRENT_METHOD))  // The reference is not a svg object
	
End if 