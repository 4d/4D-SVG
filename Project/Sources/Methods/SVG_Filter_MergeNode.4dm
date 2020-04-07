//%attributes = {"invisible":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Filter_MergeNode
  // Created 17/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($kTxt_currentMethod;$Txt_in;$Txt_name;$Txt_nodeReference;$Txt_parentReference)

If (False:C215)
	C_TEXT:C284(SVG_Filter_MergeNode ;$0)
	C_TEXT:C284(SVG_Filter_MergeNode ;$1)
	C_TEXT:C284(SVG_Filter_MergeNode ;$2)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Txt_parentReference:=$1
	
	$Txt_in:=$2
	
	If (Asserted:C1132(xml_referenceValid ($Txt_parentReference);Get localized string:C991("error_badReference")))
		
		DOM GET XML ELEMENT NAME:C730($Txt_parentReference;$Txt_name)
		
		If ($Txt_name="feMerge")
			
			Component_errorHandler ("init";$kTxt_currentMethod)
			
			$Txt_nodeReference:=DOM Create XML element:C865($Txt_parentReference;"feMergeNode";\
				"in";$Txt_in)
			
			If (OK=1)
				
				  //Set the id {
				If (Storage:C1525.svg.options ?? 1)
					
					DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
						"id";$Txt_nodeReference)
					
				End if 
				  //}
				
				If (OK=1)
					
					$0:=$Txt_nodeReference
					
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