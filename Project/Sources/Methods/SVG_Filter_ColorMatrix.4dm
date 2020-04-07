//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Filter_ColorMatrix
  // Created 17/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)
C_TEXT:C284($3)
C_TEXT:C284($4)
C_TEXT:C284($5)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_svgObject;$Dom_svgReference;$kTxt_currentMethod;$Txt_in;$Txt_name;$Txt_result)
C_TEXT:C284($Txt_type;$Txt_values)

If (False:C215)
	C_TEXT:C284(SVG_Filter_ColorMatrix ;$0)
	C_TEXT:C284(SVG_Filter_ColorMatrix ;$1)
	C_TEXT:C284(SVG_Filter_ColorMatrix ;$2)
	C_TEXT:C284(SVG_Filter_ColorMatrix ;$3)
	C_TEXT:C284(SVG_Filter_ColorMatrix ;$4)
	C_TEXT:C284(SVG_Filter_ColorMatrix ;$5)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Dom_svgObject:=$1
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		DOM GET XML ELEMENT NAME:C730($Dom_svgObject;$Txt_name)
		
		If ($Txt_name="filter")
			
			If ($Lon_parameters>=2)  //in
				
				$Txt_in:=$2
				
				If ($Lon_parameters>=3)  //result
					
					$Txt_result:=$3
					
					If ($Lon_parameters>=4)  //type
						
						$Txt_type:=$4
						
						If ($Lon_parameters>=5)  //values
							
							$Txt_values:=$5
							
						End if 
					End if 
				End if 
			End if 
			
			Component_errorHandler ("init";$kTxt_currentMethod)
			
			$Dom_svgReference:=DOM Create XML element:C865($Dom_svgObject;"feColorMatrix")
			
			If (OK=1)\
				 & (Length:C16($Txt_in)>0)
				
				If (Position:C15($Txt_in+"|";Storage:C1525.svg.fe_inValues)>0)
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
						"in";$Txt_in)
					
				Else 
					
					ASSERT:C1129(Component_putError (8853))  //Invalid Value for an attribute
					
				End if 
			End if 
			
			If (OK=1)\
				 & (Length:C16($Txt_result)>0)
				
				DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
					"result";$Txt_result)
				
			End if 
			
			If (OK=1)\
				 & (Length:C16($Txt_type)>0)
				
				If (Position:C15($Txt_type+"|";Storage:C1525.svg.feColorMatrix_typeValues)>0)
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
						"type";$Txt_type)
					
				Else 
					
					ASSERT:C1129(Component_putError (8853))  //Invalid Value for an attribute
					
				End if 
			End if 
			
			If (OK=1)\
				 & (Length:C16($Txt_values)>0)
				
				DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
					"values";$Txt_values)
				
			End if 
			
			If (OK=1)
				
				  //Set the id
				If (Storage:C1525.svg.options ?? 1)
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
						"id";$Dom_svgReference)
					
				End if 
				
				If (OK=1)
					
					$0:=$Dom_svgReference
					
				End if 
			End if 
			
			ASSERT:C1129(Component_errorHandler ("deinit"))
			
		Else 
			
			ASSERT:C1129(Component_putError (8854;$kTxt_currentMethod))  //Impossible to apply this Command for this Node
			
		End if 
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 