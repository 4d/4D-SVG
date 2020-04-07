//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Define_linear_gradient
  // Created 16/03/06
  // Framework SVgg
  // Author : Gérald Czwiklinski
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (16/06/08)
  // 2004 -> v11
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)
C_TEXT:C284($3)
C_TEXT:C284($4)
C_LONGINT:C283($5)
C_LONGINT:C283($6)
C_LONGINT:C283($7)
C_LONGINT:C283($8)
C_LONGINT:C283($9)
C_TEXT:C284($10)

C_LONGINT:C283($Lon_parameters;$Lon_x)
C_REAL:C285($Num_opacity)
C_TEXT:C284($kTxt_currentMethod;$Txt_defsID;$Txt_ID;$Txt_objectID;$Txt_rootReference;$Txt_startColor)
C_TEXT:C284($Txt_Stop;$Txt_stopColor;$Txt_svgObject)

If (False:C215)
	C_TEXT:C284(SVG_Define_radial_gradient ;$0)
	C_TEXT:C284(SVG_Define_radial_gradient ;$1)
	C_TEXT:C284(SVG_Define_radial_gradient ;$2)
	C_TEXT:C284(SVG_Define_radial_gradient ;$3)
	C_TEXT:C284(SVG_Define_radial_gradient ;$4)
	C_LONGINT:C283(SVG_Define_radial_gradient ;$5)
	C_LONGINT:C283(SVG_Define_radial_gradient ;$6)
	C_LONGINT:C283(SVG_Define_radial_gradient ;$7)
	C_LONGINT:C283(SVG_Define_radial_gradient ;$8)
	C_LONGINT:C283(SVG_Define_radial_gradient ;$9)
	C_TEXT:C284(SVG_Define_radial_gradient ;$10)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

  //
If ($Lon_parameters>=4)
	
	$Txt_svgObject:=$1
	$Txt_ID:=$2
	$Txt_startColor:=$3
	$Txt_stopColor:=$4
	
	If (Asserted:C1132(xml_referenceValid ($Txt_svgObject);Get localized string:C991("error_badReference")))
		
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
			
			If (OK=1)  //Delete the existing gradient
				
				DOM REMOVE XML ELEMENT:C869($Txt_objectID)
				
			End if 
			
			  //Create the gradient {
			$Txt_objectID:=DOM Create XML element:C865($Txt_defsID;"radialGradient";\
				"id";$Txt_ID)  //;"gradientUnits";"userSpaceOnUse")\
				
			  //}
			
		End if 
		
		If ($Lon_parameters>=7)
			
			DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
				"cx";String:C10($5)+"%";\
				"cy";String:C10($6)+"%";\
				"r";String:C10($7)+"%")
			
		End if 
		
		If ($Lon_parameters>=9)
			
			DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
				"fx";String:C10($8)+"%";\
				"fy";String:C10($9)+"%")
			
		End if 
		
		If ($Lon_parameters>=10)
			
			DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
				"spreadMethod";$10)
			
		End if 
		
		If (OK=1)
			
			  //Decode the color {
			$Lon_x:=Position:C15(":";$Txt_startColor)
			
			If ($Lon_x>0)
				
				$Num_opacity:=Num:C11(Substring:C12($Txt_startColor;$Lon_x+1))/100
				$Txt_startColor:=Lowercase:C14(Substring:C12($Txt_startColor;1;$Lon_x-1))
				
			Else 
				
				$Num_opacity:=-1
				
			End if 
			  //}
			
			If ($Txt_startColor#"url(@")
				
				$Txt_startColor:=Lowercase:C14($Txt_startColor)
				
			End if 
			
			$Txt_Stop:=DOM Create XML element:C865($Txt_objectID;"stop";\
				"offset";"0%";\
				"stop-color";$Txt_startColor)
			
			If (OK=1)\
				 & ($Num_opacity#-1)
				
				DOM SET XML ATTRIBUTE:C866($Txt_Stop;\
					"stop-opacity";$Num_opacity)
				
			End if 
			
			If (OK=1)
				
				  //Decode the color {
				$Lon_x:=Position:C15(":";$Txt_stopColor)
				
				If ($Lon_x>0)
					
					$Num_opacity:=Num:C11(Substring:C12($Txt_stopColor;$Lon_x+1))/100
					$Txt_stopColor:=Lowercase:C14(Substring:C12($Txt_stopColor;1;$Lon_x-1))
					
				Else 
					
					$Num_opacity:=-1
					
				End if 
				  //}
				
				If ($Txt_stopColor#"url(@")
					
					$Txt_stopColor:=Lowercase:C14($Txt_stopColor)
					
				End if 
				
				$Txt_Stop:=DOM Create XML element:C865($Txt_objectID;"stop";\
					"offset";"100%";\
					"stop-color";$Txt_stopColor)
				
				If (OK=1)\
					 & ($Num_opacity#-1)
					
					DOM SET XML ATTRIBUTE:C866($Txt_Stop;\
						"stop-opacity";$Num_opacity)
					
				End if 
			End if 
		End if 
		
		If (OK=1)
			
			$0:=$Txt_objectID
			
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 