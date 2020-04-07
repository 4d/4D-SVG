//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Define_clip_Path
  // Created 08/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // http://www.w3.org/TR/2001/REC-SVG-20010904/masking.html#EstablishingANewClippingPath
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_clipPath;$Dom_defs;$Dom_root;$kTxt_currentMethod;$Txt_ID;$Txt_svgObject)

If (False:C215)
	C_TEXT:C284(SVG_Define_clip_Path ;$0)
	C_TEXT:C284(SVG_Define_clip_Path ;$1)
	C_TEXT:C284(SVG_Define_clip_Path ;$2)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_Define_clip_Path"  //Nom methode courante

If ($Lon_parameters>=2)
	
	$Txt_svgObject:=$1
	$Txt_ID:=$2
	
	Component_errorHandler ("init";$kTxt_currentMethod)
	
	$Dom_root:=DOM Get root XML element:C1053($Txt_svgObject)
	$Dom_clipPath:=DOM Find XML element by ID:C1010($Dom_root;$Txt_ID)
	
	If (OK=1)
		
		ASSERT:C1129(Component_putError (8859;$kTxt_currentMethod))  //Duplicate ID
		
	Else 
		
		  //Get the defs element {
		$Dom_defs:=DOM Find XML element:C864($Dom_root;"svg/defs")
		
		If (OK=0)
			
			$Dom_defs:=DOM Create XML element:C865($Dom_root;"defs")
			
		End if 
		  //}
		
		  //Create the clipPath
		$Dom_clipPath:=DOM Create XML element:C865($Dom_defs;"clipPath";\
			"id";$Txt_ID)
		
	End if 
	
	$0:=$Dom_clipPath*Num:C11(OK=1)
	
	ASSERT:C1129(Component_errorHandler ("deinit"))
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 