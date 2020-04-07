//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_STROKE_DASHARRAY
  // Created 03/12/09 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // http://www.w3.org/TR/SVG/painting.html#StrokeProperties
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($1)
C_REAL:C285($2)
C_LONGINT:C283(${3})

C_LONGINT:C283($Lon_i;$Lon_parameters)
C_REAL:C285($Num_buffer)
C_TEXT:C284($Dom_object;$kTxt_currentMethod;$Txt_buffer;$Txt_dash;$Txt_offset)

If (False:C215)
	C_TEXT:C284(SVG_SET_STROKE_DASHARRAY ;$1)
	C_REAL:C285(SVG_SET_STROKE_DASHARRAY ;$2)
	C_LONGINT:C283(SVG_SET_STROKE_DASHARRAY ;${3})
End if 

Compiler_SVG 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

  // ----------------------------------------------------

If ($Lon_parameters>=2)
	
	$Dom_object:=$1
	
	If (Asserted:C1132(xml_referenceValid ($Dom_object);Get localized string:C991("error_badReference")))
		
		If ($2=0)
			
			$Txt_dash:="none"
			$Txt_offset:="0"
			
		Else 
			
			$Num_buffer:=Dec:C9($2)
			
			If ($Num_buffer>0)
				
				$Txt_offset:=String:C10($Num_buffer)
				GET SYSTEM FORMAT:C994(Decimal separator:K60:1;$Txt_buffer)
				$Txt_offset:=Delete string:C232($Txt_offset;1;Position:C15($Txt_buffer;$Txt_offset))
				
				$Txt_dash:=String:C10(Int:C8($2))
				
			Else 
				
				$Txt_dash:=String:C10($2)
				
			End if 
			
			If ($Lon_parameters=2)
				
				$Txt_dash:=$Txt_dash+","+$Txt_dash
				
			Else 
				
				For ($Lon_i;3;$Lon_parameters;1)
					
					$Txt_dash:=$Txt_dash+","+String:C10(${$Lon_i})
					
				End for 
			End if 
		End if 
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM SET XML ATTRIBUTE:C866($Dom_object;\
			"stroke-dashoffset";$Txt_offset)
		DOM SET XML ATTRIBUTE:C866($Dom_object;\
			"stroke-dasharray";$Txt_dash)
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 