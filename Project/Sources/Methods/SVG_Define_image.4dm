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
#DECLARE($svgObject : Text; $ID : Text; $image : Picture; $codec : Text) : Text

var $height; $left; $top; $width : Real
var $CURRENT_METHOD; $defs; $encoded; $node; $Txt_rootReference : Text
var $blb : Blob

Compiler_SVG

$CURRENT_METHOD:="SVG_Define_image"

If (Count parameters:C259<3)
	
	ASSERT:C1129(Component_putError(8850; $CURRENT_METHOD))  // Parameters Missing
	
	return 
	
End if 

$codec:=$codec || ".png"

Component_errorHandler("init"; $CURRENT_METHOD)

$defs:=getDefs($svgObject)

If (OK=1)
	
	$node:=DOM Find XML element by ID:C1010($defs; $ID)
	
	If (Bool:C1537(OK))  // Delete the existing image
		
		DOM REMOVE XML ELEMENT:C869($node)
		
	End if 
	
	// Create the image {
	
	If (Picture size:C356($image)>0)
		
		PICTURE PROPERTIES:C457($image; $width; $height)
		
		// Encode in base64
		PICTURE TO BLOB:C692($image; $blb; $codec)
		
		If (Bool:C1537(OK))
			
			BASE64 ENCODE:C895($blb; $encoded)
			SET BLOB SIZE:C606($blb; 0)
			
			$encoded:="data:;base64,"+$encoded
			
		End if 
	End if 
	
	If (Bool:C1537(OK))
		
		// Add the xmlns:link
		DOM SET XML ATTRIBUTE:C866($Txt_rootReference; \
			"xmlns:xlink"; "http://www.w3.org/1999/xlink")
		
		// Put the encoded image
		$node:=DOM Create XML element:C865($defs; "image"; \
			"xlink:href"; $encoded; \
			"x"; $left; \
			"y"; $top; \
			"width"; $width; \
			"height"; $height; \
			"id"; $ID)
		
	End if 
End if 

ASSERT:C1129(Component_errorHandler("deinit"))

If (Bool:C1537(OK))
	
	return $node
	
End if 