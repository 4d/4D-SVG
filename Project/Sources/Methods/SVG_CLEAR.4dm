//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_CLEAR
  // Date et heure : 16/03/06, 10:07:53
  // Framework SVgg
  // Author : Gérald Czwiklinski
  // ----------------------------------------------------
  // Releases the memory occupied by a SVG tree.
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (09/09/08)
  // Merge with CLEAR_ALL
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (16/06/08)
  // 2004 -> v11
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (04/07/11)
  // If the reference is an object reference, the object is deleted
  // ----------------------------------------------------
C_TEXT:C284($1)

C_LONGINT:C283($Lon_parameters;$Lon_x)
C_TEXT:C284($Dom_root;$Dom_svgObject;$kTxt_currentMethod;$kTxt_Error_Method)

If (False:C215)
	C_TEXT:C284(SVG_CLEAR ;$1)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_CLEAR"  //Nom methode courante

If ($Lon_parameters>=1)
	
	$Dom_svgObject:=$1
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		$Dom_root:=DOM Get root XML element:C1053($Dom_svgObject)
		
		If ($Dom_root=$Dom_svgObject)
			
			  // Close the XML tree
			DOM CLOSE XML:C722($Dom_svgObject)
			
			If (OK=1)
				
				  // Delete the registered reference {
				If (Storage:C1525.svg.docs#Null:C1517)
					
					$Lon_x:=Storage:C1525.svg.docs.indexOf($Dom_svgObject)
					
					If ($Lon_x#-1)
						
						Use (Storage:C1525)
							
							Storage:C1525.svg.docs.remove($Lon_x)
							
						End use 
					End if 
				End if 
				  //}
				
			End if 
			
		Else 
			
			  // Delete the element
			DOM REMOVE XML ELEMENT:C869($Dom_svgObject)
			
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  // The reference is not a svg object
		
	End if 
	
Else 
	
	$kTxt_Error_Method:=Method called on error:C704
	
	ON ERR CALL:C155("xToolBox_NO_ERROR")  //=========================== < NO ERROR >
	
	Use (Storage:C1525)
		
		For each ($Dom_svgObject;Storage:C1525.svg.docs)
			
			DOM CLOSE XML:C722($Dom_svgObject)
			
		End for each 
		
		Storage:C1525.svg.docs.clear()
		
	End use 
	
	ON ERR CALL:C155($kTxt_Error_Method)  //============================= </ NO ERROR >
	
End if 