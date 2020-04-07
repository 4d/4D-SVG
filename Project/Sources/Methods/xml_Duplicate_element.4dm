//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Method : xml_DUPLICATE_ELEMENT
  // Created 05/09/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)

C_BLOB:C604($Blb_xml)
C_LONGINT:C283($Lon_i)
C_TEXT:C284($Txt_Name;$Txt_nameBuffer;$Txt_sourceRef;$Txt_sourceRoot;$Txt_targetRef;$Txt_targetRoot)
C_TEXT:C284($Txt_valueBuffer)

If (False:C215)
	C_TEXT:C284(xml_Duplicate_element ;$0)
	C_TEXT:C284(xml_Duplicate_element ;$1)
	C_TEXT:C284(xml_Duplicate_element ;$2)
End if 

$Txt_sourceRef:=$1
$Txt_targetRef:=$2

If (Asserted:C1132(xml_referenceValid ($Txt_sourceRef) & xml_referenceValid ($Txt_targetRef);Get localized string:C991("error_badReference")))
	
	DOM EXPORT TO VAR:C863($Txt_sourceRef;$Blb_xml)
	
	If (OK=1)
		
		$Txt_sourceRoot:=DOM Parse XML variable:C720($Blb_xml;False:C215)
		
		If (OK=1)
			
			DOM GET XML ELEMENT NAME:C730($Txt_sourceRoot;$Txt_Name)
			
			If (OK=1)
				
				$Txt_targetRoot:=DOM Create XML element:C865($Txt_targetRef;$Txt_Name)
				
				If (OK=1)
					
					For ($Lon_i;1;DOM Count XML attributes:C727($Txt_sourceRoot);1)
						
						DOM GET XML ATTRIBUTE BY INDEX:C729($Txt_sourceRoot;$Lon_i;$Txt_nameBuffer;$Txt_valueBuffer)
						
						If (OK=1)
							
							DOM SET XML ATTRIBUTE:C866($Txt_targetRoot;\
								$Txt_nameBuffer;$Txt_valueBuffer)
							
						Else 
							
							$Lon_i:=MAXLONG:K35:2-1
							
						End if 
					End for 
				End if 
			End if 
		End if 
	End if 
	
	If (OK=1)
		
		$0:=$Txt_targetRoot
		
		xml_COPY_ELEMENT ($Txt_sourceRoot;$Txt_targetRoot)
		
	End if 
End if 