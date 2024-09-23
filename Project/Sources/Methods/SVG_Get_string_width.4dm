//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_Get_string_width
// Created 22/07/08 by Vincent de Lachaux
// ----------------------------------------------------
// Description
// Returns the width of the parameter text, based on the font information.
// ----------------------------------------------------
// SVG_Get_string_width (text; font; size; style) -> width
//
// Parameter               Type                        Description
// Text                         Text              ->        A text value
// Font                          Alpha         ->        The font that will be used to display the text.
// Size                          Integer         ->        The size of the font.
// Style                         Integer         ->      The font style.
// Result                        Real         ->      The width of the text value
//
// 4D constants may be used for the style parameter. See the 4D documentation for details.
// ----------------------------------------------------
#DECLARE($string : Text; $fontName : Text; $fontSize : Integer; $fontStyles : Integer) : Real

var $width : Real
var $node; $root : Text
var $image : Picture
var $height; $Unused : Integer

$root:=DOM Create XML Ref:C861("svg"; "http://www.w3.org/2000/svg")

If (Bool:C1537(OK))
	
	$node:=DOM Create XML element:C865($root; "text")
	
	DOM SET XML ATTRIBUTE:C866($node; \
		"font-family"; $fontName; \
		"font-size"; $fontSize)
	
	If ($fontStyles#0)
		
		setFontStyles($node; $fontStyles)
		
	End if 
	
	// Invisible characters are not treated properly
	
	// So they were replaced
	$string:=Replace string:C233($string; "  "; "==")
	$string:=Replace string:C233($string; "\t"; "====")
	
	DOM SET XML ELEMENT VALUE:C868($node; $string)
	
	SVG EXPORT TO PICTURE:C1017($root; $image)
	DOM CLOSE XML:C722($root)
	
	PICTURE PROPERTIES:C457($image; $width; $height; $Unused; $Unused; $Unused)
	$image:=$image*0
	
	return $width
	
End if 