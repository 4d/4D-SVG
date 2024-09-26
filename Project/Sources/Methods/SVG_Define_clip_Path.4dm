//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_Define_clip_Path
// Created 08/07/08 by Vincent de Lachaux
// ----------------------------------------------------
// Description
// Http://www.w3.org/TR/2001/REC-SVG-20010904/masking.html#EstablishingANewClippingPath
// ----------------------------------------------------
#DECLARE($svgObject : Text; $ID : Text) : Text

var $clipPath; $CURRENT_METHOD; $defs; $root : Text

Compiler_SVG

$CURRENT_METHOD:="SVG_Define_clip_Path"

If (Count parameters:C259>=2)
	
	Component_errorHandler("init"; $CURRENT_METHOD)
	
	$root:=DOM Get root XML element:C1053($svgObject)
	$clipPath:=DOM Find XML element by ID:C1010($root; $ID)
	
	If (Bool:C1537(OK))
		
		ASSERT:C1129(Component_putError(8859; $CURRENT_METHOD))  // Duplicate ID
		
	Else 
		
		// Get the defs element
		$defs:=DOM Find XML element:C864($root; "svg/defs")
		
		If (OK=0)
			
			$defs:=DOM Create XML element:C865($root; "defs")
			
		End if 
		
		// Create the clipPath
		$clipPath:=DOM Create XML element:C865($defs; "clipPath"; \
			"id"; $ID)
		
		$clipPath:=$clipPath*Num:C11(OK=1)
		
	End if 
	
	ASSERT:C1129(Component_errorHandler("deinit"))
	
	return $clipPath
	
Else 
	
	ASSERT:C1129(Component_putError(8850; $CURRENT_METHOD))  // Parameters Missing
	
End if 