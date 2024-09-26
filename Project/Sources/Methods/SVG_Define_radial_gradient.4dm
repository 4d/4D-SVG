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
_O_C_TEXT:C284($0)
_O_C_TEXT:C284($1)
_O_C_TEXT:C284($2)
_O_C_TEXT:C284($3)
_O_C_TEXT:C284($4)
_O_C_LONGINT:C283($5)
_O_C_LONGINT:C283($6)
_O_C_LONGINT:C283($7)
_O_C_LONGINT:C283($8)
_O_C_LONGINT:C283($9)
_O_C_TEXT:C284($10)

_O_C_LONGINT:C283($Lon_parameters; $Lon_x)
_O_C_REAL:C285($Num_opacity)
_O_C_TEXT:C284($kTxt_currentMethod; $Txt_defsID; $Txt_ID; $Txt_objectID; $Txt_rootReference; $Txt_startColor)
_O_C_TEXT:C284($Txt_Stop; $Txt_stopColor; $Txt_svgObject)

If (False:C215)
	_O_C_TEXT:C284(SVG_Define_radial_gradient; $0)
	_O_C_TEXT:C284(SVG_Define_radial_gradient; $1)
	_O_C_TEXT:C284(SVG_Define_radial_gradient; $2)
	_O_C_TEXT:C284(SVG_Define_radial_gradient; $3)
	_O_C_TEXT:C284(SVG_Define_radial_gradient; $4)
	_O_C_LONGINT:C283(SVG_Define_radial_gradient; $5)
	_O_C_LONGINT:C283(SVG_Define_radial_gradient; $6)
	_O_C_LONGINT:C283(SVG_Define_radial_gradient; $7)
	_O_C_LONGINT:C283(SVG_Define_radial_gradient; $8)
	_O_C_LONGINT:C283(SVG_Define_radial_gradient; $9)
	_O_C_TEXT:C284(SVG_Define_radial_gradient; $10)
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
	
	If (Asserted:C1132(xml_referenceValid($Txt_svgObject); Localized string:C991("error_badReference")))
		
		Component_errorHandler("init"; $kTxt_currentMethod)
		
		$Txt_defsID:=getDefs($Txt_svgObject)
		
		If (OK=1)
			
			$Txt_objectID:=DOM Find XML element by ID:C1010($Txt_defsID; $Txt_ID)
			
			If (OK=1)  //Delete the existing gradient
				
				DOM REMOVE XML ELEMENT:C869($Txt_objectID)
				
			End if 
			
			//Create the gradient {
			$Txt_objectID:=DOM Create XML element:C865($Txt_defsID; "radialGradient"; \
				"id"; $Txt_ID)  //;"gradientUnits";"userSpaceOnUse")								\
				
			//}
			
		End if 
		
		If ($Lon_parameters>=7)
			
			DOM SET XML ATTRIBUTE:C866($Txt_objectID; \
				"cx"; String:C10($5)+"%"; \
				"cy"; String:C10($6)+"%"; \
				"r"; String:C10($7)+"%")
			
		End if 
		
		If ($Lon_parameters>=9)
			
			DOM SET XML ATTRIBUTE:C866($Txt_objectID; \
				"fx"; String:C10($8)+"%"; \
				"fy"; String:C10($9)+"%")
			
		End if 
		
		If ($Lon_parameters>=10)
			
			DOM SET XML ATTRIBUTE:C866($Txt_objectID; \
				"spreadMethod"; $10)
			
		End if 
		
		If (OK=1)
			
			//Decode the color {
			$Lon_x:=Position:C15(":"; $Txt_startColor)
			
			If ($Lon_x>0)
				
				$Num_opacity:=Num:C11(Substring:C12($Txt_startColor; $Lon_x+1))/100
				$Txt_startColor:=Lowercase:C14(Substring:C12($Txt_startColor; 1; $Lon_x-1))
				
			Else 
				
				$Num_opacity:=-1
				
			End if 
			//}
			
			If ($Txt_startColor#"url(@")
				
				$Txt_startColor:=Lowercase:C14($Txt_startColor)
				
			End if 
			
			$Txt_Stop:=DOM Create XML element:C865($Txt_objectID; "stop"; \
				"offset"; "0%"; \
				"stop-color"; $Txt_startColor)
			
			If (OK=1)\
				 & ($Num_opacity#-1)
				
				DOM SET XML ATTRIBUTE:C866($Txt_Stop; \
					"stop-opacity"; $Num_opacity)
				
			End if 
			
			If (OK=1)
				
				//Decode the color {
				$Lon_x:=Position:C15(":"; $Txt_stopColor)
				
				If ($Lon_x>0)
					
					$Num_opacity:=Num:C11(Substring:C12($Txt_stopColor; $Lon_x+1))/100
					$Txt_stopColor:=Lowercase:C14(Substring:C12($Txt_stopColor; 1; $Lon_x-1))
					
				Else 
					
					$Num_opacity:=-1
					
				End if 
				//}
				
				If ($Txt_stopColor#"url(@")
					
					$Txt_stopColor:=Lowercase:C14($Txt_stopColor)
					
				End if 
				
				$Txt_Stop:=DOM Create XML element:C865($Txt_objectID; "stop"; \
					"offset"; "100%"; \
					"stop-color"; $Txt_stopColor)
				
				If (OK=1)\
					 & ($Num_opacity#-1)
					
					DOM SET XML ATTRIBUTE:C866($Txt_Stop; \
						"stop-opacity"; $Num_opacity)
					
				End if 
			End if 
		End if 
		
		If (OK=1)
			
			$0:=$Txt_objectID
			
		End if 
		
		ASSERT:C1129(Component_errorHandler("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError(8852; $kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError(8850; $kTxt_currentMethod))  //Parameters Missing
	
End if 