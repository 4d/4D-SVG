//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_SAVE_AS_PICTURE
// Created 16/03/06
// Framework SVgg
// Author : Gérald Czwiklinski
// ----------------------------------------------------
// Modified by Vincent de Lachaux (16/06/08)
// 2004 -> v11
// ----------------------------------------------------
#DECLARE($svgObject : Text; $pathname : Text; $codec : Text)

var $CURRENT_METHOD; $name; $patern; $root; $t : Text
var $image : Picture

Compiler_SVG

$CURRENT_METHOD:="SVG_SAVE_AS_PICTURE"

If (Count parameters:C259<2)
	
	ASSERT:C1129(Component_putError(8850; $CURRENT_METHOD))  // Parameters Missing
	
	return 
	
End if 

If (Length:C16($pathname)>0)\
 && (Position:C15(Folder separator:K24:12; $pathname)=0)
	
	$pathname:=Get 4D folder:C485(Database folder:K5:14; *)+$pathname
	
End if 

// Mark:ACI0093774
If (Length:C16($codec)=0)
	
	// Get extension
	If (Length:C16($pathname)#0)
		
		// Mark:ACI0098413
		$patern:="(?mi-s)(\\.[.]*)$"
		ARRAY TEXT:C222($_result; 0x0000)
		
		If (Rgx_ExtractText($patern; $pathname; "1"; ->$_result)=0)
			
			$codec:=$_result{1}
			
		End if 
	End if 
End if 

$codec:=Length:C16($codec)=0 ? "image/png" : $codec

$root:=DOM Get root XML element:C1053($svgObject)
DOM GET XML ELEMENT NAME:C730($root; $name)

If ($name#"svg")
	
	ASSERT:C1129(Component_putError(8852; $CURRENT_METHOD))  // The reference is not a svg object
	
	return 
	
End if 

Component_errorHandler("init"; $CURRENT_METHOD)

If (Test path name:C476($pathname)=Is a document:K24:1)
	
	DELETE DOCUMENT:C159($pathname)
	
Else 
	
	OK:=1
	
End if 

If (Bool:C1537(OK))
	
	// Turn_around #ACI0093875
	// Mark:ACI0093774
	DOM EXPORT TO VAR:C863($svgObject; $t)
	$t:=Replace string:C233($t; " xmlns=\"\""; "")
	$t:=DOM Parse XML variable:C720($t)
	SVG EXPORT TO PICTURE:C1017($t; $image)
	DOM CLOSE XML:C722($t)
	
	If (Bool:C1537(OK))
		
		WRITE PICTURE FILE:C680($pathname; $image; $codec)
		
		If (Bool:C1537(OK))
			
			// If (Not(Is nil pointer(<>Ptr_Document)))
			// <>Ptr_Document->:=DOCUMENT
			// End if
			
			If (Num:C11(Storage:C1525.svg.variableDocument)>0)
				
				CALL WORKER:C1389(1; "fallBack_Not_thread_safe"; New object:C1471(\
					"document"; DOCUMENT))
				
			End if 
			
		Else 
			
			ASSERT:C1129(Component_putError(8858; $CURRENT_METHOD))  // Unknown error
			
		End if 
	End if 
End if 

ASSERT:C1129(Component_errorHandler("deinit"))