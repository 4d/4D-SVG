//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_FILTER
  // Created 04/09/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($kTxt_currentMethod;$Txt_Buffer;$Txt_parentReference;$Txt_rootReference;$Txt_URL)

If (False:C215)
	C_TEXT:C284(SVG_SET_FILTER ;$1)
	C_TEXT:C284(SVG_SET_FILTER ;$2)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Txt_parentReference:=$1
	$Txt_URL:=$2
	
	If (Asserted:C1132(xml_referenceValid ($Txt_parentReference);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		  //First, go back to the main node (<SVG>)...
		$Txt_rootReference:=DOM Get root XML element:C1053($Txt_parentReference)
		
		If (OK=1)
			
			  //Add the xmlns:link
			  //{
			DOM SET XML ATTRIBUTE:C866($Txt_rootReference;\
				"xmlns:xlink";"http://www.w3.org/1999/xlink")
			  //}
			
			If ($Txt_URL="none")
				
				DOM SET XML ATTRIBUTE:C866($Txt_parentReference;\
					"filter";$Txt_URL)
				
			Else 
				
				$Txt_Buffer:=DOM Find XML element by ID:C1010($Txt_rootReference;$Txt_URL)
				
				If (OK=1)
					
					DOM SET XML ATTRIBUTE:C866($Txt_parentReference;\
						"filter";"url(#"+$Txt_URL+")")
					
				Else 
					
					ASSERT:C1129(Component_putError (8855))  //8855 = The ID passed was not found
					
				End if 
			End if 
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 