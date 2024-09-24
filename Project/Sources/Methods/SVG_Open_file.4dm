//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_Open_file
// Created 17/07/08 by Vincent de Lachaux
// ----------------------------------------------------
// Description
// Open a svg file
// ----------------------------------------------------
#DECLARE($pathname : Text; $validate : Boolean) : Text

var $CURRENT_METHOD; $DTD; $root : Text

Compiler_SVG

$CURRENT_METHOD:="SVG_Open_file"

Case of 
		
		//______________________________________________________
	: (Count parameters:C259=0)
		
		ASSERT:C1129(Component_putError(8850; $CURRENT_METHOD))  // Parameters Missing
		
		//______________________________________________________
	: (Test path name:C476($pathname)#Is a document:K24:1)
		
		ASSERT:C1129(Component_putError(-43; $CURRENT_METHOD))  // File not found
		
		//______________________________________________________
	Else 
		
		$DTD:=Get 4D folder:C485(Current resources folder:K5:16)
		$DTD+="DTD"+Folder separator:K24:12+"svg10.dtd"
		
		If (Test path name:C476($DTD)#Is a document:K24:1)
			
			ASSERT:C1129(Component_putError(8856; $CURRENT_METHOD))  // The DTD file was not found
			
			return 
			
		End if 
		
		Component_errorHandler("init"; $CURRENT_METHOD)
		
		If ($validate)
			
			// Parse & validate
			$root:=DOM Parse XML source:C719($pathname; True:C214; $DTD)
			
		Else 
			
			$root:=DOM Parse XML source:C719($pathname)
			
		End if 
		
		If (Bool:C1537(OK))
			
			// Store the reference
			pushReference($root)
			
			return $root
			
		Else 
			
			// Keep the error
			ASSERT:C1129(Component_errorHandler("keep"))
			
		End if 
		
		ASSERT:C1129(Component_errorHandler("deinit"))
		
		//______________________________________________________
End case 