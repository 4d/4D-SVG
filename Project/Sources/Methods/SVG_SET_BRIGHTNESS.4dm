//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Project method : SVG_SET_BRIGHTNESS
  // Database: 4D SVG
  // ID[816F66B1523F4B329109B9548685B72B]
  // Created 13-2-2013 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  // Set the brightness of an image or a container
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($1)
C_REAL:C285(${2})

C_LONGINT:C283($Lon_parameters)
C_REAL:C285($Num_brightness)
C_TEXT:C284($Dom_defs;$Dom_feColorMatrix;$Dom_filter;$Dom_root;$Dom_svgObject;$kTxt_currentMethod)
C_TEXT:C284($Txt_ID;$Txt_matrix;$Txt_name)

If (False:C215)
	C_TEXT:C284(SVG_SET_BRIGHTNESS ;$1)
	C_REAL:C285(SVG_SET_BRIGHTNESS ;${2})
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_SET_BRIGHTNESS"  //Nom methode courante

If (Asserted:C1132($Lon_parameters>=2;Get localized string:C991("error_missingParameter")))
	
	Compiler_SVG 
	
	$Dom_svgObject:=$1
	$Num_brightness:=$2
	
	$Txt_matrix:=\
		"{%} 0 0 0 0 "+\
		"0 {%} 0 0 0 "+\
		"0 0 {%} 0 0 "+\
		"0 0 0 1 0"
	
	If ($Lon_parameters>=4)
		
		$Txt_ID:="d4:rvb"+String:C10($Num_brightness;"&xml")+"-"+String:C10($3;"&xml")+"-"+String:C10($4;"&xml")
		$Txt_matrix:=Replace string:C233($Txt_matrix;"{%}";String:C10($Num_brightness;"&xml");1)
		$Txt_matrix:=Replace string:C233($Txt_matrix;"{%}";String:C10($3;"&xml");1)
		$Txt_matrix:=Replace string:C233($Txt_matrix;"{%}";String:C10($4;"&xml");1)
		
	Else 
		
		$Txt_ID:="d4:brightness"+String:C10($Num_brightness;"&xml")
		$Txt_matrix:=Replace string:C233($Txt_matrix;"{%}";String:C10($Num_brightness;"&xml"))
		
	End if 
	
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
					"type";"matrix";\
					"in";"SourceGraphic";\
					"values";$Txt_matrix)
				
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