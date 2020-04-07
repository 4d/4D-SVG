//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Project method : SVG_Color_from_index
  // ID[8C9B9F54F5D24E769D9F85C1B068BEB4]
  // Created 09/09/11 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  // Return RGB color from 4DPalette index (1-256)
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($0)
C_LONGINT:C283($1)

C_LONGINT:C283($Lon_index;$Lon_parameters)

ARRAY TEXT:C222($tTxt_color;0)

If (False:C215)
	C_TEXT:C284(SVG_Color_from_index ;$0)
	C_LONGINT:C283(SVG_Color_from_index ;$1)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

  // ----------------------------------------------------

If (Asserted:C1132($Lon_parameters>=1;Get localized string:C991("error_missingParameter")))
	
	$Lon_index:=$1
	
	Compiler_SVG 
	
	If (($Lon_index>0)\
		 & ($Lon_index<257))
		
		OB GET ARRAY:C1229(JSON Parse:C1218(Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"colors.json"));"indexed";$tTxt_color)
		
		$0:=$tTxt_color{$Lon_index}
		
	Else 
		
		ASSERT:C1129(Component_putError (8857;"SVG_Color_from_index"))  //Invalid Value for an Argument
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;Current method name:C684))  //Argument missing
	
End if 

  // ----------------------------------------------------
  // End