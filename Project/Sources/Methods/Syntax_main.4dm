//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Method : Syntax_main
  // Created 16/09/08 by vdl
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)

C_LONGINT:C283($Lon_parameters;$Lon_windowRef)
C_TEXT:C284($Txt_entryPoint)

If (False:C215)
	C_TEXT:C284(Syntax_main ;$1)
End if 

$Lon_parameters:=Count parameters:C259

If ($Lon_parameters>=1)
	
	$Txt_entryPoint:=$1
	
End if 

Case of 
		
		  //___________________________________________________________
	: (Length:C16($Txt_entryPoint)=0)
		
		Case of 
				
				  //……………………………………………………………………
			: (Method called on error:C704=Current method name:C684)
				
				  //……………………………………………………………………
			Else 
				
				  //This method must be executed in a new process
				BRING TO FRONT:C326(New process:C317(Current method name:C684;0;"$"+Current method name:C684;"_run";*))
				
				  //……………………………………………………………………
		End case 
		
		  //___________________________________________________________
	: ($Txt_entryPoint="Editor")
		
		  //___________________________________________________________
	: ($Txt_entryPoint="_run")
		
		  //First launch of this method executed in a new process
		Syntax_main ("_declarations")
		Syntax_main ("_init")
		
		  //$Lon_windowRef:=Open form window("syntaxPalette";Palette form window;On the left;At the top;*)
		$Lon_windowRef:=Open form window:C675("syntaxPalette";Plain form window:K39:10+4096;On the left:K39:2;At the top:K39:5;*)
		DIALOG:C40("syntaxPalette")
		
		Syntax_main ("_deinit")
		
		  //___________________________________________________________
	: ($Txt_entryPoint="_declarations")
		
		Compiler_SVG 
		COMPILER_Not_Thread_Safe 
		
		  //___________________________________________________________
	: ($Txt_entryPoint="_init")
		
		  //___________________________________________________________
	: ($Txt_entryPoint="_deinit")
		
		CLEAR LIST:C377(<>lst_syntax;*)
		
		  //___________________________________________________________
	Else 
		
		TRACE:C157
		
		  //___________________________________________________________
End case 