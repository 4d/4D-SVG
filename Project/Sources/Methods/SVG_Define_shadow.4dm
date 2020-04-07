//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Define_shadow
  // Created 03/10/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //<filter filterUnits="userSpaceOnUse" height="120" id="MonFiltre" width="200" x="0" y="0">
  //      <feGaussianBlur in="SourceAlpha" result="flou" stdDeviation="4"/>
  //      <feOffset dx="4" dy="4" in="flou" result="flouDecalage"/>
  //      <feBlend in="SourceGraphic" in2="flouDecalage" mode="normal"/>
  //</filter>
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)
C_LONGINT:C283($3)
C_LONGINT:C283($4)
C_LONGINT:C283($5)

C_LONGINT:C283($Lon_dx;$Lon_dy;$Lon_parameters;$Lon_stdDeviation)
C_TEXT:C284($kTxt_currentMethod;$Txt_defsID;$Txt_filterReference;$Txt_filterUnits;$Txt_ID;$Txt_Reference)
C_TEXT:C284($Txt_rootReference;$Txt_svgObject)

If (False:C215)
	C_TEXT:C284(SVG_Define_shadow ;$0)
	C_TEXT:C284(SVG_Define_shadow ;$1)
	C_TEXT:C284(SVG_Define_shadow ;$2)
	C_LONGINT:C283(SVG_Define_shadow ;$3)
	C_LONGINT:C283(SVG_Define_shadow ;$4)
	C_LONGINT:C283(SVG_Define_shadow ;$5)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Txt_svgObject:=$1
	$Txt_ID:=$2
	$Lon_stdDeviation:=4
	$Lon_dx:=4
	$Lon_dy:=4
	
	If ($Lon_parameters>=3)
		
		$Lon_stdDeviation:=$3
		
		If ($Lon_parameters>=4)
			
			$Lon_dx:=$4
			
			If ($Lon_parameters>=5)
				
				$Lon_dy:=$5
				
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
		
		$Txt_filterReference:=DOM Find XML element by ID:C1010($Txt_defsID;$Txt_ID)
		
		If (OK=1)  //Delete the existing color
			
			DOM REMOVE XML ELEMENT:C869($Txt_filterReference)
			
		End if 
		
		  //Create the filter{
		$Txt_filterReference:=DOM Create XML element:C865($Txt_defsID;"filter";\
			"id";$Txt_ID)  //}
		
		  //filterUnits {
		If (OK=1)\
			 & (Length:C16($Txt_filterUnits)>0)
			
			DOM SET XML ATTRIBUTE:C866($Txt_filterReference;\
				"filterUnits";"userSpaceOnUse")
			
		End if 
		  //}
		
		If (OK=1)
			
			$Txt_Reference:=DOM Create XML element:C865($Txt_filterReference;"feGaussianBlur";\
				"stdDeviation";$Lon_stdDeviation;\
				"in";"SourceAlpha";\
				"result";"_Blur")
			
			If (OK=1)
				
				$Txt_Reference:=DOM Create XML element:C865($Txt_filterReference;"feOffset";\
					"dx";$Lon_dx;\
					"dy";$Lon_dy;\
					"in";"_Blur";\
					"result";"_Offset")
				
				If (OK=1)
					
					$Txt_Reference:=DOM Create XML element:C865($Txt_filterReference;"feBlend";\
						"in";"SourceGraphic";\
						"in2";"_Offset";\
						"mode";"normal")
					
				End if 
			End if 
		End if 
	End if 
	
	If (OK=1)
		
		$0:=$Txt_filterReference
		
	End if 
	
	ASSERT:C1129(Component_errorHandler ("deinit"))
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 