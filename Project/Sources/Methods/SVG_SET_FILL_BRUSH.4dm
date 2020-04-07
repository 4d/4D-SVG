//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method: SVG_SET_FILL_BRUSH
  // Date et heure : 16/03/06, 10:07:53
  // Framework SVgg
  // Author : Gérald Czwiklinski
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (01/07/08)
  // 2004 -> v11
  // ----------------------------------------------------
C_TEXT:C284($1)
C_TEXT:C284($2)
C_LONGINT:C283($3)

C_LONGINT:C283($Lon_opacity;$Lon_parameters;$Lon_x)
C_TEXT:C284($kTxt_currentMethod;$Txt_color;$Txt_objectID)

If (False:C215)
	C_TEXT:C284(SVG_SET_FILL_BRUSH ;$1)
	C_TEXT:C284(SVG_SET_FILL_BRUSH ;$2)
	C_LONGINT:C283(SVG_SET_FILL_BRUSH ;$3)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=1)
	
	$Txt_objectID:=$1
	
	If ($Lon_parameters>=2)
		
		$Txt_color:=$2
		
		If ($Lon_parameters>=3)
			
			$Lon_opacity:=$3
			
		End if 
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Txt_objectID);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		$Lon_x:=Position:C15(":";$Txt_color)
		
		If ($Lon_x>0)
			
			$Lon_opacity:=Num:C11(Substring:C12($Txt_color;$Lon_x+1))
			$Txt_color:=Substring:C12($Txt_color;1;$Lon_x-1)
			
		End if 
		
		Case of 
				
				  //______________________________________________________
			: (Length:C16($Txt_color)=0)
				
				$Txt_color:=Storage:C1525.svg.fillColor
				
				  //______________________________________________________
			: ($Txt_color="url(@")
				
				  //______________________________________________________
			Else 
				
				$Txt_color:=Lowercase:C14($Txt_color)
				
				  //______________________________________________________
		End case 
		
		DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
			"fill";$Txt_color)
		
		If (OK=1)\
			 & ($Lon_opacity>0)
			
			DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
				"fill-opacity";$Lon_opacity/100)
			
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 