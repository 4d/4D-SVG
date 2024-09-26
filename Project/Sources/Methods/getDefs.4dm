//%attributes = {"invisible":true,"preemptive":"capable"}
#DECLARE($svgObject : Text) : Text

// Get defs node reference

// First, go back to the main node (<SVG>)...
var $root : Text:=DOM Get root XML element:C1053($svgObject)

// ...and find the 'defs' node...
var $node : Text:=DOM Find XML element:C864($root; "svg/defs")

// ...finally create it if it does not.
If (OK=0)
	
	$node:=DOM Create XML element:C865($root; "defs"; "ID"; "4D")
	
End if 

return $node