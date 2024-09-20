//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_SET_OPTIONS
// Created 21/08/08 by Vincent de Lachaux
// ----------------------------------------------------
// Description
// SVG_SET_OPTIONS sets all of the SVG Component options using a 32-bit number, which
// Contains bits representing the different options.
// ----------------------------------------------------
#DECLARE($options : Integer)

If (Storage:C1525.svg=Null:C1517)
	
	Compiler_SVG
	
End if 

Use (Storage:C1525.svg)
	
	If (Count parameters:C259>=1)
		
		Storage:C1525.svg.options:=$options
		
	Else 
		
		Storage:C1525.svg.options:=Component_defaultOptions
		
	End if 
End use 

// Added by Vincent de Lachaux (11/04/12)
SET ASSERT ENABLED:C1131(Storage:C1525.svg.options ?? 12; *)