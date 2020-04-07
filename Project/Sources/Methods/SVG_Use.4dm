//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Use
  // Created 16/03/06, 10:07:53
  // Framework SVgg
  // Author : Gérald Czwiklinski
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)
C_REAL:C285($3)
C_REAL:C285($4)
C_REAL:C285($5)
C_REAL:C285($6)

C_LONGINT:C283($Lon_parameters)
C_REAL:C285($Num_Height;$Num_Width;$Num_x;$Num_y)
C_TEXT:C284($kTxt_currentMethod;$Txt_Buffer;$Txt_nodeReference;$Txt_parentReference;$Txt_rootReference;$Txt_URL)

If (False:C215)
	C_TEXT:C284(SVG_Use ;$0)
	C_TEXT:C284(SVG_Use ;$1)
	C_TEXT:C284(SVG_Use ;$2)
	C_REAL:C285(SVG_Use ;$3)
	C_REAL:C285(SVG_Use ;$4)
	C_REAL:C285(SVG_Use ;$5)
	C_REAL:C285(SVG_Use ;$6)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Txt_parentReference:=$1
	$Txt_URL:=$2
	
	$Num_x:=-1
	$Num_Width:=-1
	$Num_Height:=-1
	
	If ($Lon_parameters>=4)
		
		$Num_x:=$3
		$Num_y:=$4
		
		If ($Lon_parameters>=5)
			
			$Num_Width:=$5
			
			If ($Lon_parameters>=6)
				
				$Num_Height:=$6
				
			End if 
		End if 
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Txt_parentReference);Get localized string:C991("error_badReference")))
		
		If (Length:C16($Txt_URL)>0)
			
			Component_errorHandler ("init";$kTxt_currentMethod)
			
			  //First, go back to the main node (<SVG>)...
			$Txt_rootReference:=DOM Get root XML element:C1053($Txt_parentReference)
			
			If (OK=1)
				
				  //Add the xmlns:link
				DOM SET XML ATTRIBUTE:C866($Txt_rootReference;\
					"xmlns:xlink";"http://www.w3.org/1999/xlink")
				
				If (OK=1)
					
					$Txt_Buffer:=DOM Find XML element by ID:C1010($Txt_rootReference;$Txt_URL)
					
					If (OK=1)
						
						$Txt_nodeReference:=DOM Create XML element:C865($Txt_parentReference;"use";\
							"xlink:href";"#"+$Txt_URL)
						
						If (OK=1)\
							 & ($Num_x#-1)
							
							DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
								"x";$Num_x;\
								"y";$Num_y)
							
						End if 
						
						If (OK=1)\
							 & ($Num_Width#-1)
							
							DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
								"width";$Num_Width)
							
						End if 
						
						If (OK=1)\
							 & ($Num_Height#-1)
							
							DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
								"height";$Num_Height)
							
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
						
					Else 
						
						ASSERT:C1129(Component_putError (8855))  //8855 = The ID passed was not found
						
					End if 
				End if 
			End if 
			
			ASSERT:C1129(Component_errorHandler ("deinit"))
			
		Else 
			
			ASSERT:C1129(Component_putError (8853;$kTxt_currentMethod))  //8853 = Invalid Value for an attribute
			
		End if 
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 