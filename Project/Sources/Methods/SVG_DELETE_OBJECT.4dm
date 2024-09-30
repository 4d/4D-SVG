//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_DELETE_OBJECT
// Created 16/04/10 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($svgObject : Text)

var $CURRENT_METHOD; $root : Text

Compiler_SVG

$CURRENT_METHOD:="SVG_DELETE_OBJECT"

If (Count parameters:C259<1)
	
	ASSERT:C1129(Component_putError(8850; $CURRENT_METHOD))  // Parameters Missing
	
	return 
	
End if 

If (Asserted:C1132(xml_referenceValid($svgObject); Localized string:C991("error_badReference")))
	
	Component_errorHandler("init"; $CURRENT_METHOD)
	
	$root:=DOM Get root XML element:C1053($svgObject)
	
	If (Bool:C1537(OK))\
		 && (xml_referenceValid($root))
		
		DOM REMOVE XML ELEMENT:C869($svgObject)
		
	Else 
		
		ASSERT:C1129(Component_putError(8852; $CURRENT_METHOD))  // The reference is not a svg object
		
	End if 
	
	ASSERT:C1129(Component_errorHandler("deinit"))
	
End if 