//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Export_to_XML
  // Created 02/09/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (08/12/09)
  // ACI0064079
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)

C_LONGINT:C283($Lon_i;$Lon_parameters)
C_TEXT:C284($kTxt_currentMethod;$Txt_buffer;$Txt_name;$Txt_svgObject;$Txt_value)

If (False:C215)
	C_TEXT:C284(SVG_Export_to_XML ;$0)
	C_TEXT:C284(SVG_Export_to_XML ;$1)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=1)
	
	$Txt_svgObject:=$1
	
	If (Asserted:C1132(xml_referenceValid ($Txt_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		  //http://forums.4d.fr/Post/FR/6124839/1/6134419#6134419 {
		DOM GET XML ELEMENT NAME:C730($Txt_svgObject;$Txt_name)
		
		If ($Txt_name="image")
			
			For ($Lon_i;1;DOM Count XML attributes:C727($Txt_svgObject);1)
				
				DOM GET XML ATTRIBUTE BY INDEX:C729($Txt_svgObject;$Lon_i;$Txt_name;$Txt_value)
				
				If ($Txt_name="xlink:href")
					
					DOM SET XML ATTRIBUTE:C866($Txt_svgObject;\
						"xmlns:xlink";"http://www.w3.org/1999/xlink")
					
					$Lon_i:=MAXLONG:K35:2-1
					
				End if 
			End for 
		End if 
		  //}
		
		DOM EXPORT TO VAR:C863($Txt_svgObject;$Txt_buffer)
		
		If (OK=1)
			
			  //       ___________________
			  //  /   ACI00
			  // ||   Date 07/12/11
			  //(   ) Vincent de Lachaux
			  //       ___________________
			  //Sometimes the command return a string without the first <
			  //       ___________________
			If (Position:C15("<";$Txt_buffer)#1)
				
				$Txt_buffer:="<"+$Txt_buffer
				
			End if 
			
			  //       ___________________
			
			$0:=$Txt_buffer
			
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 