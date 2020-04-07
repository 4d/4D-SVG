//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Method : xml_COPY_ELEMENT
  // Created 08/09/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)
C_TEXT:C284($2)

C_BOOLEAN:C305($Boo_OK;$Boo_stop)
C_LONGINT:C283($Lon_i)
C_TEXT:C284($Txt_Name;$Txt_nameBuffer;$Txt_Ref;$Txt_sourceRef;$Txt_target;$Txt_targetRef)
C_TEXT:C284($Txt_Value;$Txt_valueBuffer)

If (False:C215)
	C_TEXT:C284(xml_COPY_ELEMENT ;$1)
	C_TEXT:C284(xml_COPY_ELEMENT ;$2)
End if 

$Txt_sourceRef:=$1
$Txt_targetRef:=$2

If (Asserted:C1132(xml_referenceValid ($Txt_sourceRef) & xml_referenceValid ($Txt_targetRef);Get localized string:C991("error_badReference")))
	
	$Txt_Ref:=DOM Get first child XML element:C723($Txt_sourceRef;$Txt_Name;$Txt_Value)
	
	If (OK=1)
		
		Repeat 
			
			$Txt_target:=DOM Create XML element:C865($Txt_targetRef;$Txt_Name)
			$Boo_OK:=(OK=1)
			
			If ($Boo_OK)
				
				If (Length:C16($Txt_Value)>0)
					
					DOM SET XML ELEMENT VALUE:C868($Txt_target;$Txt_Value)
					$Boo_OK:=(OK=1)
					
				End if 
				
				If ($Boo_OK)
					
					For ($Lon_i;1;DOM Count XML attributes:C727($Txt_Ref);1)
						
						DOM GET XML ATTRIBUTE BY INDEX:C729($Txt_Ref;$Lon_i;$Txt_nameBuffer;$Txt_valueBuffer)
						$Boo_OK:=(OK=1)
						
						If ($Boo_OK)
							
							DOM SET XML ATTRIBUTE:C866($Txt_target;\
								$Txt_nameBuffer;$Txt_valueBuffer)
							
						Else 
							
							$Lon_i:=MAXLONG:K35:2-1
							
						End if 
					End for 
				End if 
			End if 
			
			If ($Boo_OK)
				
				xml_COPY_ELEMENT ($Txt_Ref;$Txt_target)
				
			End if 
			
			If ($Boo_OK)
				
				$Txt_Ref:=DOM Get next sibling XML element:C724($Txt_Ref;$Txt_Name;$Txt_Value)
				
				$Boo_stop:=(OK=0)
				OK:=1
				
			End if 
		Until (Not:C34($Boo_OK))\
			 | ($Boo_stop)
	End if 
End if 