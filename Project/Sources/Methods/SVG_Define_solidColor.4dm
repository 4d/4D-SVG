//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_Define_solidColor
// Created 16/03/06
// Framework SVgg
// Author : Gérald Czwiklinski
// ----------------------------------------------------
// Define a color and keep tyhe definition for a later uasge by url
// ----------------------------------------------------
// Modified by Vincent de Lachaux (16/06/08)
// 2004 -> v11
// ----------------------------------------------------
#DECLARE($svgObject : Text; $ID : Text; $color : Text; $opacity : Real) : Text

var $CURRENT_METHOD; $defs; $node : Text
var $pos : Integer

$opacity:=$opacity#0 ? $opacity/100 : 0

Compiler_SVG

$CURRENT_METHOD:="SVG_Define_solidColor"

If (Count parameters:C259<3)
	
	ASSERT:C1129(Component_putError(8850; $CURRENT_METHOD))  // Parameters Missing
	
	return 
	
End if 

Component_errorHandler("init"; $CURRENT_METHOD)

$defs:=getDefs($svgObject)

If (Bool:C1537(OK))
	
	$node:=DOM Find XML element by ID:C1010($defs; $ID)
	
	If (OK=1)  // Delete the existing color
		
		DOM REMOVE XML ELEMENT:C869($node)
		
	End if 
	
	// Create the color
	$node:=DOM Create XML element:C865($defs; "solidColor"; \
		"id"; $ID)
	
	If (Bool:C1537(OK))
		
		$pos:=Position:C15(":"; $color)
		
		If ($pos>0)
			
			$opacity:=Num:C11(Substring:C12($color; $pos+1))/100
			$color:=Substring:C12($color; 1; $pos-1)
			
		End if 
		
		If ($color#"url(@")
			
			$color:=Lowercase:C14($color)
			
		End if 
		
		DOM SET XML ATTRIBUTE:C866($node; \
			"solid-color"; $color)
		
		If (Bool:C1537(OK))\
			 && ($opacity#0)
			
			DOM SET XML ATTRIBUTE:C866($node; \
				"solid-opacity"; $opacity)
			
		End if 
	End if 
End if 

ASSERT:C1129(Component_errorHandler("deinit"))

return $node