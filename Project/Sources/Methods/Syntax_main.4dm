//%attributes = {"invisible":true}
// ----------------------------------------------------
// Method : Syntax_main
// Created 16/09/08 by vdl
// ----------------------------------------------------
#DECLARE($action : Text)

var $winRef : Integer

Case of 
		
		//___________________________________________________________
	: (Length:C16($action)=0)
		
		Case of 
				
				//……………………………………………………………………
			: (Method called on error:C704=Current method name:C684)
				
				//……………………………………………………………………
			Else 
				
				// This method must be executed in a new process
				BRING TO FRONT:C326(New process:C317(Current method name:C684; 0; "$"+Current method name:C684; "_run"; *))
				
				//……………………………………………………………………
		End case 
		
		//___________________________________________________________
		
	: ($action="Editor")
		
		//___________________________________________________________
	: ($action="_run")
		
		// First launch of this method executed in a new process
		Compiler_SVG
		COMPILER_Not_Thread_Safe
		
		$winRef:=Open form window:C675("syntaxPalette"; Plain form window:K39:10+4096; On the left:K39:2; At the top:K39:5; *)
		DIALOG:C40("syntaxPalette")
		
		CLEAR LIST:C377(<>lst_syntax; *)
		
		//___________________________________________________________
End case 