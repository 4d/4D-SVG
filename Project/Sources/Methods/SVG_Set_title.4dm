//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_Set_title
// Created 21/07/08 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($svgObject : Text; $value : Text) : Text

var $CURRENT_METHOD; $name; $node : Text

Compiler_SVG

$CURRENT_METHOD:="SVG_Set_title"

If (Count parameters:C259<2)
	
	ASSERT:C1129(Component_putError(8850; $CURRENT_METHOD))  // Parameters Missing
	
	return 
	
End if 

If (Asserted:C1132(xml_referenceValid($svgObject); Localized string:C991("error_badReference")))
	
	Component_errorHandler("init"; $CURRENT_METHOD)
	
	DOM GET XML ELEMENT NAME:C730($svgObject; $name)
	
	ARRAY TEXT:C222($_objects; 0x0000)
	COLLECTION TO ARRAY:C1562(Storage:C1525.svg["Containers_or_Graphics"]; $_objects)
	
	If (Find in array:C230($_objects; $name)>0)
		
		$node:=DOM Create XML element:C865($svgObject; "title")
		
		If (Bool:C1537(OK))
			
			DOM SET XML ELEMENT VALUE:C868($node; $value)
			
			If (Bool:C1537(OK))
				
				// Set the id
				If (Storage:C1525.svg.options ?? 1)
					
					DOM SET XML ATTRIBUTE:C866($node; \
						"id"; $node)
					
				End if 
			End if 
		End if 
		
	Else 
		
		ASSERT:C1129(Component_putError(8854))  // Impossible to apply this Command for this Node
		
	End if 
	
	// #ACI0091143
	CLEAR VARIABLE:C89($_objects)
	
	ASSERT:C1129(Component_errorHandler("deinit"))
	
	If (Bool:C1537(OK))
		
		return $node
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError(8852; $CURRENT_METHOD))  // The reference is not a svg object
	
End if 