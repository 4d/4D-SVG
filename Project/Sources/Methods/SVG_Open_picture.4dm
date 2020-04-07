//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Open_picture
  // Created 20/10/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($0)
C_PICTURE:C286($1)

C_BLOB:C604($Blb_buffer)
C_LONGINT:C283($Lon_parameters)
C_PICTURE:C286($Pic_picture)
C_TEXT:C284($kTxt_currentMethod;$Txt_rootReference)

If (False:C215)
	C_TEXT:C284(SVG_Open_picture ;$0)
	C_PICTURE:C286(SVG_Open_picture ;$1)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=1)
	
	$Pic_picture:=$1
	
	If (Picture size:C356($Pic_picture)>0)
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		Component_errorHandler ("ERROR_OFF")
		
		PICTURE TO BLOB:C692($Pic_picture;$Blb_buffer;".svg")
		
		If (OK=1)
			
			$Txt_rootReference:=DOM Parse XML variable:C720($Blb_buffer)
			
			If (OK=1)
				
				  // Store the reference {
				Use (Storage:C1525.svg)
					
					If (Storage:C1525.svg.docs=Null:C1517)
						
						Storage:C1525.svg.docs:=New shared collection:C1527
						
					End if 
					
					Storage:C1525.svg.docs.push($Txt_rootReference)
					
				End use 
				  //}
				
				$0:=$Txt_rootReference
				
			End if 
		End if 
		
		Component_errorHandler ("ERROR_ON")
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8857;$kTxt_currentMethod))  //Invalid Value for an Argument
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 