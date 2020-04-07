//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method: SVG_SET_STROKE_WIDTH
  // Date et heure : 16/03/06, 10:07:53
  // Framework SVgg
  // Author : Gérald Czwiklinski
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (01/07/08)
  // 2004 -> v11
  // ----------------------------------------------------
C_TEXT:C284($1)
C_REAL:C285($2)
C_TEXT:C284($3)

C_LONGINT:C283($Lon_parameters)
C_REAL:C285($Num_strokeWidth)
C_TEXT:C284($kTxt_currentMethod;$Txt_objectID;$Txt_unit)

If (False:C215)
	C_TEXT:C284(SVG_SET_STROKE_WIDTH ;$1)
	C_REAL:C285(SVG_SET_STROKE_WIDTH ;$2)
	C_TEXT:C284(SVG_SET_STROKE_WIDTH ;$3)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Txt_objectID:=$1
	$Num_strokeWidth:=$2
	
	If ($Lon_parameters>=3)
		
		$Txt_unit:=$3
		
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Txt_objectID);Get localized string:C991("error_badReference")))
		
		If (Position:C15($Txt_unit+"|";"px|pt|pc|cm|mm|in|%|")>0)  //True even if $Txt_unit is empty :-)
			
			Component_errorHandler ("init";$kTxt_currentMethod)
			
			If (Length:C16($Txt_unit)>0)
				
				DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
					"stroke-width";String:C10($Num_strokeWidth;"&xml")+$Txt_unit)
				
			Else 
				
				DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
					"stroke-width";$Num_strokeWidth)
				
			End if 
			
			ASSERT:C1129(Component_errorHandler ("deinit"))
			
		Else 
			
			ASSERT:C1129(Component_putError (8853;$kTxt_currentMethod))  //Invalid Value for an Attribute
			
		End if 
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 