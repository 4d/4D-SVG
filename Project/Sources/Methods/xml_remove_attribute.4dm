//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
// Project method : xml_remove_attribute
// ID[B0A9467A327349E18F9561833BE4B74F]
// Created 01/07/11 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
// Remove an attribute without error ( if exist)
// ----------------------------------------------------
#DECLARE($node : Text; $attribute : Text)

var $name; $value : Text
var $i : Integer

For ($i; 1; DOM Count XML attributes:C727($node); 1)
	
	DOM GET XML ATTRIBUTE BY INDEX:C729($node; $i; $name; $value)
	
	If ($name=$attribute)
		
		DOM REMOVE XML ATTRIBUTE:C1084($node; $name)
		
		break
		
	End if 
End for 