//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_SAVE_AS_TEXT
// Created 16/03/06
// Framework SVgg
// Author : Gérald Czwiklinski
// ----------------------------------------------------
// Modified by Vincent de Lachaux (16/06/08)
// 2004 -> v11
// ----------------------------------------------------
#DECLARE($svgObject : Text; $pathname : Text)

var $CURRENT_METHOD; $t : Text

Compiler_SVG

$CURRENT_METHOD:="SVG_SAVE_AS_TEXT"

If (Count parameters:C259=0)
	
	ASSERT:C1129(Component_putError(8850; $CURRENT_METHOD))  // Parameters Missing
	
	return 
	
End if 

If (Asserted:C1132(xml_referenceValid($svgObject); Localized string:C991("error_badReference")))
	
	Component_errorHandler("init"; $CURRENT_METHOD)
	
	// Mark:ACI0063507
	If (Length:C16($pathname)>0)\
		 && (Position:C15(Folder separator:K24:12; $pathname)=0)
		
		$pathname:=Get 4D folder:C485(Database folder:K5:14; *)+$pathname
		
	End if 
	
	// Turn_around #ACI0093875
	// Mark:ACI0093774
	DOM EXPORT TO VAR:C863($svgObject; $t)
	$t:=Replace string:C233($t; " xmlns=\"\""; "")
	$t:=DOM Parse XML variable:C720($t)
	DOM EXPORT TO FILE:C862($t; $pathname)
	DOM CLOSE XML:C722($t)
	
	If (Bool:C1537(OK))
		
		If (Num:C11(Storage:C1525.svg.variableDocument)>0)
			
			CALL WORKER:C1389(1; "fallBack_Not_thread_safe"; New object:C1471(\
				"document"; DOCUMENT))
			
		End if 
	End if 
	
	ASSERT:C1129(Component_errorHandler("deinit"))
	
Else 
	
	ASSERT:C1129(Component_putError(8852; $CURRENT_METHOD))  // The reference is not a svg object
	
End if 