//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_ELEMENTS_TO_ARRAYS
  // Created 23/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)
C_POINTER:C301($2)
C_POINTER:C301($3)
C_POINTER:C301($4)

C_LONGINT:C283($Lon_parameters)
C_POINTER:C301($Ptr_arrayIDs;$Ptr_arrayReferences;$Ptr_arrayTypes)
C_TEXT:C284($Dom_svgObject;$kTxt_currentMethod;$kTxt_graphicElements;$Txt_ID;$Txt_name)

If (False:C215)
	C_TEXT:C284(SVG_ELEMENTS_TO_ARRAYS ;$1)
	C_POINTER:C301(SVG_ELEMENTS_TO_ARRAYS ;$2)
	C_POINTER:C301(SVG_ELEMENTS_TO_ARRAYS ;$3)
	C_POINTER:C301(SVG_ELEMENTS_TO_ARRAYS ;$4)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Dom_svgObject:=$1
	$Ptr_arrayReferences:=$2
	DELETE FROM ARRAY:C228($Ptr_arrayReferences->;Num:C11(Size of array:C274($Ptr_arrayReferences->)>0);Size of array:C274($Ptr_arrayReferences->))
	
	If ($Lon_parameters>=3)
		
		$Ptr_arrayTypes:=$3
		DELETE FROM ARRAY:C228($Ptr_arrayTypes->;Num:C11(Size of array:C274($Ptr_arrayTypes->)>0);Size of array:C274($Ptr_arrayTypes->))
		
		If ($Lon_parameters>=4)
			
			$Ptr_arrayIDs:=$4
			DELETE FROM ARRAY:C228($Ptr_arrayIDs->;Num:C11(Size of array:C274($Ptr_arrayIDs->)>0);Size of array:C274($Ptr_arrayIDs->))
			
		End if 
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		  //       ___________________
		  //  /   ACI0062694
		  // ||   Date 15/07/09
		  //(   ) Vincent de Lachaux
		  //       ___________________
		  //$kTxt_graphicElements:="'|path|text|rect|circle|ellipse|line|polyline|polygon|image|use|g|a|"
		$kTxt_graphicElements:="'|path|text|textArea|rect|circle|ellipse|line|polyline|polygon|image|use|g|a|"
		
		  //       ___________________
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		$Dom_svgObject:=DOM Get first child XML element:C723($Dom_svgObject;$Txt_name)
		
		If (OK=1)
			
			If (Position:C15("|"+$Txt_name+"|";$kTxt_graphicElements)>0)
				
				APPEND TO ARRAY:C911($Ptr_arrayReferences->;$Dom_svgObject)
				
				If ($Lon_parameters>=3)
					
					APPEND TO ARRAY:C911($Ptr_arrayTypes->;$Txt_name)
					
					If ($Lon_parameters>=4)
						
						$Txt_ID:=""
						
						Component_errorHandler ("ERROR_OFF")
						
						DOM GET XML ATTRIBUTE BY NAME:C728($Dom_svgObject;"id";$Txt_ID)
						
						Component_errorHandler ("ERROR_ON")
						
						APPEND TO ARRAY:C911($Ptr_arrayIDs->;$Txt_ID)
						
						OK:=1
						
					End if 
				End if 
			End if 
			
			Repeat 
				
				$Dom_svgObject:=DOM Get next sibling XML element:C724($Dom_svgObject;$Txt_name)
				
				If (OK=1)\
					 & (Position:C15("|"+$Txt_name+"|";$kTxt_graphicElements)>0)
					
					APPEND TO ARRAY:C911($Ptr_arrayReferences->;$Dom_svgObject)
					
					If ($Lon_parameters>=3)
						
						APPEND TO ARRAY:C911($Ptr_arrayTypes->;$Txt_name)
						
						If ($Lon_parameters>=4)
							
							$Txt_ID:=""
							
							Component_errorHandler ("ERROR_OFF")
							
							DOM GET XML ATTRIBUTE BY NAME:C728($Dom_svgObject;"id";$Txt_ID)
							
							Component_errorHandler ("ERROR_ON")
							
							APPEND TO ARRAY:C911($Ptr_arrayIDs->;$Txt_ID)
							
							OK:=1
							
						End if 
					End if 
				End if 
			Until (OK=0)
			
			OK:=1
			
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 