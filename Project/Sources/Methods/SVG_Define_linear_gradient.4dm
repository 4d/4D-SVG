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
  // Modified by Vincent de Lachaux (20/06/11)
  // Add spreadMethod, x1, y1, x2, y2 parameters
  // ----------------------------------------------------
  // Modified #13-5-2013 by Vincent de Lachaux
  // Add start & stop offset
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)
C_TEXT:C284($3)
C_TEXT:C284($4)
C_LONGINT:C283($5)
C_TEXT:C284($6)
C_REAL:C285(${7})

C_LONGINT:C283($Lon_i;$Lon_parameterIndex;$Lon_parameters;$Lon_rotation;$Lon_x)
C_REAL:C285($Num_opacity;$Num_startOffset;$Num_stopOffset;$Num_value)
C_TEXT:C284($kTxt_currentMethod;$Txt_colorInterpolation;$Txt_defsID;$Txt_ID;$Txt_objectID;$Txt_rootReference)
C_TEXT:C284($Txt_spreadMethod;$Txt_startColor;$Txt_Stop;$Txt_stopColor;$Txt_svgObject)

If (False:C215)
	C_TEXT:C284(SVG_Define_linear_gradient ;$0)
	C_TEXT:C284(SVG_Define_linear_gradient ;$1)
	C_TEXT:C284(SVG_Define_linear_gradient ;$2)
	C_TEXT:C284(SVG_Define_linear_gradient ;$3)
	C_TEXT:C284(SVG_Define_linear_gradient ;$4)
	C_LONGINT:C283(SVG_Define_linear_gradient ;$5)
	C_TEXT:C284(SVG_Define_linear_gradient ;$6)
	C_REAL:C285(SVG_Define_linear_gradient ;${7})
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_Define_linear_gradient"  //Nom methode courante

If ($Lon_parameters>=4)
	
	$Txt_svgObject:=$1
	$Txt_ID:=$2
	$Txt_startColor:=$3
	$Txt_stopColor:=$4
	$Num_startOffset:=-1
	$Num_stopOffset:=-1
	
	If ($Lon_parameters>=5)
		
		$Lon_rotation:=$5
		
		  //v13 {
		If ($Lon_parameters>=6)
			
			$Txt_spreadMethod:=$6
			
			If ($Lon_parameters>=10)
				
				ARRAY TEXT:C222($tTxt_attributes;4)
				$tTxt_attributes{1}:="x1"
				$tTxt_attributes{2}:="y1"
				$tTxt_attributes{3}:="x2"
				$tTxt_attributes{4}:="y2"
				
				If ($Lon_parameters>=11)
					
					$Num_startOffset:=$11
					
					If ($Lon_parameters>=12)
						
						$Num_stopOffset:=$12
						
					End if 
				End if 
				
			Else 
				
				If ($Lon_parameters>=7)
					
					$Num_startOffset:=$7
					
					If ($Lon_parameters>=8)
						
						$Num_stopOffset:=$8
						
					End if 
				End if 
			End if 
		End if 
	End if 
	  //}
	
	If (Asserted:C1132(xml_referenceValid ($Txt_svgObject);Get localized string:C991("error_badReference")))
		
		ARRAY TEXT:C222($tTxt_values;0x0000)
		COLLECTION TO ARRAY:C1562(Storage:C1525.svg["spreadMethod"];$tTxt_values)
		
		If (Length:C16($Txt_spreadMethod)=0)\
			 | (Find in array:C230($tTxt_values;$Txt_spreadMethod)>0)
			
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
				
				  //Create the gradient
				$Txt_objectID:=DOM Create XML element:C865($Txt_defsID;"linearGradient";\
					"id";$Txt_ID)
				
			End if 
			
			  //Gradient vecteur
			Case of 
					
					  //…………………………………………………………………………………………
				: (OK=0)
					
					  //…………………………………………………………………………………………
				: ($Lon_rotation=0)
					
					  //…………………………………………………………………………………………
				: ($Lon_rotation=-45)
					
					DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
						"x1";1;\
						"y1";1;\
						"x2";0;\
						"y2";0)
					
					  //…………………………………………………………………………………………
				: ($Lon_rotation=45)
					
					DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
						"x1";0;\
						"y1";0;\
						"x2";1;\
						"y2";1)
					
					  //…………………………………………………………………………………………
				: ($Lon_rotation=90)
					
					DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
						"x1";0;\
						"y1";0;\
						"x2";0;\
						"y2";1)
					
					  //…………………………………………………………………………………………
				: ($Lon_rotation=-90)
					
					DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
						"x1";0;\
						"y1";1;\
						"x2";0;\
						"y2";0)
					
					  //…………………………………………………………………………………………
				: ($Lon_rotation=180)
					
					DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
						"x1";0;\
						"y1";0;\
						"x2";1;\
						"y2";0)
					
					  //…………………………………………………………………………………………
				: ($Lon_rotation=-180)
					
					DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
						"x1";1;\
						"y1";0;\
						"x2";0;\
						"y2";0)
					
					  //…………………………………………………………………………………………
				Else 
					
					DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
						"gradientTransform";"rotate("+String:C10($Lon_rotation)+")")
					
					  //…………………………………………………………………………………………
			End case 
			
			If (Length:C16($Txt_spreadMethod)>0)
				
				DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
					"spreadMethod";$Txt_spreadMethod)
				
			End if 
			
			If (Length:C16($Txt_colorInterpolation)>0)
				
				DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
					"color-interpolation";$Txt_colorInterpolation)
				
			End if 
			
			If ($Lon_parameters>=10)
				
				For ($Lon_i;1;4;1)
					
					$Lon_parameterIndex:=6+$Lon_i
					
					If ($Lon_parameterIndex<=$Lon_parameters)  //x1,y1,x2,y2
						
						$Num_value:=${$Lon_parameterIndex}
						
						If ($Num_value>=1)
							
							$Num_value:=$Num_value/100
							
						End if 
						
						Case of 
								
								  //______________________________________________________
							: ($Num_value=0)
								
								  //Nothing to do
								
								  //______________________________________________________
							: ($Num_value<=1)  //percent
								
								DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
									$tTxt_attributes{$Lon_i};String:C10($Num_value*100)+"%")
								
								  //______________________________________________________
							Else 
								
								DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
									$tTxt_attributes{$Lon_i};$Num_value)
								
								  //______________________________________________________
						End case 
					End if 
				End for 
			End if 
			
			If (OK=1)
				
				  //Decode the color {
				$Lon_x:=Position:C15(":";$Txt_startColor)
				
				If ($Lon_x>0)
					
					$Num_opacity:=Num:C11(Substring:C12($Txt_startColor;$Lon_x+1))/100
					$Txt_startColor:=Lowercase:C14(Substring:C12($Txt_startColor;1;$Lon_x-1))
					
				Else 
					
					$Num_opacity:=-1
					
				End if   //}
				
				If ($Txt_startColor#"url(@")
					
					$Txt_startColor:=Lowercase:C14($Txt_startColor)
					
				End if 
				
				$Num_startOffset:=Choose:C955($Num_startOffset<0;0;$Num_startOffset)
				$Num_startOffset:=Choose:C955($Num_startOffset<0.9999999999999;$Num_startOffset*100;$Num_startOffset)
				$Num_startOffset:=Choose:C955($Num_startOffset>100;100;$Num_startOffset)
				
				$Txt_Stop:=DOM Create XML element:C865($Txt_objectID;"stop";\
					"offset";String:C10(Int:C8($Num_startOffset))+"%";\
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
						
					End if   //}
					
					If ($Txt_stopColor#"url(@")
						
						$Txt_stopColor:=Lowercase:C14($Txt_stopColor)
						
					End if 
					
					$Num_stopOffset:=Choose:C955($Num_stopOffset<0;100;$Num_stopOffset)
					$Num_stopOffset:=Choose:C955($Num_stopOffset<0.9999999999999;$Num_stopOffset*100;$Num_stopOffset)
					$Num_stopOffset:=Choose:C955($Num_stopOffset>100;100;$Num_stopOffset)
					
					$Txt_Stop:=DOM Create XML element:C865($Txt_objectID;"stop";\
						"offset";String:C10(Int:C8($Num_stopOffset))+"%";\
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
			
			ASSERT:C1129(Component_putError (8853;$kTxt_currentMethod))  //Invalid Value for an Attribute
			
		End if 
		
		  //#ACI0091143
		CLEAR VARIABLE:C89($tTxt_values)
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 