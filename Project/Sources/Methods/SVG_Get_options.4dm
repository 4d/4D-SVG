//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Get_options
  // Created 21/08/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // SVG_Get_options returns a 32-bit number which contains bits representing the
  // different options for SVG Component.
  // ----------------------------------------------------
C_LONGINT:C283($0)

If (False:C215)
	C_LONGINT:C283(SVG_Get_options ;$0)
End if 

Compiler_SVG 

$0:=Storage:C1525.svg.options