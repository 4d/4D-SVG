//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Filter_Blur
  // Created 10/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // Define a GaussianBlur element
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_LONGINT:C283($2)
C_TEXT:C284($3)
C_TEXT:C284($4)

C_LONGINT:C283($Lon_parameters;$Lon_stdDeviation)
C_TEXT:C284($kTxt_currentMethod;$Txt_in;$Txt_name;$Txt_nodeReference;$Txt_parentReference;$Txt_result)

If (False:C215)
	C_TEXT:C284(SVG_Filter_Blur ;$0)
	C_TEXT:C284(SVG_Filter_Blur ;$1)
	C_LONGINT:C283(SVG_Filter_Blur ;$2)
	C_TEXT:C284(SVG_Filter_Blur ;$3)
	C_TEXT:C284(SVG_Filter_Blur ;$4)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Txt_parentReference:=$1
	
	If (Asserted:C1132(xml_referenceValid ($Txt_parentReference);Get localized string:C991("error_badReference")))
		
		DOM GET XML ELEMENT NAME:C730($Txt_parentReference;$Txt_name)
		
		If ($Txt_name="filter")
			
			If ($Lon_parameters>=2)  //stdDeviation
				
				$Lon_stdDeviation:=$2
				
				If ($Lon_parameters>=3)  //in
					
					$Txt_in:=$3
					
					If ($Lon_parameters>=4)  //result
						
						$Txt_result:=$4
						
					End if 
				End if 
			End if 
			
			Component_errorHandler ("init";$kTxt_currentMethod)
			
			$Txt_nodeReference:=DOM Create XML element:C865($Txt_parentReference;"feGaussianBlur")
			
			If (OK=1)
				
				DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
					"stdDeviation";$Lon_stdDeviation)
				
			End if 
			
			If (OK=1)\
				 & (Length:C16($Txt_in)>0)
				
				If (Position:C15($Txt_in+"|";Storage:C1525.svg.fe_inValues)>0)
					
					DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
						"in";$Txt_in)
					
				Else 
					
					ASSERT:C1129(Component_putError (8853))  //Invalid Value for an attribute
					
				End if 
			End if 
			
			If (OK=1)\
				 & (Length:C16($Txt_result)>0)
				
				DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
					"result";$Txt_result)
				
			End if 
			
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