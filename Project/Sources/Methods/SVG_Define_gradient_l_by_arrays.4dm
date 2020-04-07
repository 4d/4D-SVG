//%attributes = {"invisible":true,"preemptive":"capable"}
  //-----------------------------------------------------------------------------------------------------
  // Date et heure : 16/02/07, 10:07:53
  // Framework SVgg
  // Author : Gérald Czwiklinski
  //-----------------------------------------------------------------------------------------------------
C_TEXT:C284($1)
C_TEXT:C284($2)
C_LONGINT:C283($3)
C_LONGINT:C283($4)
C_LONGINT:C283($5)
C_LONGINT:C283($6)
C_TEXT:C284(${7})

C_LONGINT:C283($Lon_i;$Lon_offset;$Lon_opacity;$Lon_parameters;$Lon_step;$Lon_x)
C_LONGINT:C283($Lon_x1;$Lon_x2;$Lon_y1;$Lon_y2)
C_TEXT:C284($kTxt_currentMethod;$Txt_color;$Txt_colorName;$Txt_defsID;$Txt_gradientID;$Txt_gradientName)
C_TEXT:C284($Txt_rootReference;$Txt_Stop;$Txt_svgObject)

If (False:C215)
	C_TEXT:C284(SVG_Define_gradient_l_by_arrays ;$1)
	C_TEXT:C284(SVG_Define_gradient_l_by_arrays ;$2)
	C_LONGINT:C283(SVG_Define_gradient_l_by_arrays ;$3)
	C_LONGINT:C283(SVG_Define_gradient_l_by_arrays ;$4)
	C_LONGINT:C283(SVG_Define_gradient_l_by_arrays ;$5)
	C_LONGINT:C283(SVG_Define_gradient_l_by_arrays ;$6)
	C_TEXT:C284(SVG_Define_gradient_l_by_arrays ;${7})
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=6)
	
	$Txt_svgObject:=$1
	$Txt_gradientName:=$2
	$Lon_x1:=$3
	$Lon_y1:=$4
	$Lon_x2:=$5
	$Lon_y2:=$6
	
	Component_errorHandler ("init";$kTxt_currentMethod)
	
	  //Get defs node reference {
	  //First, go back to the main node (<SVG>)...
	$Txt_rootReference:=DOM Get root XML element:C1053($Txt_svgObject)
	
	  //...and find the 'defs' node...
	$Txt_defsID:=DOM Find XML element:C864($Txt_rootReference;"svg/defs")
	
	  //...finally create it if it does not.
	If (OK=0)
		
		$Txt_defsID:=DOM Create XML element:C865($Txt_rootReference;"defs";\
			"ID";"4D")
		
	End if 
	  //}
	
	If (OK=1)
		
		$Txt_gradientID:=DOM Find XML element by ID:C1010($Txt_defsID;$Txt_gradientName)
		
		If (OK=1)  //Delete the existing gradient
			
			DOM REMOVE XML ELEMENT:C869($Txt_gradientID)
			
		End if 
		
		  //Create the gradient {
		$Txt_gradientID:=DOM Create XML element:C865($Txt_defsID;"linearGradient";\
			"id";$Txt_gradientName;\
			"gradientUnits";"userSpaceOnUse")
		DOM SET XML ATTRIBUTE:C866($Txt_gradientID;\
			"x1";$Lon_x1;\
			"y1";$Lon_y1;\
			"x2";$Lon_x2;\
			"y2";$Lon_y2)
		  //}
		
	End if 
	
	$Lon_step:=100\($Lon_parameters-7)
	
	For ($Lon_i;7;$Lon_parameters;1)
		
		$Txt_color:=""
		$Lon_opacity:=-1
		
		$Txt_color:=${$Lon_i}
		
		$Lon_x:=Position:C15(":";$Txt_color)
		
		If ($Lon_x>0)
			
			$Lon_opacity:=Num:C11(Substring:C12($Txt_color;$Lon_x+1))
			$Txt_color:=Lowercase:C14(Substring:C12($Txt_color;1;$Lon_x-1))
			
		End if 
		
		If (Length:C16($Txt_color)>0)
			
			If ($Txt_colorName#"url(@")
				
				$Txt_colorName:=Lowercase:C14($Txt_colorName)
				
			End if 
			
			$Txt_Stop:=DOM Create XML element:C865($Txt_gradientID;"stop";\
				"offset";String:C10($Lon_offset)+"%";\
				"stop-color";$Txt_color)
			
			If ($Lon_opacity#-1)\
				 & (OK=1)
				
				DOM SET XML ATTRIBUTE:C866($Txt_Stop;\
					"stop-opacity";$Lon_opacity)
				
			End if 
		End if 
		
		If (OK=1)
			
			$Lon_offset:=$Lon_offset+$Lon_step
			
		Else 
			
			$Lon_i:=MAXLONG:K35:2-1
			
		End if 
	End for 
	
	ASSERT:C1129(Component_errorHandler ("deinit"))
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 