//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Color_grey
  // Created 07/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($0)
C_LONGINT:C283($1)

C_LONGINT:C283($Lon_Grey)

If (False:C215)
	C_TEXT:C284(SVG_Color_grey ;$0)
	C_LONGINT:C283(SVG_Color_grey ;$1)
End if 

Compiler_SVG 

If (Count parameters:C259>=1)
	
	$Lon_Grey:=$1  //0 -> 100
	
	$Lon_Grey:=Abs:C99($Lon_Grey)
	
	If ($Lon_Grey>100)
		
		$Lon_Grey:=100
		
	End if 
	
	$Lon_Grey:=Int:C8(255-((255*$Lon_Grey)/100))
	
	$0:=Replace string:C233("rgb(%,%,%)";"%";String:C10($Lon_Grey))
	
Else 
	
	ASSERT:C1129(Component_putError (8850;Current method name:C684))  //Argument missing
	
End if 