//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_PATTERN_CONTENT_UNITS
  // Created 07/04/10 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_svgObject;$kTxt_currentMethod;$Txt_name;$Txt_patternContentUnits)

If (False:C215)
	C_TEXT:C284(SVG_SET_PATTERN_CONTENT_UNITS ;$1)
	C_TEXT:C284(SVG_SET_PATTERN_CONTENT_UNITS ;$2)
End if 

  // ----------------------------------------------------
  // Initialisations
Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

  // ----------------------------------------------------
If ($Lon_parameters>=2)
	
	$Dom_svgObject:=$1
	$Txt_patternContentUnits:=$2
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM GET XML ELEMENT NAME:C730($Dom_svgObject;$Txt_name)
		
		If ($Txt_name="pattern")
			
			ARRAY TEXT:C222($tTxt_patternUnits;0x0000)
			COLLECTION TO ARRAY:C1562(Storage:C1525.svg["patternContentUnits"];$tTxt_patternUnits)
			
			If (Find in array:C230($tTxt_patternUnits;$Txt_patternContentUnits)>0)
				
				DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
					"patternContentUnits";$Txt_patternContentUnits)
				
			Else 
				
				ASSERT:C1129(Component_putError (8853;$kTxt_currentMethod))  //Invalid Value for an Attribute
				
			End if 
			
			  //#ACI0091143
			CLEAR VARIABLE:C89($tTxt_patternUnits)
			
		Else 
			
			ASSERT:C1129(Component_putError (8854))  //Impossible to apply this Command for this Node
			
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 