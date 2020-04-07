//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Define_solidColor
  // Created 16/03/06
  // Framework SVgg
  // Author : Gérald Czwiklinski
  // ----------------------------------------------------
  // Define a color and keep tyhe definition for a later uasge by url
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (16/06/08)
  // 2004 -> v11
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)
C_TEXT:C284($3)
C_LONGINT:C283($4)

C_LONGINT:C283($Lon_parameters;$Lon_x)
C_REAL:C285($Num_opacity)
C_TEXT:C284($kTxt_currentMethod;$Txt_color;$Txt_defsID;$Txt_ID;$Txt_nodeReference;$Txt_rootReference)
C_TEXT:C284($Txt_svgObject)

If (False:C215)
	C_TEXT:C284(SVG_Define_solidColor ;$0)
	C_TEXT:C284(SVG_Define_solidColor ;$1)
	C_TEXT:C284(SVG_Define_solidColor ;$2)
	C_TEXT:C284(SVG_Define_solidColor ;$3)
	C_LONGINT:C283(SVG_Define_solidColor ;$4)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=3)
	
	$Txt_svgObject:=$1
	$Txt_ID:=$2
	$Txt_color:=$3
	
	If ($Lon_parameters>=4)
		
		$Num_opacity:=$4/100
		
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
		
		$Txt_nodeReference:=DOM Find XML element by ID:C1010($Txt_defsID;$Txt_ID)
		
		If (OK=1)  //Delete the existing color
			
			DOM REMOVE XML ELEMENT:C869($Txt_nodeReference)
			
		End if 
		
		  //Create the color {
		$Txt_nodeReference:=DOM Create XML element:C865($Txt_defsID;"solidColor";\
			"id";$Txt_ID)
		
		If (OK=1)
			
			$Lon_x:=Position:C15(":";$Txt_color)
			
			If ($Lon_x>0)
				
				$Num_opacity:=Num:C11(Substring:C12($Txt_color;$Lon_x+1))/100
				$Txt_color:=Substring:C12($Txt_color;1;$Lon_x-1)
				
			End if 
			
			If ($Txt_color#"url(@")
				
				$Txt_color:=Lowercase:C14($Txt_color)
				
			End if 
			
			DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
				"solid-color";$Txt_color)
			
			If (OK=1)\
				 & ($Num_opacity#0)
				
				DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
					"solid-opacity";$Num_opacity)
				
			End if 
		End if 
		  //}
		
		If (OK=1)
			
			$0:=$Txt_nodeReference
			
		End if 
	End if 
	
	ASSERT:C1129(Component_errorHandler ("deinit"))
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 