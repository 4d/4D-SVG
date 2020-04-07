//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_DELETE_OBJECT
  // Created 16/04/10 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($1)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_root;$kTxt_currentMethod;$Txt_svgObject)

If (False:C215)
	C_TEXT:C284(SVG_DELETE_OBJECT ;$1)
End if 

  // ----------------------------------------------------
  // Initialisations

Compiler_SVG 

$Lon_parameters:=Count parameters:C259

$kTxt_currentMethod:="SVG_DELETE_OBJECT"  //Nom methode courante

  // ----------------------------------------------------

If ($Lon_parameters>=1)
	
	$Txt_svgObject:=$1
	
	If (Asserted:C1132(xml_referenceValid ($Txt_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		$Dom_root:=DOM Get root XML element:C1053($Txt_svgObject)
		
		If (OK=1)\
			 & ($Dom_root#"0000000000000000")
			
			DOM REMOVE XML ELEMENT:C869($Txt_svgObject)
			
		Else 
			
			ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
			
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 