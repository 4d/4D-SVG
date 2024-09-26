//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_Define_shadow
// Created 03/10/08 by Vincent de Lachaux
// ----------------------------------------------------
// Description
// <filter filterUnits="userSpaceOnUse" height="120" id="MonFiltre" width="200" x="0" y="0">
//      <feGaussianBlur in="SourceAlpha" result="flou" stdDeviation="4"/>
//      <feOffset dx="4" dy="4" in="flou" result="flouDecalage"/>
//      <feBlend in="SourceGraphic" in2="flouDecalage" mode="normal"/>
// </filter>
// ----------------------------------------------------
#DECLARE($svgObject : Text; $ID : Text; $stdDeviation : Integer; $dx : Integer; $dy : Integer) : Text

var $CURRENT_METHOD; $defs; $filter; $node : Text

Compiler_SVG

$CURRENT_METHOD:=Current method name:C684

If (Count parameters:C259<2)
	
	ASSERT:C1129(Component_putError(8850; $CURRENT_METHOD))  // Parameters Missing
	
	return 
	
End if 

$stdDeviation:=Count parameters:C259>=3 ? $stdDeviation : 4

$dx:=Count parameters:C259>=4 ? $dx : 4
$dy:=Count parameters:C259>=5 ? $dy : 4

Component_errorHandler("init"; $CURRENT_METHOD)

$defs:=getDefs($svgObject)

If (Bool:C1537(OK))
	
	// Delete the existing color if any
	$filter:=DOM Find XML element by ID:C1010($defs; $ID)
	
	If (Bool:C1537(OK))
		
		DOM REMOVE XML ELEMENT:C869($filter)
		
	End if 
	
	// Create the filter
	$filter:=DOM Create XML element:C865($defs; "filter"; \
		"id"; $ID)
	
	Try
		
		$node:=DOM Create XML element:C865($filter; "feGaussianBlur"; \
			"stdDeviation"; $stdDeviation; \
			"in"; "SourceAlpha"; \
			"result"; "_Blur")
		
		$node:=DOM Create XML element:C865($filter; "feOffset"; \
			"dx"; $dx; \
			"dy"; $dy; \
			"in"; "_Blur"; \
			"result"; "_Offset")
		
		$node:=DOM Create XML element:C865($filter; "feBlend"; \
			"in"; "SourceGraphic"; \
			"in2"; "_Offset"; \
			"mode"; "normal")
		
	End try
	
End if 

ASSERT:C1129(Component_errorHandler("deinit"))

If (Bool:C1537(OK))
	
	return $filter
	
End if 