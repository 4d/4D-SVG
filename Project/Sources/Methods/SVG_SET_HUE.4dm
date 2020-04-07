//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Project method : SVG_SET_HUE
  // ID[CAFE7863ACD64617BE94070204834E36]
  // Created 21/06/11 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  // SVG_SET_HUE (svgRef ; hue)
  // Allows to fix the hue of an element
  // svgRef must be a container (svg, g, symbol, pattern,marker, …) or an image. Error if not
  // hue is a longint between 0 & 360
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($1)
C_LONGINT:C283($2)

C_LONGINT:C283($Lon_hue;$Lon_parameters)
C_TEXT:C284($Dom_defs;$Dom_feColorMatrix;$Dom_filter;$Dom_root;$Dom_svgObject;$kTxt_currentMethod)
C_TEXT:C284($Txt_ID;$Txt_name)

If (False:C215)
	C_TEXT:C284(SVG_SET_HUE ;$1)
	C_LONGINT:C283(SVG_SET_HUE ;$2)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_SET_HUE"  //Nom methode courante

If (Asserted:C1132($Lon_parameters>=1;Get localized string:C991("error_missingParameter")))
	
	Compiler_SVG 
	
	$Dom_svgObject:=$1
	
	$Lon_hue:=100
	
	If ($Lon_parameters>=2)
		
		$Lon_hue:=$2
		
	End if 
	
	$Txt_ID:="d4:hueRotate"+String:C10($Lon_hue;"000")
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 

  // ----------------------------------------------------
DOM GET XML ELEMENT NAME:C730($Dom_svgObject;$Txt_name)

ARRAY TEXT:C222($tTxt_objects;0x0000)
COLLECTION TO ARRAY:C1562(Storage:C1525.svg["Containers"];$tTxt_objects)


If ((Find in array:C230($tTxt_objects;$Txt_name)>0)\
 | ($Txt_name="image"))
	
	Component_errorHandler ("init";$kTxt_currentMethod)
	
	  //Is the filter already defined ?
	$Dom_root:=DOM Get root XML element:C1053($Dom_svgObject)
	$Dom_filter:=DOM Find XML element by ID:C1010($Dom_root;$Txt_ID)
	
	If (OK=0)  //Create the filter {
		
		  //find the 'defs' node...
		$Dom_defs:=DOM Find XML element:C864($Dom_root;"svg/defs")
		
		  //...create it if it does not.
		If (OK=0)
			
			$Dom_defs:=DOM Create XML element:C865($Dom_root;"defs")
			
		End if 
		
		If (OK=1)
			
			$Dom_filter:=DOM Create XML element:C865($Dom_defs;"filter";\
				"id";$Txt_ID;\
				"filterUnits";"objectBoundingBox";\
				"x";"0%";\
				"y";"0%";\
				"width";"100%";\
				"height";"100%")
			
			If (OK=1)
				
				$Dom_feColorMatrix:=DOM Create XML element:C865($Dom_filter;"feColorMatrix";\
					"type";"hueRotate";\
					"in";"SourceGraphic";\
					"values";$Lon_hue)
				
			End if 
		End if 
	End if   //}
	
	If (OK=1)
		
		DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
			"filter";"url(#"+$Txt_ID+")")
		
	End if 
	
	ASSERT:C1129(Component_errorHandler ("deinit"))
	
Else 
	
	ASSERT:C1129(Component_putError (8854))  //Impossible to apply this Command for this Node
	
End if 

  //#ACI0091143
CLEAR VARIABLE:C89($tTxt_objects)

  // ----------------------------------------------------
  // End