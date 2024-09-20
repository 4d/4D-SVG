//%attributes = {"invisible":true}
// ----------------------------------------------------
// Method : Component_about
// Created 17/09/08 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($action : Text)

var $window : Integer

If (Count parameters:C259=0)
	
	// This method must be executed in a new process
	BRING TO FRONT:C326(New process:C317(Current method name:C684; 0; Current method name:C684; "*"; *))
	
Else 
	
	$window:=Open form window:C675("About"; Plain form window:K39:10+4096; Horizontally centered:K39:1; Vertically centered:K39:4)
	DIALOG:C40("About")
	CLOSE WINDOW:C154
	
End if 