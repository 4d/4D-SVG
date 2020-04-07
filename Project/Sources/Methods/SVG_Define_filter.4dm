//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Define_filter
  // Created 10/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // Declare a new filter in the defs node
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)
C_REAL:C285($3)
C_REAL:C285($4)
C_REAL:C285($5)
C_REAL:C285($6)
C_TEXT:C284($7)
C_TEXT:C284($8)

C_LONGINT:C283($Lon_parameters)
C_REAL:C285($Num_height;$Num_width;$Num_x;$Num_y)
C_TEXT:C284($kTxt_currentMethod;$Txt_defsID;$Txt_filterUnits;$Txt_ID;$Txt_objectID;$Txt_primitiveUnits)
C_TEXT:C284($Txt_rootReference;$Txt_svgObject)

If (False:C215)
	C_TEXT:C284(SVG_Define_filter ;$0)
	C_TEXT:C284(SVG_Define_filter ;$1)
	C_TEXT:C284(SVG_Define_filter ;$2)
	C_REAL:C285(SVG_Define_filter ;$3)
	C_REAL:C285(SVG_Define_filter ;$4)
	C_REAL:C285(SVG_Define_filter ;$5)
	C_REAL:C285(SVG_Define_filter ;$6)
	C_TEXT:C284(SVG_Define_filter ;$7)
	C_TEXT:C284(SVG_Define_filter ;$8)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Txt_svgObject:=$1
	$Txt_ID:=$2
	
	$Num_x:=-1
	$Num_width:=-1
	
	If ($Lon_parameters>=4)  //x, y
		
		$Num_x:=$3
		$Num_y:=$4
		
		If ($Lon_parameters>=6)  //width, height
			
			$Num_width:=$5
			$Num_height:=$6
			
			If ($Lon_parameters>=7)  //filterUnits
				
				$Txt_filterUnits:=$7
				
				If ($Lon_parameters>=8)  //primitiveUnits
					
					$Txt_primitiveUnits:=$7
					
				End if 
			End if 
		End if 
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
		
		$Txt_objectID:=DOM Find XML element by ID:C1010($Txt_defsID;$Txt_ID)
		
		If (OK=1)  //Delete the existing color
			
			DOM REMOVE XML ELEMENT:C869($Txt_objectID)
			
		End if 
		
		  //Create the filter {
		$Txt_objectID:=DOM Create XML element:C865($Txt_defsID;"filter";\
			"id";$Txt_ID)
		  //}
		
		  //x,y
		  //{
		If (OK=1)\
			 & ($Num_x#-1)
			
			DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
				"x";$Num_x;\
				"y";$Num_y)
			
		End if 
		  //}
		
		  //width, height {
		If (OK=1)\
			 & ($Num_width#-1)
			
			DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
				"width";$Num_width;\
				"height";$Num_height)
			
		End if 
		  //}
		
		  //filterUnits {
		If (OK=1)\
			 & (Length:C16($Txt_filterUnits)>0)
			
			If (Position:C15($Txt_filterUnits+"|";"userSpaceOnUse|objectBoundingBox|")>0)
				
				DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
					"filterUnits";$Txt_filterUnits)
				
			Else 
				
				ASSERT:C1129(Component_putError (8853))  // 8853 = Invalid Value for an Attribute
				
			End if 
		End if 
		  //}
		
		  //primitiveUnits {
		If (OK=1)\
			 & (Length:C16($Txt_primitiveUnits)>0)
			
			If (Position:C15($Txt_primitiveUnits+"|";"userSpaceOnUse|objectBoundingBox|")>0)
				
				DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
					"primitiveUnits";$Txt_primitiveUnits)
				
			Else 
				
				ASSERT:C1129(Component_putError (8853))  // 8853 = Invalid Value for an Attribute
				
			End if 
		End if 
		  //}
		
	End if 
	
	If (OK=1)
		
		$0:=$Txt_objectID
		
	End if 
	
	ASSERT:C1129(Component_errorHandler ("deinit"))
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 