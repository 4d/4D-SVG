//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_VISIBILITY
  // Created 01/09/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // Hides ($2 = true) or shows ($2 = false or omited) the objects referenced by $1
  // ----------------------------------------------------
C_TEXT:C284($1)
C_BOOLEAN:C305($2)

C_BOOLEAN:C305($Boo_Visible)
C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($kTxt_currentMethod;$kTxt_nodes;$Txt_name;$Txt_objectID)

If (False:C215)
	C_TEXT:C284(SVG_SET_VISIBILITY ;$1)
	C_BOOLEAN:C305(SVG_SET_VISIBILITY ;$2)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=1)
	
	$Txt_objectID:=$1
	$Boo_Visible:=True:C214
	
	If ($Lon_parameters>=2)
		
		$Boo_Visible:=$2
		
	End if 
	
	$kTxt_nodes:="svg|use|g|line|rect|circle|ellipse|polyline|polygon|switch|a|foreignObject|text|tspan|tref|altGlyph|textPath|textArea|image"
	
	If (Asserted:C1132(xml_referenceValid ($Txt_objectID);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM GET XML ELEMENT NAME:C730($Txt_objectID;$Txt_name)
		
		If (OK=1)
			
			If (Position:C15($Txt_name+"|";$kTxt_nodes)>0)
				
				DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
					"visibility";Choose:C955($Boo_Visible;"visible";"hidden"))
				
			Else 
				
				ASSERT:C1129(Component_putError (8854))  //Impossible to apply this command for this node
				
			End if 
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 