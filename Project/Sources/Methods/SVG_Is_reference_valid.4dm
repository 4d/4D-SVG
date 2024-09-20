//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_Is_reference_valid
// Created 17/06/08 by Vincent de Lachaux
// ----------------------------------------------------
// Description
// To test whether a given Reference value is a valid SVG element reference
// ----------------------------------------------------
// Modified by Vincent de Lachaux (16/04/10)
// v12 simplification
C_BOOLEAN:C305($0)
C_TEXT:C284($1)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_root; $Dom_svgObject; $kTxt_currentMethod; $Txt_name)

If (False:C215)
	C_BOOLEAN:C305(SVG_Is_reference_valid; $0)
	C_TEXT:C284(SVG_Is_reference_valid; $1)
End if 

Compiler_SVG

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_Is_reference_valid"  //Nom methode courante

If ($Lon_parameters>=1)
	
	$Dom_svgObject:=$1
	
	// Modified by Vincent de Lachaux (31/05/12)
	//ACI0076861
	Component_errorHandler("ERROR_OFF")
	
	$Dom_root:=DOM Get root XML element:C1053($Dom_svgObject)
	
	Component_errorHandler("ERROR_ON")
	
	If (OK=1)
		
		//Verify the root name
		DOM GET XML ELEMENT NAME:C730($Dom_root; $Txt_name)
		
	End if 
	
	$0:=($Txt_name="svg")
	
Else 
	
	ASSERT:C1129(Component_putError(8850; $kTxt_currentMethod))  //Parameters Missing
	
End if 