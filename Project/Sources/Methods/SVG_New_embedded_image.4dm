//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_New_embedded_image
// Created 29/08/08 by Vincent de Lachaux
// ----------------------------------------------------
// Description
// Place pcture in base64
// ----------------------------------------------------
// Modified by Vincent de Lachaux (05/07/10)
// v12 : picture variables are automatically BASE64 encoded
// ----------------------------------------------------
#DECLARE($parent : Text; $image : Picture; $left : Real; $top : Real; $codec : Text) : Text

If (False:C215)
	C_TEXT:C284(SVG_New_embedded_image; $1)
	C_PICTURE:C286(SVG_New_embedded_image; $2)
	C_REAL:C285(SVG_New_embedded_image; $3)
	C_REAL:C285(SVG_New_embedded_image; $4)
	C_TEXT:C284(SVG_New_embedded_image; $5)
	C_TEXT:C284(SVG_New_embedded_image; $0)
End if 

var $height; $width : Real
var $encoded; $node; $t : Text
var $success : Boolean
var $index : Integer
var $x : Blob

Compiler_SVG

If (Count parameters:C259>=2)
	
	$left:=$left=-1 ? 0 : $left
	$top:=$top=-1 ? 0 : $top
	
	If (Length:C16($codec)=0)
		
		ARRAY TEXT:C222($codecs; 0x0000)
		GET PICTURE FORMATS:C1406($image; $codecs)
		
		If (Size of array:C274($codecs)>0)
			
			$codec:=$codecs{1}
			
			For each ($t; New collection:C1472(\
				".heic"; \
				".svg"; \
				".png"; \
				".jpeg"; \
				".tiff"; \
				".gif"; \
				".bmp"; \
				".pdf"; \
				".emf"; \
				".4DMemoryBitmap"))
				
				$index:=Find in array:C230($codecs; $t)
				
				If ($index>0)
					
					$codec:=$codecs{$index}
					break
					
				End if 
			End for each 
			
			Case of 
					
					//…………………………………………………………………………………
				: (Length:C16($codec)=0)
					
					$codec:=".png"
					
					//…………………………………………………………………………………
				: ($codec=".4DMetaPict") | ($codec=".dng")
					
					CONVERT PICTURE:C1002($image; ".png")
					TRANSFORM PICTURE:C988($image; Transparency:K61:11; 0x00FFFFFF)
					$codec:=".png"
					
					//…………………………………………………………………………………
			End case 
			
		Else 
			$codec:=".png"  // Default is .png
			
		End if 
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError(8850; Current method name:C684))  // Parameters Missing
	return 
	
End if 

If (Asserted:C1132(xml_referenceValid($parent); Localized string:C991("error_badReference")))
	
	Component_errorHandler("init"; Current method name:C684)
	
	// #26-3-2015
	// #ACI0088208 - if picture is empty, PICTURE TO BLOB sets OK to 0
	If (Picture size:C356($image)>0)
		
		PICTURE PROPERTIES:C457($image; $width; $height)
		
		// Encode in base64
		PICTURE TO BLOB:C692($image; $x; $codec)
		$success:=Bool:C1537(OK)
		
		If ($success)
			
			// Modified by Vincent de Lachaux (08/07/10)
			// Use the v12+ optional text parameter
			BASE64 ENCODE:C895($x; $encoded)
			$success:=Bool:C1537(OK)
			SET BLOB SIZE:C606($x; 0)
			
		End if 
		
	Else 
		
		$success:=True:C214  // Yes, we return an image node reference even if the image is empty (#ACI0103090)
		
	End if 
	
	If ($success)
		
		// Add the xmlns:link
		DOM SET XML ATTRIBUTE:C866(DOM Get root XML element:C1053($parent); \
			"xmlns:xlink"; "http://www.w3.org/1999/xlink")
		
		$success:=Bool:C1537(OK)
		
		If ($success)
			
			$codec:=$codec=".svg" ? "svg+xml" : Replace string:C233($codec; "."; "")
			
			// Put the encoded image
			$node:=DOM Create XML element:C865($parent; "image"; \
				"xlink:href"; "data:image/"+$codec+";base64,"+$encoded; \
				"x"; $left; \
				"y"; $top; \
				"width"; $width; \
				"height"; $height)
			
			$success:=Bool:C1537(OK)
			
		End if 
	End if 
	
	If ($success)
		
		// Set the id
		If (Storage:C1525.svg.options ?? 1)
			
			DOM SET XML ATTRIBUTE:C866($node; \
				"id"; $node)
			
		End if 
		
		If (Bool:C1537(OK))
			
			return $node
			
		End if 
	End if 
	
	ASSERT:C1129(Component_errorHandler("deinit"))
	
Else 
	
	ASSERT:C1129(Component_putError(8852; Current method name:C684))  // The reference is not a svg object
	
End if 