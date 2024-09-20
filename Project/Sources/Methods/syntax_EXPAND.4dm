//%attributes = {"invisible":true,"preemptive":"incapable"}
// ----------------------------------------------------
// Project method : syntax_EXPAND
// Database: 4D SVG
// ID[3A7EDAFE4C014393BF97BBD93C908804]
// Created #23-5-2013 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($expand : Boolean)

var $bottom; $height; $l; $left; $right; $top : Integer
var $width; $windowRef : Integer

// NO PARAMETERS REQUIRED
$windowRef:=Current form window:C827

If (Count parameters:C259>=1)
	
	$l:=Num:C11($expand)
	(OBJECT Get pointer:C1124(Object named:K67:5; "collapse_expand"))->:=$l
	
Else 
	
	$l:=(OBJECT Get pointer:C1124(Object named:K67:5; "collapse_expand"))->
	
End if 

If ($l=1)  // Expand
	
	OBJECT GET COORDINATES:C663(*; "help"; $left; $top; $right; $bottom)
	$width:=$right
	
	FORM SET HORIZONTAL RESIZING:C892(True:C214)
	
	WA OPEN URL:C1020(*; "help"; "about:blank")
	
	<>Lon_timerEvent:=10
	SET TIMER:C645(-1)
	
Else   // Collapse
	
	FORM GET PROPERTIES:C674("syntaxPalette"; $width; $height)
	
	FORM SET HORIZONTAL RESIZING:C892(False:C215)
	
End if 

GET WINDOW RECT:C443($left; $top; $right; $bottom; $windowRef)
SET WINDOW RECT:C444($left; $top; $left+$width; $bottom; $windowRef)