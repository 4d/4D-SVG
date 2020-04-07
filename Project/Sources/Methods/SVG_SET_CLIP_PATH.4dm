//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_CLIP_PATH
  // Created 04/09/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // http://www.w3.org/TR/2001/REC-SVG-20010904/masking.html#EstablishingANewClippingPath
  // ----------------------------------------------------
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_root;$Dom_rootReference;$kTxt_currentMethod;$Txt_Buffer;$Txt_ID)

If (False:C215)
	C_TEXT:C284(SVG_SET_CLIP_PATH ;$1)
	C_TEXT:C284(SVG_SET_CLIP_PATH ;$2)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Dom_root:=$1
	$Txt_ID:=$2
	
	Component_errorHandler ("init";$kTxt_currentMethod)
	
	$Dom_rootReference:=DOM Get root XML element:C1053($Dom_root)
	
	If (OK=1)
		
		  //Add the xmlns:link
		DOM SET XML ATTRIBUTE:C866($Dom_rootReference;\
			"xmlns:xlink";"http://www.w3.org/1999/xlink")
		
		$Txt_Buffer:=DOM Find XML element by ID:C1010($Dom_rootReference;$Txt_ID)
		
		If (OK=1)
			
			DOM SET XML ATTRIBUTE:C866($Dom_root;\
				"clip-path";"url(#"+$Txt_ID+")")
			
		Else 
			
			ASSERT:C1129(Component_putError (8855))  //8855 = The ID passed was not found
			
		End if 
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
	ASSERT:C1129(Component_errorHandler ("deinit"))
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 