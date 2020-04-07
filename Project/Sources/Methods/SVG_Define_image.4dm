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
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)
C_PICTURE:C286($3)
C_TEXT:C284($4)

C_BLOB:C604($Blb_Buffer)
C_LONGINT:C283($Lon_parameters)
C_PICTURE:C286($Pic_image)
C_REAL:C285($Num_height;$Num_left;$Num_top;$Num_width)
C_TEXT:C284($kTxt_currentMethod;$Txt_codec;$Txt_defsID;$Txt_ID;$Txt_image;$Txt_nodeReference)
C_TEXT:C284($Txt_rootReference;$Txt_svgObject)

If (False:C215)
	C_TEXT:C284(SVG_Define_image ;$0)
	C_TEXT:C284(SVG_Define_image ;$1)
	C_TEXT:C284(SVG_Define_image ;$2)
	C_PICTURE:C286(SVG_Define_image ;$3)
	C_TEXT:C284(SVG_Define_image ;$4)
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
	
	Component_errorHandler ("init";$kTxt_currentMethod)
	
	  //Get defs node reference {
	  //First, go back to the main node (<SVG>)...
	$Txt_rootReference:=DOM Get root XML element:C1053($Txt_svgObject)
	
	  //...and find the 'defs' node...
	$Txt_defsID:=DOM Find XML element:C864($Txt_rootReference;"svg/defs")
	
	  //...finally create it if it does not.
	If (OK=0)
		
		$Txt_defsID:=DOM Create XML element:C865($Txt_rootReference;"defs")
		
	End if 
	  //}
	
	If (OK=1)
		
		$Txt_nodeReference:=DOM Find XML element by ID:C1010($Txt_defsID;$Txt_ID)
		
		If (OK=1)  //Delete the existing image
			
			DOM REMOVE XML ELEMENT:C869($Txt_nodeReference)
			
		End if 
		
		  //Create the image {
		If (Picture size:C356($Pic_image)>0)
			
			PICTURE PROPERTIES:C457($Pic_image;$Num_width;$Num_height)
			
			  //Encode in base64
			PICTURE TO BLOB:C692($Pic_image;$Blb_Buffer;$Txt_codec)
			
			If (OK=1)
				
				BASE64 ENCODE:C895($Blb_Buffer;$Txt_image)
				SET BLOB SIZE:C606($Blb_Buffer;0)
				
				$Txt_image:="data:;base64,"+$Txt_image
				
			End if 
		End if 
		
		If (OK=1)
			
			  //Add the xmlns:link
			DOM SET XML ATTRIBUTE:C866($Txt_rootReference;\
				"xmlns:xlink";"http://www.w3.org/1999/xlink")
			
			  //Put the encoded image
			$Txt_nodeReference:=DOM Create XML element:C865($Txt_defsID;"image";\
				"xlink:href";$Txt_image;\
				"x";$Num_left;\
				"y";$Num_top;\
				"width";$Num_width;\
				"height";$Num_height;\
				"id";$Txt_ID)
			
		End if 
		  //}
		
		If (OK=1)
			
			$0:=$Txt_nodeReference
			
		End if 
	End if 
	
	ASSERT:C1129(Component_errorHandler ("deinit"))
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 