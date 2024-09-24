//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_Copy
// Created 16/06/08 by Vincent de Lachaux
// ----------------------------------------------------
// Description
// Create a copy of the svg document
// ----------------------------------------------------
#DECLARE($svgObject : Text) : Text

var $CURRENT_METHOD; $root; $t : Text

Compiler_SVG

$CURRENT_METHOD:="SVG_Copy"

Case of 
		
		//______________________________________________________
	: (Count parameters:C259=0)
		
		ASSERT:C1129(Component_putError(8850; $CURRENT_METHOD))  // Argument missing
		
		//________________________________________
	: (Not:C34(xml_referenceValid($svgObject)))
		
		ASSERT:C1129(Component_putError(8852; $CURRENT_METHOD))  // The reference is not a svg object
		
		//______________________________________________________
	Else 
		
		Component_errorHandler("init"; $CURRENT_METHOD)
		
		//       ___________________
		// / ACI0072296
		// || Date 18/07/11
		// ( ) Vincent de Lachaux
		//       ___________________
		XML SET OPTIONS:C1090($svgObject; XML indentation:K45:34; XML no indentation:K45:36)
		//       ___________________
		
		DOM EXPORT TO VAR:C863($svgObject; $t)
		
		If (Bool:C1537(OK))
			
			$root:=DOM Parse XML variable:C720($t)
			
			If (Bool:C1537(OK))
				
				// Store the reference
				pushReference($root)
				
			End if 
		End if 
		
		ASSERT:C1129(Component_errorHandler("deinit"))
		
		return $root
		
		//______________________________________________________
End case 