//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_SET_PATTERN_UNITS
// Created 07/04/10 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($svgObject : Text; $patternUnit : Text)

var $CURRENT_METHOD; $name : Text

Compiler_SVG

$CURRENT_METHOD:="SVG_SET_PATTERN_UNITS"

If (Count parameters:C259<2)
	
	ASSERT:C1129(Component_putError(8850; $CURRENT_METHOD))  // Parameters Missing
	
	return 
	
End if 

If (Asserted:C1132(xml_referenceValid($svgObject); Localized string:C991("error_badReference")))
	
	Component_errorHandler("init"; $CURRENT_METHOD)
	
	DOM GET XML ELEMENT NAME:C730($svgObject; $name)
	
	If ($name="pattern")
		
		ARRAY TEXT:C222($_patternUnits; 0x0000)
		COLLECTION TO ARRAY:C1562(Storage:C1525.svg["patternUnits"]; $_patternUnits)
		
		If (Find in array:C230($_patternUnits; $patternUnit)>0)
			
			DOM SET XML ATTRIBUTE:C866($svgObject; \
				"patternUnits"; $patternUnit)
			
		Else 
			
			ASSERT:C1129(Component_putError(8853; $CURRENT_METHOD))  // Invalid Value for an Attribute
			
		End if 
		
		// #ACI0091143
		CLEAR VARIABLE:C89($_patternUnits)
		
	Else 
		
		ASSERT:C1129(Component_putError(8854))  // Impossible to apply this Command for this Node
		
	End if 
	
	ASSERT:C1129(Component_errorHandler("deinit"))
	
Else 
	
	ASSERT:C1129(Component_putError(8852; $CURRENT_METHOD))  // The reference is not a svg object
	
End if 