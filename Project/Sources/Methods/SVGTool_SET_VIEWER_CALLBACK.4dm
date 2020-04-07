//%attributes = {"invisible":true,"shared":true,"preemptive":"incapable"}
  // ----------------------------------------------------
  // Method : SVGTool_SET_VIEWER_CALLBACK
  // Created 06/11/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)

If (False:C215)
	C_TEXT:C284(SVGTool_SET_VIEWER_CALLBACK ;$1)
End if 

Compiler_SVG 

If (Count parameters:C259>=1)
	
	<>SVG_Txt_Viewer_Callback_Method:=$1
	
Else 
	
	<>SVG_Txt_Viewer_Callback_Method:=""
	
End if 