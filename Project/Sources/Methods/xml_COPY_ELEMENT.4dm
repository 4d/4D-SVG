//%attributes = {"invisible":true}
// ----------------------------------------------------
// Method : xml_COPY_ELEMENT
// Created 08/09/08 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($src : Text; $tgt : Text)

var $name; $node; $ref; $srcName; $srcValue; $value : Text
var $success : Boolean
var $i : Integer

If (Asserted:C1132(xml_referenceValid($src) & xml_referenceValid($tgt); Localized string:C991("error_badReference")))
	
	$ref:=DOM Get first child XML element:C723($src; $srcName; $srcValue)
	
	If (OK=0)
		
		return 
		
	End if 
	
	Repeat 
		
		$node:=DOM Create XML element:C865($tgt; $srcName)
		
		If (Not:C34(Bool:C1537(OK)))
			
			break
			
		End if 
		
		$success:=Bool:C1537(OK)
		
		If (Length:C16($srcValue)>0)
			
			DOM SET XML ELEMENT VALUE:C868($node; $srcValue)
			
			If (Not:C34(Bool:C1537(OK)))
				
				break
				
			End if 
		End if 
		
		For ($i; 1; DOM Count XML attributes:C727($ref); 1)
			
			DOM GET XML ATTRIBUTE BY INDEX:C729($ref; $i; $name; $value)
			
			If (Not:C34(Bool:C1537(OK)))
				
				break
				
			End if 
			
			DOM SET XML ATTRIBUTE:C866($node; \
				$name; $value)
			
		End for 
		
		If (Not:C34(Bool:C1537(OK)))
			
			break
			
		End if 
		
		xml_COPY_ELEMENT($ref; $node)
		
		$ref:=DOM Get next sibling XML element:C724($ref; $srcName; $srcValue)
		
		If (Not:C34(Bool:C1537(OK)))
			
			OK:=1
			
			break
			
		End if 
	Until (False:C215)
End if 