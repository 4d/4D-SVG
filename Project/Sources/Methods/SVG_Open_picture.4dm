//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_Open_picture
// Created 20/10/08 by Vincent de Lachaux
// ----------------------------------------------------
// Description
//
// ----------------------------------------------------
#DECLARE($picture : Picture) : Text

var $CURRENT_METHOD; $root : Text
var $blb : Blob

Compiler_SVG

$CURRENT_METHOD:="SVG_Open_picture"

Case of 
		
		//______________________________________________________
	: (Count parameters:C259=0)
		
		ASSERT:C1129(Component_putError(8850; $CURRENT_METHOD))  // Parameters Missing
		
		//______________________________________________________
	: (Picture size:C356($picture)=0)
		
		ASSERT:C1129(Component_putError(8857; $CURRENT_METHOD))  // Invalid Value for an Argument
		
		//______________________________________________________
	Else 
		
		Component_errorHandler("init"; $CURRENT_METHOD)
		
		Try
			
			PICTURE TO BLOB:C692($picture; $blb; ".svg")
			
			If (OK=1)
				
				$root:=DOM Parse XML variable:C720($blb)
				
				If (OK=1)
					
					// Store the reference
					pushReference($root)
					
				End if 
			End if 
			
		End try
		
		ASSERT:C1129(Component_errorHandler("deinit"))
		
		return $root
		
		//______________________________________________________
End case 