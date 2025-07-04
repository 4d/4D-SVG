//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_SET_TEXT_ANCHOR
// Created 10/07/08 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($dom : Text; $alignment : Integer)

Compiler_SVG

Component_errorHandler("init"; "SVG_SET_TEXT_ANCHOR")

Case of 
		
		// ______________________________________________________
	: (Not:C34(xml_referenceValid($dom)))  // The reference is not a svg object
		
		ASSERT:C1129(Component_putError(8852; "SVG_SET_TEXT_ANCHOR"))
		
		return 
		
		// ______________________________________________________
	: (Count parameters:C259<2)
		
		// ASSERT(Component_putError(8850; "SVG_SET_TEXT_ANCHOR"))// Parameters Missing
		// Return
		
		$alignment:=Align default:K42:1  // Default value
		
		// ______________________________________________________
End case 

var $name : Text
DOM GET XML ELEMENT NAME:C730($dom; $name)

ARRAY TEXT:C222($_objects; 0x0000)
COLLECTION TO ARRAY:C1562(Storage:C1525.svg["text content element"]; $_objects)

If (Find in array:C230($_objects; $name)>0)
	
	var $isTextArea:=$name="textArea"
	
	$name:=$isTextArea ? "text-align" : "text-anchor"
	
	Case of 
			
			// .....................................................
		: ($alignment=Align center:K42:3)
			
			var $value:=$isTextArea ? "center" : "middle"
			
			// .....................................................
		: ($alignment=Align right:K42:4)
			
			$value:="end"
			
			// .....................................................
		: ($alignment=Align left:K42:2)\
			 || ($alignment=Align default:K42:1)
			
			$value:="start"
			
			// .....................................................
		: ($alignment=wk justify:K81:100)\
			 && $isTextArea  // Justify is only available for Text Area
			
			$value:="justify"
			
			// .....................................................
		Else 
			
			$value:="inherit"
			
			// .....................................................
	End case 
	
	DOM SET XML ATTRIBUTE:C866($dom; $name; $value)
	
	ASSERT:C1129(Component_errorHandler("deinit"))
	
Else 
	
	ASSERT:C1129(Component_putError(8854))  // Impossible to apply this Command for this element
	
End if 

// MARK: ACI0091143
CLEAR VARIABLE:C89($_objects)