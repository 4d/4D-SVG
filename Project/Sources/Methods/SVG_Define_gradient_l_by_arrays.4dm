//%attributes = {"invisible":true,"preemptive":"capable"}
//-----------------------------------------------------------------------------------------------------
// Date et heure : 16/02/07, 10:07:53
// Framework SVgg
// Author : Gérald Czwiklinski
//-----------------------------------------------------------------------------------------------------
#DECLARE($svgObject : Text; $id : Text; $x1 : Integer; $y1 : Integer; $x2 : Integer; $y2 : Integer;  ...  : Text)

var $color; $colorName; $CURRENT_METHOD; $defs; $node; $stop : Text
var $countParamaters; $i; $offset; $opacity; $pos; $step : Integer

Compiler_SVG

$CURRENT_METHOD:="SVG_Define_gradient_l_by_arrays"
$countParamaters:=Count parameters:C259

If ($countParamaters<6)
	
	ASSERT:C1129(Component_putError(8850; $CURRENT_METHOD))  // Parameters Missing
	
	return 
	
End if 

Component_errorHandler("init"; $CURRENT_METHOD)

$defs:=getDefs($svgObject)

If (Bool:C1537(OK))
	
	$node:=DOM Find XML element by ID:C1010($defs; $id)
	
	If (Bool:C1537(OK))  // Delete the existing gradient
		
		DOM REMOVE XML ELEMENT:C869($node)
		
	End if 
	
	// Create the gradient
	$node:=DOM Create XML element:C865($defs; "linearGradient"; \
		"id"; $id; \
		"gradientUnits"; "userSpaceOnUse")
	
	DOM SET XML ATTRIBUTE:C866($node; \
		"x1"; $x1; \
		"y1"; $y1; \
		"x2"; $x2; \
		"y2"; $y2)
	
End if 

$step:=100\($countParamaters-7)

For ($i; 7; $countParamaters; 1)
	
	$color:=${$i}
	$opacity:=-1
	
	$pos:=Position:C15(":"; $color)
	
	If ($pos>0)
		
		$opacity:=Num:C11(Substring:C12($color; $pos+1))
		$color:=Lowercase:C14(Substring:C12($color; 1; $pos-1))
		
	End if 
	
	If (Length:C16($color)>0)
		
		If ($colorName#"url(@")
			
			$colorName:=Lowercase:C14($colorName)
			
		End if 
		
		$stop:=DOM Create XML element:C865($node; "stop"; \
			"offset"; String:C10($offset)+"%"; \
			"stop-color"; $color)
		
		If (Bool:C1537(OK)) && ($opacity#-1)
			
			DOM SET XML ATTRIBUTE:C866($stop; \
				"stop-opacity"; $opacity)
			
		End if 
	End if 
	
	If (Bool:C1537(OK))
		
		$offset+=$step
		
	Else 
		
		break
		
	End if 
End for 

ASSERT:C1129(Component_errorHandler("deinit"))