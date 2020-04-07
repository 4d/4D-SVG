//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Set_description
  // Created 21/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_svgObject;$Dom_svgReference;$kTxt_currentMethod;$Txt_description;$Txt_name)

If (False:C215)
	C_TEXT:C284(SVG_Set_description ;$0)
	C_TEXT:C284(SVG_Set_description ;$1)
	C_TEXT:C284(SVG_Set_description ;$2)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_Set_description"  //Nom methode courante

If ($Lon_parameters>=2)
	
	$Dom_svgObject:=$1
	$Txt_description:=$2
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM GET XML ELEMENT NAME:C730($Dom_svgObject;$Txt_name)
		
		ARRAY TEXT:C222($tTxt_objects;0x0000)
		COLLECTION TO ARRAY:C1562(Storage:C1525.svg["Containers_or_Graphics"];$tTxt_objects)
		
		If (Find in array:C230($tTxt_objects;$Txt_name)>0)
			
			$Dom_svgReference:=DOM Create XML element:C865($Dom_svgObject;"desc")
			
			If (OK=1)
				
				DOM SET XML ELEMENT VALUE:C868($Dom_svgReference;$Txt_description)
				
				If (OK=1)
					
					  //Set the id {
					If (Storage:C1525.svg.options ?? 1)
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
							"id";$Dom_svgReference)
						
					End if 
					  //}
					
					If (OK=1)
						
						$0:=$Dom_svgReference
						
					End if 
				End if 
			End if 
			
		Else 
			
			ASSERT:C1129(Component_putError (8854))  //Impossible to apply this Command for this Node
			
		End if 
		
		  //#ACI0091143
		CLEAR VARIABLE:C89($tTxt_objects)
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 