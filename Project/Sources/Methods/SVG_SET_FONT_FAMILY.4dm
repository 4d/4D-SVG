//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_FONT_FAMILY
  // Created 16/03/06, 10:07:53
  // Framework SVgg
  // Author : Gérald Czwiklinski
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (10/07/08)
  // 2004 -> v11
  // ----------------------------------------------------
C_TEXT:C284($1)
C_TEXT:C284(${2})

C_LONGINT:C283($Lon_i;$Lon_parameters)
C_TEXT:C284($Dom_svgObject;$kTxt_currentMethod;$Txt_buffer;$Txt_fontFamily;$Txt_Name)

If (False:C215)
	C_TEXT:C284(SVG_SET_FONT_FAMILY ;$1)
	C_TEXT:C284(SVG_SET_FONT_FAMILY ;${2})
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_SET_FONT_FAMILY"  //Nom methode courante

If ($Lon_parameters>=2)
	
	$Dom_svgObject:=$1
	
	If ($Lon_parameters=2)
		
		$Txt_fontFamily:=$2
		
		If (Position:C15("'";$Txt_fontFamily)#1)
			
			If (Storage:C1525.svg["Generic Font Family"].indexOf($Txt_fontFamily)=-1)
				
				$Txt_fontFamily:="'"+$Txt_fontFamily+"'"
				
			End if 
		End if 
		
	Else 
		
		For ($Lon_i;2;$Lon_parameters;1)
			
			$Txt_buffer:=${$Lon_i}
			
			If (Position:C15("'";$Txt_buffer)#1)
				
				If (Storage:C1525.svg["Generic Font Family"].indexOf($Txt_buffer)=-1)
					
					$Txt_buffer:="'"+$Txt_buffer+"'"
					
				End if 
			End if 
			
			$Txt_fontFamily:=$Txt_fontFamily+$Txt_buffer+Choose:C955($Lon_i<$Lon_parameters;",";"")
			
		End for 
		
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM GET XML ELEMENT NAME:C730($Dom_svgObject;$Txt_Name)
		
		ARRAY TEXT:C222($tTxt_objects;0x0000)
		COLLECTION TO ARRAY:C1562(Storage:C1525.svg["text content element"];$tTxt_objects)
		
		If (Find in array:C230($tTxt_objects;$Txt_Name)>0)
			
			DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
				"font-family";$Txt_fontFamily)
			
			ASSERT:C1129(Component_errorHandler ("deinit"))
			
		Else 
			
			ASSERT:C1129(Component_putError (8854))  //Impossible to apply this Command for this Node
			
		End if 
		
		  //#ACI0091143
		CLEAR VARIABLE:C89($tTxt_objects)
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 