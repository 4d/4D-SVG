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
_O_C_TEXT:C284($0)
_O_C_TEXT:C284($1)
_O_C_TEXT:C284($2)
_O_C_PICTURE:C286($3)
_O_C_TEXT:C284($4)

_O_C_BLOB:C604($Blb_Buffer)
_O_C_LONGINT:C283($Lon_parameters)
_O_C_PICTURE:C286($Pic_image)
_O_C_REAL:C285($Num_height; $Num_left; $Num_top; $Num_width)
_O_C_TEXT:C284($kTxt_currentMethod; $Txt_codec; $Txt_defsID; $Txt_ID; $Txt_image; $Txt_nodeReference)
_O_C_TEXT:C284($Txt_rootReference; $Txt_svgObject)

If (False:C215)
	_O_C_TEXT:C284(SVG_Define_image; $0)
	_O_C_TEXT:C284(SVG_Define_image; $1)
	_O_C_TEXT:C284(SVG_Define_image; $2)
	_O_C_PICTURE:C286(SVG_Define_image; $3)
	_O_C_TEXT:C284(SVG_Define_image; $4)
End if 

Compiler_SVG

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=3)
	
	$Txt_svgObject:=$1
	$Txt_ID:=$2
	$Pic_image:=$3
	
	$Txt_codec:=".png"
	
	If ($Lon_parameters>=4)
		
		$Txt_codec:=$4  //default is .png
		
	End if 
	
	Component_errorHandler("init"; $kTxt_currentMethod)
	
	$Txt_defsID:=getDefs($Txt_svgObject)
	
	If (OK=1)
		
		$Txt_nodeReference:=DOM Find XML element by ID:C1010($Txt_defsID; $Txt_ID)
		
		If (OK=1)  //Delete the existing image
			
			DOM REMOVE XML ELEMENT:C869($Txt_nodeReference)
			
		End if 
		
		//Create the image {
		If (Picture size:C356($Pic_image)>0)
			
			PICTURE PROPERTIES:C457($Pic_image; $Num_width; $Num_height)
			
			//Encode in base64
			PICTURE TO BLOB:C692($Pic_image; $Blb_Buffer; $Txt_codec)
			
			If (OK=1)
				
				BASE64 ENCODE:C895($Blb_Buffer; $Txt_image)
				SET BLOB SIZE:C606($Blb_Buffer; 0)
				
				$Txt_image:="data:;base64,"+$Txt_image
				
			End if 
		End if 
		
		If (OK=1)
			
			//Add the xmlns:link
			DOM SET XML ATTRIBUTE:C866($Txt_rootReference; \
				"xmlns:xlink"; "http://www.w3.org/1999/xlink")
			
			//Put the encoded image
			$Txt_nodeReference:=DOM Create XML element:C865($Txt_defsID; "image"; \
				"xlink:href"; $Txt_image; \
				"x"; $Num_left; \
				"y"; $Num_top; \
				"width"; $Num_width; \
				"height"; $Num_height; \
				"id"; $Txt_ID)
			
		End if 
		//}
		
		If (OK=1)
			
			$0:=$Txt_nodeReference
			
		End if 
	End if 
	
	ASSERT:C1129(Component_errorHandler("deinit"))
	
Else 
	
	ASSERT:C1129(Component_putError(8850; $kTxt_currentMethod))  //Parameters Missing
	
End if 