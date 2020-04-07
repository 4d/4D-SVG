//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_References_array
  // Created 16/06/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // Get the array of all the references created with the SVG_New, SVG_Copy or SVG_Open
  // and not released with SVG_CLEAR
  // ----------------------------------------------------
C_LONGINT:C283($0)
C_POINTER:C301($1)

C_TEXT:C284($kTxt_currentMethod)

If (False:C215)
	C_LONGINT:C283(SVG_References_array ;$0)
	C_POINTER:C301(SVG_References_array ;$1)
End if 

Compiler_SVG 

$kTxt_currentMethod:="SVG_References_array"  //Nom methode courante

Case of 
		
		  //______________________________________________________
	: (Count parameters:C259=0)
		
		ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Argument missing
		
		  //______________________________________________________
	: (Is nil pointer:C315($1))
		
		ASSERT:C1129(Component_putError (8851;$kTxt_currentMethod))  //Invalid type for an argument
		
		  //______________________________________________________
	: (Type:C295($1->)#Text array:K8:16)
		
		ASSERT:C1129(Component_putError (8851;$kTxt_currentMethod))  //Invalid type for an argument
		
		  //______________________________________________________
	Else 
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		If (Storage:C1525.svg.docs#Null:C1517)
			
			COLLECTION TO ARRAY:C1562(Storage:C1525.svg.docs;$1->)
			
		End if 
		
		$0:=Storage:C1525.svg.docs.length
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
		  //______________________________________________________
End case 