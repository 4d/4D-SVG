//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_VIEWBOX
  // Created 18/06/08 by Vincent de Lachaux
  // ----------------------------------------------------
C_TEXT:C284($1)
C_REAL:C285($2)
C_REAL:C285($3)
C_REAL:C285($4)
C_REAL:C285($5)
C_TEXT:C284($6)

C_LONGINT:C283($Lon_parameters)
C_REAL:C285($Num_height;$Num_width;$Num_x;$Num_y)
C_TEXT:C284($kTxt_currentMethod;$kTxt_Values;$Txt_name;$Txt_objectID;$Txt_preserveAspectRatio)

If (False:C215)
	C_TEXT:C284(SVG_SET_VIEWBOX ;$1)
	C_REAL:C285(SVG_SET_VIEWBOX ;$2)
	C_REAL:C285(SVG_SET_VIEWBOX ;$3)
	C_REAL:C285(SVG_SET_VIEWBOX ;$4)
	C_REAL:C285(SVG_SET_VIEWBOX ;$5)
	C_TEXT:C284(SVG_SET_VIEWBOX ;$6)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_SET_VIEWBOX"  //Nom methode courante

If ($Lon_parameters>=5)
	
	$Txt_objectID:=$1
	$Num_x:=$2
	$Num_y:=$3
	$Num_width:=$4
	$Num_height:=$5
	
	If ($Lon_parameters>=6)
		
		$Txt_preserveAspectRatio:=$6
		
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Txt_objectID);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM GET XML ELEMENT NAME:C730($Txt_objectID;$Txt_name)
		
		If (Position:C15($Txt_name+"|";"svg|symbol|marker|pattern|view|text|")>0)
			
			DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
				"viewBox";String:C10($Num_x;"&xml")+" "+String:C10($Num_y;"&xml")+" "+String:C10($Num_width;"&xml")+" "+String:C10($Num_height;"&xml"))
			
			If (OK=1)\
				 & (Length:C16($Txt_preserveAspectRatio)>0)
				
				$kTxt_Values:="true|none|xMinYMin|xMidYMin|xMaxYMin|xMinYMid|xMidYMid|xMaxYMid|xMinYMax|xMidYMax|xMaxYMax|"
				
				If (Position:C15($Txt_preserveAspectRatio+"|";$kTxt_Values)>0)
					
					If ($Txt_preserveAspectRatio="true")
						
						DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
							"preserveAspectRatio";"xMidYMid")  //Default value
						
					Else 
						
						DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
							"preserveAspectRatio";$Txt_preserveAspectRatio)
						
					End if 
					
				Else 
					
					ASSERT:C1129(Component_putError (8853))  //Invalid Value for an attribute
					
				End if 
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