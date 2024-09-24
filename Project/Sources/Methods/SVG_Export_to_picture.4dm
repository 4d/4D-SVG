//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_Export_to_picture
// Created 22/07/08 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($svgObject : Text; $exportType : Integer) : Picture

var $picture : Picture

Compiler_SVG

If (Count parameters:C259>=1)
	
	$exportType:=$exportType#0 ? $exportType : Copy XML data source:K45:17
	
	If (Asserted:C1132(xml_referenceValid($svgObject); Localized string:C991("error_badReference")))
		
		Try(SVG EXPORT TO PICTURE:C1017($svgObject; $picture; $exportType))
		
		return $picture
		
	Else 
		
		ASSERT:C1129(Component_putError(8852; Current method name:C684))  // The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError(8850; Current method name:C684))  // Parameters Missing
	
End if 