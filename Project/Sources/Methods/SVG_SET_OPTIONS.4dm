//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_OPTIONS
  // Created 21/08/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // SVG_SET_OPTIONS sets all of the SVG Component options using a 32-bit number, which
  // contains bits representing the different options.
  // ----------------------------------------------------
C_LONGINT:C283($1)

C_LONGINT:C283($Lon_parameters)

If (False:C215)
	C_LONGINT:C283(SVG_SET_OPTIONS ;$1)
End if 


If (Storage:C1525.svg=Null:C1517)
	
	Compiler_SVG 
	
End if 


$Lon_parameters:=Count parameters:C259

Use (Storage:C1525.svg)
	
	If ($Lon_parameters>=1)
		
		Storage:C1525.svg.options:=$1
		
	Else 
		
		Storage:C1525.svg.options:=Component_defaultOptions 
		
	End if 
End use 

  // Added by Vincent de Lachaux (11/04/12)
SET ASSERT ENABLED:C1131(Storage:C1525.svg.options ?? 12;*)