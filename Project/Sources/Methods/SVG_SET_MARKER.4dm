//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_MARKER
  // Created 04/09/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)
C_TEXT:C284($2)
C_TEXT:C284($3)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($kTxt_currentMethod;$Txt_Buffer;$Txt_name;$Txt_parentReference;$Txt_rootReference;$Txt_Type)
C_TEXT:C284($Txt_URL)

If (False:C215)
	C_TEXT:C284(SVG_SET_MARKER ;$1)
	C_TEXT:C284(SVG_SET_MARKER ;$2)
	C_TEXT:C284(SVG_SET_MARKER ;$3)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_SET_MARKER"  //Nom methode courante

If ($Lon_parameters>=1)
	
	$Txt_parentReference:=$1
	
	If ($Lon_parameters>=2)
		
		$Txt_URL:=$2
		
		If ($Lon_parameters>=3)
			
			$Txt_Type:=$3
			
		End if 
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Txt_parentReference);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM GET XML ELEMENT NAME:C730($Txt_parentReference;$Txt_name)
		
		If ($Txt_name="path")\
			 | ($Txt_name="line")\
			 | ($Txt_name="polyline")\
			 | ($Txt_name="polygon")
			
			  //First, go back to the main node (<SVG>)...
			$Txt_rootReference:=DOM Get root XML element:C1053($Txt_parentReference)
			
			If (OK=1)
				
				If ((Length:C16($Txt_URL)=0)\
					 | ($Txt_URL="none"))
					
					Case of 
							
							  //______________________________________________________
						: ($Txt_Type="start")
							
							xml_remove_attribute ($Txt_parentReference;"marker-start")
							
							  //______________________________________________________
						: (Length:C16($Txt_Type)=0)\
							 | ($Txt_Type="end")
							
							xml_remove_attribute ($Txt_parentReference;"marker-end")
							
							  //______________________________________________________
						: ($Txt_Type="middle")
							
							xml_remove_attribute ($Txt_parentReference;"marker-mid")
							
							  //______________________________________________________
						: ($Txt_Type="all")
							
							xml_remove_attribute ($Txt_parentReference;"marker-start")
							xml_remove_attribute ($Txt_parentReference;"marker-end")
							xml_remove_attribute ($Txt_parentReference;"marker-mid")
							
							  //______________________________________________________
						Else 
							
							ASSERT:C1129(Component_putError (8853))  //Invalid Value for an Attribute
							
							  //______________________________________________________
					End case 
					
				Else 
					
					  //Add the xmlns:link
					DOM SET XML ATTRIBUTE:C866($Txt_rootReference;\
						"xmlns:xlink";"http://www.w3.org/1999/xlink")
					
					$Txt_Buffer:=DOM Find XML element by ID:C1010($Txt_rootReference;$Txt_URL)
					
					Case of 
							
							  //______________________________________________________
						: (OK=0)
							
							ASSERT:C1129(Component_putError (8855))  //8855 = The ID passed was not found
							
							  //______________________________________________________
						: ($Txt_Type="start")
							
							DOM SET XML ATTRIBUTE:C866($Txt_parentReference;\
								"marker-start";"url(#"+$Txt_URL+")")
							
							  //______________________________________________________
						: (Length:C16($Txt_Type)=0)\
							 | ($Txt_Type="end")
							
							DOM SET XML ATTRIBUTE:C866($Txt_parentReference;\
								"marker-end";"url(#"+$Txt_URL+")")
							
							  //______________________________________________________
						: ($Txt_Type="middle")
							
							DOM SET XML ATTRIBUTE:C866($Txt_parentReference;\
								"marker-mid";"url(#"+$Txt_URL+")")
							
							  //______________________________________________________
						: ($Txt_Type="all")
							
							DOM SET XML ATTRIBUTE:C866($Txt_parentReference;\
								"marker-start";"url(#"+$Txt_URL+")")
							DOM SET XML ATTRIBUTE:C866($Txt_parentReference;\
								"marker-mid";"url(#"+$Txt_URL+")")
							DOM SET XML ATTRIBUTE:C866($Txt_parentReference;\
								"marker-end";"url(#"+$Txt_URL+")")
							
							  //______________________________________________________
						Else 
							
							ASSERT:C1129(Component_putError (8853))  //Invalid Value for an Attribute
							
							  //______________________________________________________
					End case 
				End if 
				
			Else 
				
				ASSERT:C1129(Component_putError (8858))  //Unknown error
				
			End if 
			
		Else 
			
			ASSERT:C1129(Component_putError (8854))  //Impossible to apply this Command for this Node
			
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 