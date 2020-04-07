//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_FILL_RULE
  // Created 08/04/10 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // http://www.w3.org/TR/SVG/painting.html#FillRuleProperty
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_element;$kTxt_currentMethod;$Txt_fileRule;$Txt_name)

If (False:C215)
	C_TEXT:C284(SVG_SET_FILL_RULE ;$1)
	C_TEXT:C284(SVG_SET_FILL_RULE ;$2)
End if 

  // ----------------------------------------------------
  // Initialisations
Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

  // ----------------------------------------------------
If ($Lon_parameters>=2)
	
	$Dom_element:=$1
	$Txt_fileRule:=$2
	
	If (Asserted:C1132(xml_referenceValid ($Dom_element);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM GET XML ELEMENT NAME:C730($Dom_element;$Txt_name)
		
		ARRAY TEXT:C222($tTxt_objects;0x0000)
		COLLECTION TO ARRAY:C1562(Storage:C1525.svg["shapes"];$tTxt_objects)
		
		If (Find in array:C230($tTxt_objects;$Txt_Name)>0)
			
			ARRAY TEXT:C222($tTxt_fileRule;0x0000)
			COLLECTION TO ARRAY:C1562(Storage:C1525.svg["fill-rule"];$tTxt_fileRule)
			
			If (Find in array:C230($tTxt_fileRule;$Txt_fileRule)>0)
				
				DOM SET XML ATTRIBUTE:C866($Dom_element;\
					"fill-rule";$Txt_fileRule)
				
			Else 
				
				ASSERT:C1129(Component_putError (8853;$kTxt_currentMethod))  //Invalid Value for an Attribute
				
			End if 
			
			  //#ACI0091143
			CLEAR VARIABLE:C89($tTxt_fileRule)
			
		Else 
			
			ASSERT:C1129(Component_putError (8854))  //Impossible to apply this Command for this Node
			
		End if 
		
		  //#ACI0091143
		CLEAR VARIABLE:C89($tTxt_objects)
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 