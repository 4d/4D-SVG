//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_ADD_POINT
  // Created 23/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)
C_REAL:C285(${2})

C_LONGINT:C283($Lon_i;$Lon_parameters)
C_REAL:C285($Num_x;$Num_y)
C_TEXT:C284($kTxt_currentMethod;$kTxt_Element;$Txt_Attribut;$Txt_name;$Txt_parentReference;$Txt_Path)

If (False:C215)
	C_TEXT:C284(SVG_ADD_POINT ;$1)
	C_REAL:C285(SVG_ADD_POINT ;${2})
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_ADD_POINT"  //Nom methode courante

If ($Lon_parameters>=3)
	
	$Txt_parentReference:=$1
	$Num_x:=$2
	$Num_y:=$3
	
	If (Asserted:C1132(xml_referenceValid ($Txt_parentReference);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		$kTxt_Element:="polyline|polygon|path|"
		
		DOM GET XML ELEMENT NAME:C730($Txt_parentReference;$Txt_name)
		
		If (Position:C15($Txt_name+"|";$kTxt_Element)>0)
			
			Case of 
					
					  //……………………
				: ($Txt_name="path")
					
					$Txt_Attribut:="d"
					
					  //……………………
				Else 
					
					$Txt_Attribut:="points"
					
					  //……………………
			End case 
			
			DOM GET XML ATTRIBUTE BY NAME:C728($Txt_parentReference;$Txt_Attribut;$Txt_Path)
			
			If (OK=1)
				
				For ($Lon_i;2;$Lon_parameters;2)
					
					$Txt_Path:=$Txt_Path+" "+String:C10(${$Lon_i};"&xml")+","+String:C10(${$Lon_i+1};"&xml")
					
				End for 
				
				If (Storage:C1525.svg.options ?? 5)
					
					$Txt_Path:=$Txt_Path+"\r"
					
				End if 
				
				DOM SET XML ATTRIBUTE:C866($Txt_parentReference;\
					$Txt_Attribut;$Txt_Path)
				
			End if 
			
			ASSERT:C1129(Component_errorHandler ("deinit"))
			
		Else 
			
			ASSERT:C1129(Component_putError (8854))  //Impossible to apply this Command for this Node
			
		End if 
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 