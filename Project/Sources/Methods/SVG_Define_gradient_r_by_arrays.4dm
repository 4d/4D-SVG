//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_Define_radial_gradient
// Created 16/03/06
// Framework SVgg
// Author : Gérald Czwiklinski
// ----------------------------------------------------
// Modified by Vincent de Lachaux (16/06/08)
// 2004 -> v11
// ----------------------------------------------------
_O_C_TEXT:C284($1)
_O_C_TEXT:C284($2)
_O_C_LONGINT:C283($3)
_O_C_LONGINT:C283($4)
_O_C_LONGINT:C283($5)
_O_C_LONGINT:C283($6)
_O_C_LONGINT:C283($7)
_O_C_TEXT:C284(${8})

_O_C_LONGINT:C283($Lon_cx; $Lon_cy; $Lon_fx; $Lon_fy; $Lon_i; $Lon_offset)
_O_C_LONGINT:C283($Lon_opacity; $Lon_parameters; $Lon_r; $Lon_step; $Lon_x)
_O_C_TEXT:C284($kTxt_currentMethod; $Txt_color; $Txt_colorName; $Txt_defsID; $Txt_gradientID; $Txt_gradientName)
_O_C_TEXT:C284($Txt_rootReference; $Txt_Stop; $Txt_svgObject)

If (False:C215)
	_O_C_TEXT:C284(SVG_Define_gradient_r_by_arrays; $1)
	_O_C_TEXT:C284(SVG_Define_gradient_r_by_arrays; $2)
	_O_C_LONGINT:C283(SVG_Define_gradient_r_by_arrays; $3)
	_O_C_LONGINT:C283(SVG_Define_gradient_r_by_arrays; $4)
	_O_C_LONGINT:C283(SVG_Define_gradient_r_by_arrays; $5)
	_O_C_LONGINT:C283(SVG_Define_gradient_r_by_arrays; $6)
	_O_C_LONGINT:C283(SVG_Define_gradient_r_by_arrays; $7)
	_O_C_TEXT:C284(SVG_Define_gradient_r_by_arrays; ${8})
End if 

Compiler_SVG

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Txt_svgObject:=$1
	$Txt_gradientName:=$2
	
	$Lon_fx:=-1
	$Lon_fy:=-1
	$Lon_r:=-1
	$Lon_cx:=-1
	$Lon_cy:=-1
	
	If ($Lon_parameters>=3)
		
		$Lon_fx:=$3
		
		If ($Lon_parameters>=3)
			
			$Lon_fy:=$4
			
			If ($Lon_parameters>=3)
				
				$Lon_r:=$5
				
				If ($Lon_parameters>=3)
					
					$Lon_cx:=$6
					
					If ($Lon_parameters>=3)
						
						$Lon_cy:=$7
						
					End if 
				End if 
			End if 
		End if 
	End if 
	
	Component_errorHandler("init"; $kTxt_currentMethod)
	
	$Txt_defsID:=getDefs($Txt_svgObject)
	
	If (OK=1)
		
		$Txt_gradientID:=DOM Find XML element by ID:C1010($Txt_defsID; $Txt_gradientName)
		
		If (OK=1)  //Delete the existing gradient
			
			DOM REMOVE XML ELEMENT:C869($Txt_gradientID)
			
		End if 
		
		//Create the gradient {
		$Txt_gradientID:=DOM Create XML element:C865($Txt_defsID; "radialGradient"; \
			"id"; $Txt_gradientName; \
			"gradientUnits"; "userSpaceOnUse")
		//}
		
	End if 
	
	If ($Lon_cx#-1)\
		 & (OK=1)
		
		DOM SET XML ATTRIBUTE:C866($Txt_gradientID; \
			"cx"; $Lon_cx)
		
	End if 
	
	If ($Lon_cy#-1)\
		 & (OK=1)
		
		DOM SET XML ATTRIBUTE:C866($Txt_gradientID; \
			"cy"; $Lon_cy)
		
	End if 
	
	If ($Lon_fx#-1)\
		 & (OK=1)
		
		DOM SET XML ATTRIBUTE:C866($Txt_gradientID; \
			"fx"; $Lon_fx)
		
	End if 
	
	If ($Lon_fy#-1)\
		 & (OK=1)
		
		DOM SET XML ATTRIBUTE:C866($Txt_gradientID; \
			"fy"; $Lon_fy)
		
	End if 
	
	If ($Lon_r#-1)\
		 & (OK=1)
		
		DOM SET XML ATTRIBUTE:C866($Txt_gradientID; \
			"r"; $Lon_r)
		
	End if 
	
	$Lon_step:=100\($Lon_parameters-8)
	
	For ($Lon_i; 8; $Lon_parameters; 1)
		
		$Txt_color:=""
		$Lon_opacity:=-1
		
		$Txt_color:=${$Lon_i}
		
		$Lon_x:=Position:C15(":"; $Txt_color)
		
		If ($Lon_x>0)
			
			$Lon_opacity:=Num:C11(Substring:C12($Txt_color; $Lon_x+1))
			$Txt_color:=Lowercase:C14(Substring:C12($Txt_color; 1; $Lon_x-1))
			
		End if 
		
		If (Length:C16($Txt_color)>0)
			
			If ($Txt_colorName#"url(@")
				
				$Txt_colorName:=Lowercase:C14($Txt_colorName)
				
			End if 
			
			$Txt_Stop:=DOM Create XML element:C865($Txt_gradientID; "stop"; \
				"offset"; String:C10($Lon_offset)+"%"; \
				"stop-color"; $Txt_color)
			
			If ($Lon_opacity#-1)\
				 & (OK=1)
				
				DOM SET XML ATTRIBUTE:C866($Txt_Stop; \
					"stop-opacity"; $Lon_opacity)
				
			End if 
		End if 
		
		If (OK=1)
			
			$Lon_offset:=$Lon_offset+$Lon_step
			
		Else 
			
			$Lon_i:=MAXLONG:K35:2-1
			
		End if 
	End for 
	
	ASSERT:C1129(Component_errorHandler("deinit"))
	
Else 
	
	ASSERT:C1129(Component_putError(8850; $kTxt_currentMethod))  //Parameters Missing
	
End if 