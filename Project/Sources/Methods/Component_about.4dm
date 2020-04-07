//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Method : Component_about
  // Created 17/09/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)

C_LONGINT:C283($Lon_parameters;$Lon_windowRef)
C_TEXT:C284($Txt_Entrypoint)

If (False:C215)
	C_TEXT:C284(Component_about ;$1)
End if 

$Lon_parameters:=Count parameters:C259

If ($Lon_parameters>=1)
	
	$Txt_Entrypoint:=$1
	
End if 

Case of 
		
		  //___________________________________________________________
	: (Length:C16($Txt_Entrypoint)=0)
		
		Case of 
				
				  //……………………………………………………………………
			: (Method called on error:C704=Current method name:C684)
				
				  // Error managemnt routine
				
				  //……………………………………………………………………
			Else 
				
				  // This method must be executed in a new process
				BRING TO FRONT:C326(New process:C317(Current method name:C684;0;Current method name:C684;"_run";*))
				
				  //……………………………………………………………………
		End case 
		
		  //___________________________________________________________
	: ($Txt_Entrypoint="_run")
		
		  // First launch of this method executed in a new process
		Component_about ("_declarations")
		Component_about ("_init")
		
		$Lon_windowRef:=Open form window:C675("About";Plain form window:K39:10+4096;Horizontally centered:K39:1;Vertically centered:K39:4)
		DIALOG:C40("About")
		CLOSE WINDOW:C154
		
		Component_about ("_deinit")
		
		  //___________________________________________________________
	: ($Txt_Entrypoint="_declarations")
		
		  //___________________________________________________________
	: ($Txt_Entrypoint="_init")
		
		  //___________________________________________________________
	: ($Txt_Entrypoint="_deinit")
		
		  //___________________________________________________________
	Else 
		
		TRACE:C157
		
		  //___________________________________________________________
End case 