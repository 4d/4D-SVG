//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_Export_to_XML
// Created 02/09/08 by Vincent de Lachaux
// ----------------------------------------------------
// Modified by Vincent de Lachaux (08/12/09)
// ACI0064079
// ----------------------------------------------------
#DECLARE($svgObject : Text) : Text

var $name; $value; $xml : Text
var $i : Integer

Compiler_SVG

If (Count parameters:C259=0)
	
	ASSERT:C1129(Component_putError(8850; Current method name:C684))  // Parameters Missing
	
	return 
	
End if 

If (Not:C34(xml_referenceValid($svgObject)))
	
	ASSERT:C1129(Component_putError(8852; Current method name:C684))  // The reference is not a svg object
	
	return 
	
End if 

Try
	
	// Mark:Http://forums.4d.fr/Post/FR/6124839/1/6134419#6134419
	DOM GET XML ELEMENT NAME:C730($svgObject; $name)
	
	If ($name="image")
		
		For ($i; 1; DOM Count XML attributes:C727($svgObject); 1)
			
			DOM GET XML ATTRIBUTE BY INDEX:C729($svgObject; $i; $name; $value)
			
			If ($name="xlink:href")
				
				DOM SET XML ATTRIBUTE:C866($svgObject; \
					"xmlns:xlink"; "http://www.w3.org/1999/xlink")
				
				break
				
			End if 
		End for 
	End if 
	
	DOM EXPORT TO VAR:C863($svgObject; $xml)
	
	// Mark:Sometimes the command return a string without the first <
	If (Position:C15("<"; $xml)#1)
		
		$xml:="<"+$xml
		
	End if 
	
End try

return $xml