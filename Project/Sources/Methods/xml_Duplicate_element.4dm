//%attributes = {"invisible":true}
// ----------------------------------------------------
// Method : xml_DUPLICATE_ELEMENT
// Created 05/09/08 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($src : Text; $tgt : Text) : Text

var $srcRoot; $tgtName; $tgtRoot; $tgtValue : Text
var $i : Integer
var $blb : Blob

If (Asserted:C1132(xml_referenceValid($src) & xml_referenceValid($tgt); Localized string:C991("error_badReference")))
	
	DOM EXPORT TO VAR:C863($src; $blb)
	
	If (Bool:C1537(OK))
		
		$srcRoot:=DOM Parse XML variable:C720($blb; False:C215)
		
		If (Bool:C1537(OK))
			
			DOM GET XML ELEMENT NAME:C730($srcRoot; $tgtName)
			
			If (Bool:C1537(OK))
				
				$tgtRoot:=DOM Create XML element:C865($tgt; $tgtName)
				
				If (Bool:C1537(OK))
					
					For ($i; 1; DOM Count XML attributes:C727($srcRoot); 1)
						
						DOM GET XML ATTRIBUTE BY INDEX:C729($srcRoot; $i; $tgtName; $tgtValue)
						
						If (Bool:C1537(OK))
							
							DOM SET XML ATTRIBUTE:C866($tgtRoot; \
								$tgtName; $tgtValue)
							
						Else 
							
							break
							
						End if 
					End for 
				End if 
			End if 
		End if 
	End if 
	
	If (Bool:C1537(OK))
		
		xml_COPY_ELEMENT($srcRoot; $tgtRoot)
		
		return $tgtRoot
		
	End if 
End if 