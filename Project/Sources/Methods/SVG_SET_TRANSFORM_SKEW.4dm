//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_TRANSFORM_SKEW
  // Created 01/09/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)
C_REAL:C285($2)
C_REAL:C285($3)

C_LONGINT:C283($Lon_end;$Lon_parameters;$Lon_start)
C_REAL:C285($Num_angleHorizontal;$Num_angleVertical)
C_TEXT:C284($kTxt_currentMethod;$Txt_objectID;$Txt_value)

If (False:C215)
	C_TEXT:C284(SVG_SET_TRANSFORM_SKEW ;$1)
	C_REAL:C285(SVG_SET_TRANSFORM_SKEW ;$2)
	C_REAL:C285(SVG_SET_TRANSFORM_SKEW ;$3)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Txt_objectID:=$1
	$Num_angleVertical:=$2
	
	If ($Lon_parameters>=3)
		
		$Num_angleHorizontal:=$3
		
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Txt_objectID);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		  //Get the current value of transform attribute if any {
		Component_errorHandler ("ERROR_OFF")
		
		DOM GET XML ATTRIBUTE BY NAME:C728($Txt_objectID;"transform";$Txt_value)
		
		If (OK=1)
			
			  //Remove old values if any {
			$Lon_start:=Position:C15("skewX(";$Txt_value)
			
			If ($Lon_start>0)
				
				$Lon_end:=Position:C15(")";$Txt_value;$Lon_start+1)
				$Txt_value:=Delete string:C232($Txt_value;$Lon_start;$Lon_end-$Lon_start+1)
				
			End if 
			
			If (Length:C16($Txt_value)>0)
				
				If ($Txt_value[[1]]=" ")
					
					$Txt_value:=Substring:C12($Txt_value;2)
					
				End if 
				
				If (Length:C16($Txt_value)>0)
					
					$Txt_value:=$Txt_value+" "
					
				End if 
			End if 
			
			$Lon_start:=Position:C15("skewY(";$Txt_value)
			
			If ($Lon_start>0)
				
				$Lon_end:=Position:C15(")";$Txt_value;$Lon_start+1)
				$Txt_value:=Delete string:C232($Txt_value;$Lon_start;$Lon_end-$Lon_start+1)
				
			End if 
			
			If (Length:C16($Txt_value)>0)
				
				If ($Txt_value[[1]]=" ")
					
					$Txt_value:=Substring:C12($Txt_value;2)
					
				End if 
				
				If (Length:C16($Txt_value)>0)
					
					$Txt_value:=$Txt_value+" "
					
				End if 
			End if 
			  //}
			
		End if 
		
		Component_errorHandler ("ERROR_ON")
		  //}
		
		If ($Num_angleVertical#0)
			
			$Txt_value:=$Txt_value+"skewX("+String:C10($Num_angleVertical;"&xml")+")"
			
		End if 
		
		If ($Num_angleHorizontal#0)
			
			$Txt_value:=$Txt_value+"skewY("+String:C10($Num_angleHorizontal;"&xml")+")"
			
		End if 
		
		DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
			"transform";$Txt_value)
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 