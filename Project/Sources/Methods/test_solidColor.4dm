//%attributes = {}
var $svg; $node; $color : Text
var $opacity : Integer
var $expected; $actual : Real

$svg:=SVG_New

For each ($opacity; [1; 50; 75; 100])
	
	$expected:=$opacity/100
	
	$node:=SVG_Define_solidColor($svg; "explicit"; "blue"; $opacity)
	DOM GET XML ATTRIBUTE BY NAME:C728($node; "solid-opacity"; $actual)
	ASSERT:C1129((OK=1) && ($actual=$expected); "ACI0106628: explicit opacity")
	
	$color:="blue:"+String:C10($opacity)
	$node:=SVG_Define_solidColor($svg; "inline"; $color)
	DOM GET XML ATTRIBUTE BY NAME:C728($node; "solid-opacity"; $actual)
	ASSERT:C1129((OK=1) && ($actual=$expected); "ACI0106628: inline opacity")
	
	$node:=SVG_Define_solidColor($svg; "override"; $color; 25)
	DOM GET XML ATTRIBUTE BY NAME:C728($node; "solid-opacity"; $actual)
	ASSERT:C1129((OK=1) && ($actual=$expected); "ACI0106628: inline opacity overrides parameter")
	
End for each 

SVG_CLEAR($svg)
