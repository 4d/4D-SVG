//%attributes = {"invisible":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Project method : xml_remove_attribute
  // ID[B0A9467A327349E18F9561833BE4B74F]
  // Created 01/07/11 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  // Remove an attribute without error ( if exist)
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_attributes;$Lon_i;$Lon_parameters)
C_TEXT:C284($Dom_element;$Txt_attribute;$Txt_name;$Txt_value)

If (False:C215)
	C_TEXT:C284(xml_remove_attribute ;$1)
	C_TEXT:C284(xml_remove_attribute ;$2)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=2;Get localized string:C991("error_missingParameter")))
	
	$Dom_element:=$1
	$Txt_attribute:=$2
	
Else 
	
	ABORT:C156
	
End if 

  // ----------------------------------------------------

$Lon_attributes:=DOM Count XML attributes:C727($Dom_element)

For ($Lon_i;1;$Lon_attributes;1)
	
	DOM GET XML ATTRIBUTE BY INDEX:C729($Dom_element;$Lon_i;$Txt_name;$Txt_value)
	
	If ($Txt_name=$Txt_attribute)
		
		DOM REMOVE XML ATTRIBUTE:C1084($Dom_element;$Txt_name)
		$Lon_i:=MAXLONG:K35:2-1
		
	End if 
End for 

  // ----------------------------------------------------
  // End