//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Project method : SVG_SET_SATURATION
  // ID[E0AF10DFEA274FCFAE42DF0FE9471D45]
  // Created 21/06/11 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  //
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($1)
C_LONGINT:C283($2)

C_LONGINT:C283($Lon_parameters;$Lon_saturation)
C_TEXT:C284($Dom_defs;$Dom_feColorMatrix;$Dom_filter;$Dom_root;$Dom_svObject;$kTxt_currentMethod)
C_TEXT:C284($Txt_ID;$Txt_name)

If (False:C215)
	C_TEXT:C284(SVG_SET_SATURATION ;$1)
	C_LONGINT:C283(SVG_SET_SATURATION ;$2)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If (Asserted:C1132($Lon_parameters>=1;Get localized string:C991("error_missingParameter")))
	
	Compiler_SVG 
	
	$Dom_svObject:=$1
	
	$Lon_saturation:=100
	
	If ($Lon_parameters>=2)
		
		$Lon_saturation:=$2
		
	End if 
	
	$Txt_ID:="d4:saturation"+String:C10($Lon_saturation;"000")
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 

  // ----------------------------------------------------
DOM GET XML ELEMENT NAME:C730($Dom_svObject;$Txt_name)

ARRAY TEXT:C222($tTxt_objects;0x0000)
COLLECTION TO ARRAY:C1562(Storage:C1525.svg["Containers"];$tTxt_objects)

If ((Find in array:C230($tTxt_objects;$Txt_name)>0)\
 | ($Txt_name="image"))
	
	Component_errorHandler ("init";$kTxt_currentMethod)
	
	  //Is the filter already defined ?
	$Dom_root:=DOM Get root XML element:C1053($Dom_svObject)
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
					"type";"saturate";\
					"in";"SourceGraphic";\
					"values";$Lon_saturation/100)
				
			End if 
		End if 
	End if   //}
	
	If (OK=1)
		
		DOM SET XML ATTRIBUTE:C866($Dom_svObject;\
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