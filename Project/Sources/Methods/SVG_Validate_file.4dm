//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_Validate_file
// Created 17/07/08 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($pathname : Text) : Boolean

var $CURRENT_METHOD; $root; $t : Text
var $isSVG : Boolean

Compiler_SVG

$CURRENT_METHOD:="SVG_Validate_file"

If (Count parameters:C259=0)
	
	ASSERT:C1129(Component_putError(8850; $CURRENT_METHOD))  // Parameters Missing
	
	return 
	
End if 

If (Test path name:C476($pathname)#Is a document:K24:1)
	
	ASSERT:C1129(Component_putError(-43; $CURRENT_METHOD))  // Parameters Missing
	
	return 
	
End if 

Component_errorHandler("init"; $CURRENT_METHOD)

$root:=DOM Parse XML source:C719($pathname; True:C214)

If (Bool:C1537(OK))
	
	DOM GET XML ELEMENT NAME:C730(DOM Get root XML element:C1053($root); $t)
	DOM CLOSE XML:C722($root)
	
	$isSVG:=($t="svg")
	
End if 

ASSERT:C1129(Component_errorHandler("deinit"))

return $isSVG  // True if the file is a svg