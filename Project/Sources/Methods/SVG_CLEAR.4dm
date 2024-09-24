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
#DECLARE($svgObject : Text)

var $kTxt_currentMethod; $root : Text
var $Lon_x : Integer

Compiler_SVG

$kTxt_currentMethod:="SVG_CLEAR"  // Nom methode courante

If (Count parameters:C259>=1)
	
	If (Asserted:C1132(xml_referenceValid($svgObject); Localized string:C991("error_badReference")))
		
		Component_errorHandler("init"; $kTxt_currentMethod)
		
		$root:=DOM Get root XML element:C1053($svgObject)
		
		If ($root=$svgObject)
			
			// Close the XML tree
			DOM CLOSE XML:C722($svgObject)
			
			If (OK=1)
				
				// Delete the registered reference {
				If (Storage:C1525.svg.docs#Null:C1517)
					
					$Lon_x:=Storage:C1525.svg.docs.indexOf($svgObject)
					
					If ($Lon_x#-1)
						
						Use (Storage:C1525)
							
							Storage:C1525.svg.docs.remove($Lon_x)
							
						End use 
					End if 
				End if 
				
				// }
				
			End if 
			
		Else 
			
			// Delete the element
			DOM REMOVE XML ELEMENT:C869($svgObject)
			
		End if 
		
		ASSERT:C1129(Component_errorHandler("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError(8852; $kTxt_currentMethod))  // The reference is not a svg object
		
	End if 
	
Else 
	
	Try  // < NO ERROR >
		
		Use (Storage:C1525)
			
			For each ($svgObject; Storage:C1525.svg.docs)
				
				DOM CLOSE XML:C722($svgObject)
				
			End for each 
			
			Storage:C1525.svg.docs.clear()
			
		End use 
		
	End try  // </ NO ERROR >
End if 