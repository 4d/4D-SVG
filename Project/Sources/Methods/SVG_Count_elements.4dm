//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Count_elements
  // Created 23/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // The command SVG_Count_elements returns the number of objects in node refernced by $1.
  // Groups appear as a single object.
  // You can get information about objects in a group by passing the group reference
  // ----------------------------------------------------
C_LONGINT:C283($0)
C_TEXT:C284($1)

C_LONGINT:C283($Lon_Count;$Lon_parameters)
C_TEXT:C284($Dom_svgObject;$kTxt_currentMethod;$kTxt_graphicElements;$Txt_name;$Txt_objectID)

If (False:C215)
	C_LONGINT:C283(SVG_Count_elements ;$0)
	C_TEXT:C284(SVG_Count_elements ;$1)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=1)
	
	$Dom_svgObject:=$1
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		$kTxt_graphicElements:="path|text|textarea|rect|circle|ellipse|line|polyline|polygon|image|use|g|a|"
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		$Txt_objectID:=DOM Get first child XML element:C723($Dom_svgObject;$Txt_name)
		
		If (OK=1)
			
			$Lon_Count:=$Lon_count+Num:C11(Position:C15($Txt_name+"|";$kTxt_graphicElements)>0)
			
			Repeat 
				
				$Txt_objectID:=DOM Get next sibling XML element:C724($Txt_objectID;$Txt_name)
				
				If (OK=1)
					
					$Lon_Count:=$Lon_count+Num:C11(Position:C15($Txt_name+"|";$kTxt_graphicElements)>0)
					
				End if 
			Until (OK=0)
			
			OK:=1
			
			$0:=$Lon_Count
			
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 