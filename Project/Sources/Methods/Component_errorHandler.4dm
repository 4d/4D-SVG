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
C_BOOLEAN:C305($0)
C_TEXT:C284($1)
C_TEXT:C284($2)
C_TEXT:C284($3)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Txt_Current_Method;$Txt_Error_Method)

If (False:C215)
	C_BOOLEAN:C305(Component_errorHandler ;$0)
	C_TEXT:C284(Component_errorHandler ;$1)
	C_TEXT:C284(Component_errorHandler ;$2)
	C_TEXT:C284(Component_errorHandler ;$3)
End if 

$Lon_parameters:=Count parameters:C259

$0:=True:C214  //enable use with ASSERTIONS

Case of 
		
		  //________________________________________
	: ($Lon_parameters=0)  //Error-handling
		
		SVG_Lon_Error:=ERROR
		
		  // Added by Vincent de Lachaux (12/04/12)
		If (Storage:C1525.svg.options ?? 12)  // Debug mode
			
			  // Call the installed host error-handling method
			If (Length:C16(String:C10(Storage:C1525.svg.Host_Error_Method))>0)
				
				$Txt_Error_Method:=Method called on error:C704
				ON ERR CALL:C155("xToolBox_NO_ERROR")  //=========================== < NO ERROR >
				
				EXECUTE METHOD:C1007(Storage:C1525.svg.Host_Error_Method;*;SVG_Lon_Error;SVG_Txt_Command)
				
				ON ERR CALL:C155($Txt_Error_Method)  //================================ </ NO ERROR >
				
			Else 
				
				If (Storage:C1525.svg.options ?? 6)
					
					BEEP:C151
					
				End if 
			End if 
		End if 
		
		  //______________________________________________________
	: ($Lon_parameters<1)
		
		BEEP:C151
		
		  //______________________________________________________
	: ($1="init")  //Installs the current method as error-handling method
		
		If (Not:C34(Storage:C1525.svg.options ?? 12))
			
			If (Storage:C1525.svg.options ?? 7)
				
				  // Turn on the error message
				
			Else 
				
				$Txt_Error_Method:=Method called on error:C704
				
				If ($Lon_parameters>=3)
					
					$Txt_Current_Method:=$3
					
				Else 
					
					$Txt_Current_Method:="Component_errorHandler"  //Current method name
					
				End if 
				
				If ($Txt_Error_Method#$Txt_Current_Method)
					
					  // Keep the current error-handling method
					Use (Storage:C1525.svg)
						
						Storage:C1525.svg.Current_Error_Method:=$Txt_Error_Method
						
					End use 
					
					ON ERR CALL:C155($Txt_Current_Method)
					
				End if 
			End if 
			
			If ($Lon_parameters>=2)
				
				SVG_Txt_Command:=$2
				
			End if 
		End if 
		
		SVG_Lon_Error:=0
		
		OK:=1
		
		  //______________________________________________________
	: ($1="deinit")
		
		$Txt_Error_Method:=Method called on error:C704
		$Txt_Current_Method:="Component_errorHandler"  //Current method name
		
		If ($Txt_Error_Method#$Txt_Current_Method)
			
			  // Restore the previous error-handling method
			ON ERR CALL:C155(String:C10(Storage:C1525.svg.Current_Error_Method))
			
			Use (Storage:C1525.svg)
				
				Storage:C1525.svg.Current_Error_Method:=""
				
			End use 
		End if 
		
		  //______________________________________________________
	: ($1="ERROR_OFF")
		
		ON ERR CALL:C155("xToolBox_NO_ERROR")
		
		  //______________________________________________________
	: ($1="ERROR_ON")
		
		ERROR:=0
		ON ERR CALL:C155(Current method name:C684)
		
		  //______________________________________________________
	: ($1="keep")
		
		If (SVG_Lon_Error=0)
			
			SVG_Lon_Error:=8858  //Unknown error
			
		End if 
		
		  //______________________________________________________
	Else 
		
		TRACE:C157
		
		  //______________________________________________________
End case 