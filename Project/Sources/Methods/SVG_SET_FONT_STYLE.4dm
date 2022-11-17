//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_SET_FONT_STYLE
// Created 10/07/08 by Vincent de Lachaux
// ----------------------------------------------------
// Description
//
// ----------------------------------------------------
C_TEXT:C284($1)
C_LONGINT:C283($2)

C_LONGINT:C283($Lon_fontStyles; $Lon_parameters)
C_TEXT:C284($Dom_svgObject; $kTxt_currentMethod; $Txt_Name)

If (False:C215)
	C_TEXT:C284(SVG_SET_FONT_STYLE; $1)
	C_LONGINT:C283(SVG_SET_FONT_STYLE; $2)
End if 

Compiler_SVG

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_SET_FONT_STYLE"  //Nom methode courante

If ($Lon_parameters>=2)
	
	$Dom_svgObject:=$1
	$Lon_fontStyles:=$2
	
	If (Asserted:C1132(xml_referenceValid($Dom_svgObject); Get localized string:C991("error_badReference")))
		
		Component_errorHandler("init"; $kTxt_currentMethod)
		
		DOM GET XML ELEMENT NAME:C730($Dom_svgObject; $Txt_Name)
		
		ARRAY TEXT:C222($tTxt_objects; 0x0000)
		COLLECTION TO ARRAY:C1562(Storage:C1525.svg["text content element"]; $tTxt_objects)
		
		
		If (Find in array:C230($tTxt_objects; $Txt_Name)>0)
			
			If ($Lon_fontStyles=0)
				
				DOM SET XML ATTRIBUTE:C866($Dom_svgObject; \
					"text-decoration"; "none")
				
				If (OK=1)
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgObject; \
						"font-style"; "normal")
					
					If (OK=1)
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgObject; \
							"font-weight"; "normal")
						
					End if 
				End if 
				
			Else 
				
				setFontStyles($Dom_svgObject; $Lon_fontStyles)
				
			End if 
			
			ASSERT:C1129(Component_errorHandler("deinit"))
			
		Else 
			
			ASSERT:C1129(Component_putError(8854))  //Impossible to apply this Command for this Node
			
		End if 
		
		//#ACI0091143
		CLEAR VARIABLE:C89($tTxt_objects)
		
	Else 
		
		ASSERT:C1129(Component_putError(8852; $kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError(8850; $kTxt_currentMethod))  //Parameters Missing
	
End if 