//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Filter_Offset
  // Created 17/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_LONGINT:C283($2)
C_LONGINT:C283($3)
C_TEXT:C284($4)
C_TEXT:C284($5)

C_LONGINT:C283($Lon_dx;$Lon_dy;$Lon_parameters)
C_TEXT:C284($kTxt_currentMethod;$Txt_in;$Txt_name;$Txt_nodeReference;$Txt_parentReference;$Txt_result)

If (False:C215)
	C_TEXT:C284(SVG_Filter_Offset ;$0)
	C_TEXT:C284(SVG_Filter_Offset ;$1)
	C_LONGINT:C283(SVG_Filter_Offset ;$2)
	C_LONGINT:C283(SVG_Filter_Offset ;$3)
	C_TEXT:C284(SVG_Filter_Offset ;$4)
	C_TEXT:C284(SVG_Filter_Offset ;$5)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Txt_parentReference:=$1
	
	If (Asserted:C1132(xml_referenceValid ($Txt_parentReference);Get localized string:C991("error_badReference")))
		
		DOM GET XML ELEMENT NAME:C730($Txt_parentReference;$Txt_name)
		
		If ($Txt_name="filter")
			
			$Lon_dy:=-1
			
			If ($Lon_parameters>=2)  //dx
				
				$Lon_dx:=$2
				
				If ($Lon_parameters>=3)  //dy
					
					$Lon_dy:=$3
					
					If ($Lon_parameters>=4)  //in
						
						$Txt_in:=$4
						
						If ($Lon_parameters>=5)  //result
							
							$Txt_result:=$5
							
						End if 
					End if 
				End if 
			End if 
			
			Component_errorHandler ("init";$kTxt_currentMethod)
			
			$Txt_nodeReference:=DOM Create XML element:C865($Txt_parentReference;"feOffset")
			
			If (OK=1)
				
				DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
					"dx";$Lon_dx)
				
			End if 
			
			If (OK=1)\
				 & ($Lon_dy#-1)
				
				DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
					"dy";$Lon_dy)
				
			End if 
			
			If (OK=1)\
				 & (Length:C16($Txt_in)>0)
				
				DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
					"in";$Txt_in)
				
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