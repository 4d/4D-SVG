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
C_TEXT:C284($0)
C_TEXT:C284($1)
C_PICTURE:C286($2)
C_REAL:C285($3)
C_REAL:C285($4)
C_TEXT:C284($5)

C_BLOB:C604($x)
C_BOOLEAN:C305($b)
C_LONGINT:C283($Lon_parameters)
C_PICTURE:C286($Pic_image)
C_REAL:C285($Num_height; $Num_left; $Num_top; $Num_width)
C_TEXT:C284($Dom_node; $Dom_parentReference; $Dom_root; $Txt_currentMethod; $t; $Txt_codec)

If (False:C215)
	C_TEXT:C284(SVG_New_embedded_image; $0)
	C_TEXT:C284(SVG_New_embedded_image; $1)
	C_PICTURE:C286(SVG_New_embedded_image; $2)
	C_REAL:C285(SVG_New_embedded_image; $3)
	C_REAL:C285(SVG_New_embedded_image; $4)
	C_TEXT:C284(SVG_New_embedded_image; $5)
End if 

Compiler_SVG

$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=2; "Missing parameters"))
	
	$Txt_currentMethod:=Current method name:C684
	
	$Dom_parentReference:=$1
	$Pic_image:=$2
	
	If ($Lon_parameters>=3)
		
		If ($3#-1)
			
			$Num_left:=$3  // Default is 0
			
		End if 
		
		If ($4#-1)
			
			$Num_top:=$4  // Default is 0
			
		End if 
		
		If ($Lon_parameters>=5)
			
			$Txt_codec:=$5
			
		End if 
	End if 
	
	If (Length:C16($Txt_codec)=0)
		
		ARRAY TEXT:C222($codecs; 0x0000)
		GET PICTURE FORMATS:C1406($Pic_image; $codecs)
		
		If (Size of array:C274($codecs)>0)
			
			$Txt_codec:=$codecs{1}
			
		Else 
			
			$Txt_codec:=".png"  // Default is .png
			
		End if 
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError(8850; $Txt_currentMethod))  // Parameters Missing
	
End if 

If (Asserted:C1132(xml_referenceValid($Dom_parentReference); Get localized string:C991("error_badReference")))
	
	Component_errorHandler("init"; $Txt_currentMethod)
	
	// #26-3-2015
	// #ACI0088208 - if picture is empty, PICTURE TO BLOB sets OK to 0
	If (Picture size:C356($Pic_image)>0)
		
		PICTURE PROPERTIES:C457($Pic_image; $Num_width; $Num_height)
		
		// Encode in base64 {
		PICTURE TO BLOB:C692($Pic_image; $x; $Txt_codec)
		$b:=Bool:C1537(OK)
		
		If ($b)
			
			// Modified by Vincent de Lachaux (08/07/10)
			// add the v12 optional text parameter
			//_____________________________________________________________________
			//ENCODER BASE64($Blb_Buffer)
			// Si (OK=1)
			//$Txt_image:=BLOB vers texte($Blb_Buffer;UTF8 Texte sans longueur)
			// Fin de si
			BASE64 ENCODE:C895($x; $t)
			$b:=Bool:C1537(OK)
			
			//_____________________________________________________________________
			
			SET BLOB SIZE:C606($x; 0)
			
		End if   //}
	End if 
	
	If ($b)
		
		// Add the xmlns:link
		$Dom_root:=DOM Get root XML element:C1053($Dom_parentReference)
		DOM SET XML ATTRIBUTE:C866($Dom_root; \
			"xmlns:xlink"; "http://www.w3.org/1999/xlink")
		
		$b:=Bool:C1537(OK)
		
		If ($b)
			
			If ($Txt_codec=".svg")
				
				$Txt_codec:="svg+xml"
				
			Else 
				
				$Txt_codec:=Replace string:C233($Txt_codec; "."; "")
				
			End if 
			
			// Put the encoded image
			$Dom_node:=DOM Create XML element:C865($Dom_parentReference; "image"; \
				"xlink:href"; "data:image/"+$Txt_codec+";base64,"+$t; \
				"x"; $Num_left; \
				"y"; $Num_top; \
				"width"; $Num_width; \
				"height"; $Num_height)
			
			$b:=Bool:C1537(OK)
			
		End if 
	End if 
	
	If ($b)
		
		// Set the id
		If (Storage:C1525.svg.options ?? 1)
			
			DOM SET XML ATTRIBUTE:C866($Dom_node; \
				"id"; $Dom_node)
			
		End if 
		
		If (Bool:C1537(OK))
			
			$0:=$Dom_node
			
		End if 
	End if 
	
	ASSERT:C1129(Component_errorHandler("deinit"))
	
Else 
	
	ASSERT:C1129(Component_putError(8852; $Txt_currentMethod))  // The reference is not a svg object
	
End if 