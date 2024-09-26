//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_Define_filter
// Created 10/07/08 by Vincent de Lachaux
// ----------------------------------------------------
// Description
// Declare a new filter in the defs node
// ----------------------------------------------------
#DECLARE($svgObject : Text; $ID : Text; $x : Real; $y : Real; $width : Real; $height : Real; $units : Text; $primitiveUnits : Text) : Text

var $CURRENT_METHOD; $defs; $node : Text

Compiler_SVG

$CURRENT_METHOD:="SVG_Define_filter"

If (Count parameters:C259<5)
	
	$width:=-1
	
	If (Count parameters:C259<3)
		
		$x:=-1
		
		If (Count parameters:C259<2)
			
			ASSERT:C1129(Component_putError(8850; $CURRENT_METHOD))  // Parameters Missing
			
			return 
			
		End if 
	End if 
End if 

Component_errorHandler("init"; $CURRENT_METHOD)

$defs:=getDefs($svgObject)

If (Bool:C1537(OK))
	
	$node:=DOM Find XML element by ID:C1010($defs; $ID)
	
	If (Bool:C1537(OK))  // Delete the existing color
		
		DOM REMOVE XML ELEMENT:C869($node)
		
	End if 
	
	// Mark:-Create the filter
	$node:=DOM Create XML element:C865($defs; "filter"; \
		"id"; $ID)
	
	// X,y
	If (Bool:C1537(OK))\
		 && ($x#-1)
		
		DOM SET XML ATTRIBUTE:C866($node; \
			"x"; $x; \
			"y"; $y)
		
	End if 
	
	// Mark:-Width, height
	If (Bool:C1537(OK))\
		 && ($width#-1)
		
		DOM SET XML ATTRIBUTE:C866($node; \
			"width"; $width; \
			"height"; $height)
		
	End if 
	
	// Mark:-FilterUnits
	If (Bool:C1537(OK))\
		 && (Length:C16($units)>0)
		
		If (Position:C15($units+"|"; "userSpaceOnUse|objectBoundingBox|")>0)
			
			DOM SET XML ATTRIBUTE:C866($node; \
				"filterUnits"; $units)
			
		Else 
			
			ASSERT:C1129(Component_putError(8853))  // 8853 = Invalid Value for an Attribute
			
		End if 
	End if 
	
	// Mark:-PrimitiveUnits
	If (Bool:C1537(OK))\
		 && (Length:C16($primitiveUnits)>0)
		
		If (Position:C15($primitiveUnits+"|"; "userSpaceOnUse|objectBoundingBox|")>0)
			
			DOM SET XML ATTRIBUTE:C866($node; \
				"primitiveUnits"; $primitiveUnits)
			
		Else 
			
			ASSERT:C1129(Component_putError(8853))  // 8853 = Invalid Value for an Attribute
			
		End if 
	End if 
End if 

ASSERT:C1129(Component_errorHandler("deinit"))

If (Bool:C1537(OK))
	
	return $node
	
End if 