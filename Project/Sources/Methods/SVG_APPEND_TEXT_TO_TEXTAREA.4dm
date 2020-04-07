//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_APPEND_TEXT_TO_TEXTAREA
  // Created 16/04/10 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_parameters;$Lon_x)
C_TEXT:C284($Dom_buffer;$Dom_svgObject;$kTxt_currentMethod;$Txt_Buffer;$Txt_name;$Txt_text)

If (False:C215)
	C_TEXT:C284(SVG_APPEND_TEXT_TO_TEXTAREA ;$1)
	C_TEXT:C284(SVG_APPEND_TEXT_TO_TEXTAREA ;$2)
End if 

  // ----------------------------------------------------
  // Initialisations

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_APPEND_TEXT_TO_TEXTAREA"  //Nom methode courante

  // ----------------------------------------------------

If ($Lon_parameters>=2)
	
	$Dom_svgObject:=$1
	$Txt_text:=$2  //String to write
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM GET XML ELEMENT NAME:C730($Dom_svgObject;$Txt_name)
		
		If ($Txt_name="textArea")
			
			If (Length:C16($Txt_text)>0)
				
				  // 25-1-2017 - Encode special characters
				  // #ACI0097138
				  //$Txt_text:=xml_Escape_characters ($Txt_text)
				
				Repeat 
					
					$Lon_x:=Position:C15("\r";$Txt_text)
					
					If ($Lon_x=0)
						
						$Lon_x:=Position:C15("\n";$Txt_text)
						
					End if 
					
					If ($Lon_x>0)
						
						$Txt_Buffer:=Substring:C12($Txt_text;1;$Lon_x-1)
						
						If (Length:C16($Txt_Buffer)>0)
							
							$Dom_buffer:=DOM Append XML child node:C1080($Dom_svgObject;XML DATA:K45:12;$Txt_Buffer)
							
						End if 
						
						$Dom_buffer:=DOM Append XML child node:C1080($Dom_svgObject;XML ELEMENT:K45:20;"tbreak")
						
						$Txt_text:=Delete string:C232($Txt_text;1;Length:C16($Txt_Buffer)+1)
						
					Else 
						
						If (Length:C16($Txt_text)>0)
							
							$Dom_buffer:=DOM Append XML child node:C1080($Dom_svgObject;XML DATA:K45:12;$Txt_text)
							
						End if 
					End if 
				Until ($Lon_x=0)\
					 | (OK=0)
				
			End if 
			
		Else 
			
			ASSERT:C1129(Component_putError (8854;$kTxt_currentMethod))  //Impossible to apply this Command for this Node
			
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 