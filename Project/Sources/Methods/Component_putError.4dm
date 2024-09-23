//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : Component_putError
// Created 16/06/08 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($errorCode : Integer; $command : Text) : Boolean

SVG_Lon_Error:=$errorCode
SVG_Txt_Command:=$command

// Added by Vincent de Lachaux (12/04/12)
If (Storage:C1525.svg.options ?? 12)  // Debug mode
	
	// Call the installed host error-handling method
	If (Length:C16(String:C10(Storage:C1525.svg.Host_Error_Method))>0)
		
		Try(EXECUTE METHOD:C1007(Storage:C1525.svg.Host_Error_Method; *; SVG_Lon_Error; SVG_Txt_Command))
		
	Else 
		
		If (Storage:C1525.svg.options ?? 6)
			
			BEEP:C151
			
		End if 
	End if 
End if 

OK:=0

return True:C214