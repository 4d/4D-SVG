//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_New_group
  // Created 16/03/06
  // Framework SVgg
  // Author : Gérald Czwiklinski
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (01/07/08)
  // 2004 -> v11
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)
C_TEXT:C284($3)
C_TEXT:C284($4)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_svgObject;$Dom_svgReference;$kTxt_currentMethod;$Txt_ID;$Txt_rootReference;$Txt_Target)
C_TEXT:C284($Txt_URL)

If (False:C215)
	C_TEXT:C284(SVG_New_group ;$0)
	C_TEXT:C284(SVG_New_group ;$1)
	C_TEXT:C284(SVG_New_group ;$2)
	C_TEXT:C284(SVG_New_group ;$3)
	C_TEXT:C284(SVG_New_group ;$4)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=1)
	
	$Dom_svgObject:=$1
	
	If ($Lon_parameters>=2)
		
		$Txt_ID:=$2
		
		If ($Lon_parameters>=3)
			
			$Txt_URL:=$3
			
			If ($Lon_parameters>=4)
				
				$Txt_Target:=$4
				
			End if 
		End if 
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		If (Length:C16($Txt_URL)=0)  //Just a  group
			
			$Dom_svgReference:=DOM Create XML element:C865($Dom_svgObject;"g")
			
		Else   //It is a link
			
			  //Add the xmlns:link {
			  //First, go back to the main node (<SVG>)...
			$Txt_rootReference:=DOM Get root XML element:C1053($Dom_svgObject)
			
			  //Then define the attribute
			DOM SET XML ATTRIBUTE:C866($Txt_rootReference;\
				"xmlns:xlink";"http://www.w3.org/1999/xlink")
			  //}
			
			$Dom_svgReference:=DOM Create XML element:C865($Dom_svgObject;"a";\
				"xlink:href";$Txt_URL)
			
		End if 
		
		If (OK=1)
			
			Case of 
					
					  //…………………………………………………
				: (Length:C16($Txt_Target)=0)\
					 | ($Txt_Target="none")
					
					  //…………………………………………………
				: ($Txt_Target="new")
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
						"target";"_blank")
					
					  //…………………………………………………
				Else 
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
						"target";$Txt_Target)
					
					  //…………………………………………………
			End case 
			
			If (OK=1)
				
				  //Set the id {
				If (Storage:C1525.svg.options ?? 1)
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
						"id";$Dom_svgReference)
					
				Else 
					
					If (Length:C16($Txt_ID)>0)
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
							"id";$Txt_ID)
						
					End if 
				End if 
				  //}
				
				If (OK=1)
					
					$0:=$Dom_svgReference
					
				End if 
			End if 
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 