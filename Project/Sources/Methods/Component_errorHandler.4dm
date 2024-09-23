//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : Component_errorHandler
// Created 16/04/08 by Vincent de Lachaux
// ----------------------------------------------------
// Description
// 8850 = Parameters Missing
// 8851 = Invalid Type for an Argument
// 8852 = Invalid Node Reference
// 8853 = Invalid Value for an Attribute
// 8854 = Impossible to apply this Command for this Node
// 8855 = The ID passed was not found
// 8856 = The DTD file was not found
// 8857 = Invalid Value for an Argument
// 8858 = Unknown error
// 8859 = Duplicate ID
// 8860 = Deprecated
// ----------------------------------------------------
#DECLARE($action : Text; $command : Text; $currentMethod : Text) : Boolean

var $methodCallerdOnError : Text
var $countParameters : Integer

$countParameters:=Count parameters:C259

Case of 
		
		//________________________________________
	: ($countParameters=0)  // Error-handling
		
		SVG_Lon_Error:=ERROR
		
		// Added by Vincent de Lachaux (12/04/12)
		If (Storage:C1525.svg.options ?? 12)  // Debug mode
			
			// Call the installed host error-handling method
			If (Length:C16(String:C10(Storage:C1525.svg.Host_Error_Method))>0)
				
				$methodCallerdOnError:=Method called on error:C704
				ON ERR CALL:C155("xToolBox_NO_ERROR")  // =========================== < NO ERROR >
				
				EXECUTE METHOD:C1007(Storage:C1525.svg.Host_Error_Method; *; SVG_Lon_Error; SVG_Txt_Command)
				
				ON ERR CALL:C155($methodCallerdOnError)  // ================================ </ NO ERROR >
				
			Else 
				
				If (Storage:C1525.svg.options ?? 6)
					
					BEEP:C151
					
				End if 
			End if 
		End if 
		
		//______________________________________________________
	: ($countParameters<1)
		
		BEEP:C151
		
		//______________________________________________________
	: ($action="init")  // Installs the current method as error-handling method
		
		If (Not:C34(Storage:C1525.svg.options ?? 12))
			
			If (Storage:C1525.svg.options ?? 7)
				
				// Turn on the error message
				
			Else 
				
				$methodCallerdOnError:=Method called on error:C704
				$currentMethod:=$currentMethod || "Component_errorHandler"
				
				If ($methodCallerdOnError#$currentMethod)
					
					// Keep the current error-handling method
					Use (Storage:C1525.svg)
						
						Storage:C1525.svg.Current_Error_Method:=$methodCallerdOnError
						
					End use 
					
					ON ERR CALL:C155($currentMethod)
					
				End if 
			End if 
			
			If ($countParameters>=2)
				
				SVG_Txt_Command:=$command
				
			End if 
		End if 
		
		SVG_Lon_Error:=0
		
		OK:=1
		
		//______________________________________________________
	: ($action="deinit")
		
		$methodCallerdOnError:=Method called on error:C704
		$currentMethod:="Component_errorHandler"  // Current method name
		
		If ($methodCallerdOnError#$currentMethod)
			
			// Restore the previous error-handling method
			ON ERR CALL:C155(String:C10(Storage:C1525.svg.Current_Error_Method))
			
			Use (Storage:C1525.svg)
				
				Storage:C1525.svg.Current_Error_Method:=""
				
			End use 
		End if 
		
		//______________________________________________________
	: ($action="ERROR_OFF")
		
		ON ERR CALL:C155("xToolBox_NO_ERROR")
		
		//______________________________________________________
	: ($action="ERROR_ON")
		
		ERROR:=0
		ON ERR CALL:C155(Current method name:C684)
		
		//______________________________________________________
	: ($action="keep")
		
		If (SVG_Lon_Error=0)
			
			SVG_Lon_Error:=8858  // Unknown error
			
		End if 
		
		//______________________________________________________
		
	Else 
		
		TRACE:C157
		
		//______________________________________________________
End case 

return True:C214  // Enable use with ASSERTIONS