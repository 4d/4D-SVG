//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_STROKE_MITERLIMIT
  // Created 12/09/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // http://www.w3.org/TR/SVG/painting.html#StrokeProperties
  // ----------------------------------------------------
C_TEXT:C284($1)
C_LONGINT:C283($2)

C_LONGINT:C283($Lon_count;$Lon_i;$Lon_mitterlimit;$Lon_parameters)
C_TEXT:C284($Dom_element;$kTxt_currentMethod;$Txt_buffer;$Txt_name)

If (False:C215)
	C_TEXT:C284(SVG_SET_STROKE_MITERLIMIT ;$1)
	C_LONGINT:C283(SVG_SET_STROKE_MITERLIMIT ;$2)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_SET_STROKE_MITERLIMIT"  //Nom methode courante

If ($Lon_parameters>=2)
	
	$Dom_element:=$1
	$Lon_mitterlimit:=$2
	
	If ($Lon_mitterlimit=-1)
		
		$Lon_mitterlimit:=4
		
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Dom_element);Get localized string:C991("error_badReference")))
		
		DOM GET XML ELEMENT NAME:C730($Dom_element;$Txt_name)
		
		If (Position:C15($Txt_name+"|";"g|path|rect|circle|ellipse|line|polyline|polygone|svg")>0)
			
			Component_errorHandler ("init";$kTxt_currentMethod)
			
			Case of 
					
					  //……………………………………………………………………………………………………………………
				: ($Lon_mitterlimit=0)
					
					  //#ACI0093746 {
					  //DOM REMOVE XML ATTRIBUTE($Dom_element;"stroke-miterlimit")
					$Lon_count:=DOM Count XML attributes:C727($Dom_element)
					
					For ($Lon_i;1;DOM Count XML attributes:C727($Dom_element);1)
						
						DOM GET XML ATTRIBUTE BY INDEX:C729($Dom_element;$Lon_i;$Txt_name;$Txt_buffer)
						
						If ($Txt_name="stroke-miterlimit")
							
							DOM REMOVE XML ATTRIBUTE:C1084($Dom_element;$Txt_name)
							$Lon_i:=MAXLONG:K35:2-1
							
						End if 
					End for   //}
					
					  //……………………………………………………………………………………………………………………
				: ($Lon_mitterlimit<1)
					
					ASSERT:C1129(Component_putError (8853;$kTxt_currentMethod))  //Invalid Value for an Attribute
					
					  //……………………………………………………………………………………………………………………
				Else 
					
					DOM SET XML ATTRIBUTE:C866($Dom_element;\
						"stroke-miterlimit";$Lon_mitterlimit)
					
					  //……………………………………………………………………………………………………………………
			End case 
			
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