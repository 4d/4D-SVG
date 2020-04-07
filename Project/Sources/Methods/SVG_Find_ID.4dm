//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Find_ID
  // Created 23/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // Returns reference for the id
  // The command SVG_Find_ID returns the unique reference for the object with ID $1.
  // This reference is used by many other svg component commands and is referred to as an object's UID.
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_svgObject;$kTxt_currentMethod;$Txt_ID;$Txt_Name;$Txt_Reference)

If (False:C215)
	C_TEXT:C284(SVG_Find_ID ;$0)
	C_TEXT:C284(SVG_Find_ID ;$1)
	C_TEXT:C284(SVG_Find_ID ;$2)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_Find_ID"  //Nom methode courante

If ($Lon_parameters>=2)
	
	$Dom_svgObject:=$1
	$Txt_ID:=$2
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		  //Go back to the main node (<svg>) {
		DOM GET XML ELEMENT NAME:C730($Dom_svgObject;$Txt_Name)
		
		While (OK=1)\
			 & ($Txt_Name#"svg")\
			 & ($Txt_Name#"#document")
			
			$Dom_svgObject:=DOM Get parent XML element:C923($Dom_svgObject;$Txt_Name)
			
			If ($Txt_Name="#document")
				
				OK:=0
				
			End if 
		End while 
		  //}
		
		If (OK=1)
			
			Component_errorHandler ("init";$kTxt_currentMethod)
			
			$Txt_Reference:=DOM Find XML element by ID:C1010($Dom_svgObject;$Txt_ID)
			
			If (OK=1)
				
				$0:=$Txt_Reference
				
			Else 
				
				Component_putError (8855;$kTxt_currentMethod)  //The ID passed was not found
				
			End if 
			
		Else 
			
			ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
			
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 