//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_DEFAULT_BRUSHES
  // Created 21/08/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($kTxt_currentMethod;$Txt_fillColor;$Txt_strokeColor)

If (False:C215)
	C_TEXT:C284(SVG_SET_DEFAULT_BRUSHES ;$1)
	C_TEXT:C284(SVG_SET_DEFAULT_BRUSHES ;$2)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=1)
	
	Use (Storage:C1525.svg)
		
		$Txt_strokeColor:=$1
		Storage:C1525.svg.strokeColor:=Choose:C955(Length:C16($Txt_strokeColor)=0;"black";$Txt_strokeColor)
		
		If ($Lon_parameters>=2)
			
			$Txt_fillColor:=$2
			Storage:C1525.svg.fillColor:=Choose:C955(Length:C16($Txt_fillColor)=0;"white";$Txt_fillColor)
			
		End if 
	End use 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  // Parameters Missing
	
End if 