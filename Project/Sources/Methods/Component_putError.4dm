//%attributes = {"invisible":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : Component_putError
  // Created 16/06/08 by Vincent de Lachaux
  // ----------------------------------------------------
C_BOOLEAN:C305($0)
C_LONGINT:C283($1)
C_TEXT:C284($2)

C_TEXT:C284($Txt_Error_Method)

If (False:C215)
	C_BOOLEAN:C305(Component_putError ;$0)
	C_LONGINT:C283(Component_putError ;$1)
	C_TEXT:C284(Component_putError ;$2)
End if 

SVG_Lon_Error:=$1
  //<>svg_tLon_Errors{0}:=SVG_Lon_Error

If (Count parameters:C259>=2)
	
	SVG_Txt_Command:=$2
	
End if 

$0:=True:C214

  // Added by Vincent de Lachaux (12/04/12)
If (Storage:C1525.svg.options ?? 12)  //Debug mode
	
	  //Call the installed host error-handling method
	If (Length:C16(String:C10(Storage:C1525.svg.Host_Error_Method))>0)
		
		$Txt_Error_Method:=Method called on error:C704
		ON ERR CALL:C155("xToolBox_NO_ERROR")  //=========================== < NO ERROR >
		
		EXECUTE METHOD:C1007(Storage:C1525.svg.Host_Error_Method;*;SVG_Lon_Error;SVG_Txt_Command)
		
		ON ERR CALL:C155($Txt_Error_Method)  //=============================== </ NO ERROR >
		
	Else 
		
		If (Storage:C1525.svg.options ?? 6)
			
			BEEP:C151
			
		End if 
	End if 
End if 

OK:=0