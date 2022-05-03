//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method: SVG_SET_OPACITY
// Date et heure : 16/03/06, 10:07:53
// Framework SVgg
// Author : Gérald Czwiklinski
// ----------------------------------------------------
// Modified by Vincent de Lachaux (01/07/08)
// 2004 -> v11
// ----------------------------------------------------
// Modified by Vincent de Lachaux (17/11/11)
// When the command is called with a reference to the SVG root
// it's the attribute "viewport-fill-opacity" that will be set
// ----------------------------------------------------
// Modified by Vincent de Lachaux (28/01/2022)
// Fix ACI0102651
// ----------------------------------------------------
C_TEXT:C284($1)
C_LONGINT:C283($2)
C_LONGINT:C283($3)

C_BOOLEAN:C305($Boo_container)
C_LONGINT:C283($Lon_fillOpacity; $Lon_parameters; $Lon_strokeOpacity)
C_TEXT:C284($Dom_object; $kTxt_currentMethod; $Txt_name)

If (False:C215)
	C_TEXT:C284(SVG_SET_OPACITY; $1)
	C_LONGINT:C283(SVG_SET_OPACITY; $2)
	C_LONGINT:C283(SVG_SET_OPACITY; $3)
End if 

Compiler_SVG

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Dom_object:=$1
	$Lon_fillOpacity:=$2
	
	$Lon_strokeOpacity:=$Lon_fillOpacity
	
	If ($Lon_parameters>=3)
		
		$Lon_strokeOpacity:=$3
		
	End if 
	
	DOM GET XML ELEMENT NAME:C730($Dom_object; $Txt_name)
	
	ARRAY TEXT:C222($tTxt_objects; 0x0000)
	COLLECTION TO ARRAY:C1562(Storage:C1525.svg["Containers"]; $tTxt_objects)
	
	$Boo_container:=((Find in array:C230($tTxt_objects; $Txt_name)>0) | ($Txt_name="image"))
	
	If (Asserted:C1132(xml_referenceValid($Dom_object); Get localized string:C991("error_badReference")))
		
		Component_errorHandler("init"; $kTxt_currentMethod)
		
		If ($Dom_object=DOM Get root XML element:C1053($Dom_object))
			
			DOM SET XML ATTRIBUTE:C866($Dom_object; \
				"viewport-fill-opacity"; $Lon_fillOpacity/100)
			
		Else 
			
			If ($Boo_container)
				
				If ($Lon_fillOpacity#-1)  // ACI0102651
					
					DOM SET XML ATTRIBUTE:C866($Dom_object; \
						"opacity"; $Lon_fillOpacity/100)
					
				End if 
				
			Else 
				
				If ($Lon_fillOpacity#-1)
					
					DOM SET XML ATTRIBUTE:C866($Dom_object; \
						"fill-opacity"; $Lon_fillOpacity/100)
					
				End if 
				
				If (OK=1)\
					 & ($Lon_strokeOpacity#-1)
					
					DOM SET XML ATTRIBUTE:C866($Dom_object; \
						"stroke-opacity"; $Lon_strokeOpacity/100)
					
				End if 
			End if 
		End if 
		
		ASSERT:C1129(Component_errorHandler("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError(8852; $kTxt_currentMethod))  // The reference is not a svg object
		
	End if 
	
	// #ACI0091143
	CLEAR VARIABLE:C89($tTxt_objects)
	
Else 
	
	ASSERT:C1129(Component_putError(8850; $kTxt_currentMethod))  // Parameters Missing
	
End if 