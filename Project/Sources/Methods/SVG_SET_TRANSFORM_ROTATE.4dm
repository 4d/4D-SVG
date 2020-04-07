//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method: SVG_SET_TRANSFORM_ROTATE
  // Date et heure : 16/03/06, 10:07:53
  // Framework SVgg
  // Author : Gérald Czwiklinski
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (01/07/08)
  // 2004 -> v11
  // ----------------------------------------------------
C_TEXT:C284($1)
C_REAL:C285($2)
C_REAL:C285($3)
C_REAL:C285($4)

C_LONGINT:C283($Lon_buffer;$Lon_end;$Lon_parameters;$Lon_start;$Lon_x;$Lon_y)
C_REAL:C285($Num_angle;$Num_cx;$Num_cy)
C_TEXT:C284($Dom_target;$kTxt_currentMethod;$Txt_value)

If (False:C215)
	C_TEXT:C284(SVG_SET_TRANSFORM_ROTATE ;$1)
	C_REAL:C285(SVG_SET_TRANSFORM_ROTATE ;$2)
	C_REAL:C285(SVG_SET_TRANSFORM_ROTATE ;$3)
	C_REAL:C285(SVG_SET_TRANSFORM_ROTATE ;$4)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Dom_target:=$1
	$Num_angle:=$2
	
	If (Asserted:C1132(xml_referenceValid ($Dom_target);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		  //Get the current value of transform attribute if any {
		Component_errorHandler ("ERROR_OFF")
		DOM GET XML ATTRIBUTE BY NAME:C728($Dom_target;"transform";$Txt_value)
		
		If (OK=1)
			
			$Lon_start:=Position:C15("rotate(";$Txt_value)
			
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
		End if 
		
		Component_errorHandler ("ERROR_ON")
		  //}
		
		If ($Lon_parameters>=4)
			
			$Num_cx:=$3
			$Num_cy:=$4
			
			$Txt_value:=$Txt_value+"rotate("+String:C10($Num_angle;"&xml")+","+String:C10($Num_cx;"&xml")+","+String:C10($Num_cy;"&xml")+")"
			
		Else 
			
			$Num_cx:=-1
			$Num_cy:=-1
			
			If (Storage:C1525.svg.options ?? 14)
				
				  //try to preform a rotation around the center of the object
				Component_errorHandler ("ERROR_OFF")
				
				DOM GET XML ATTRIBUTE BY NAME:C728($Dom_target;"x";$Lon_x)
				DOM GET XML ATTRIBUTE BY NAME:C728($Dom_target;"width";$Lon_buffer)
				
				If ($Lon_buffer#0)
					
					$Num_cx:=$Lon_x+($Lon_buffer/2)
					
					DOM GET XML ATTRIBUTE BY NAME:C728($Dom_target;"y";$Lon_y)
					DOM GET XML ATTRIBUTE BY NAME:C728($Dom_target;"height";$Lon_buffer)
					
					If ($Lon_buffer#0)
						
						$Num_cy:=$Lon_y+($Lon_buffer/2)
						
					End if 
				End if 
				
				Component_errorHandler ("ERROR_ON")
				
			End if 
			
			If ($Num_cx#-1)\
				 & ($Num_cy#-1)
				
				$Txt_value:=$Txt_value+"rotate("+String:C10($Num_angle;"&xml")+","+String:C10($Num_cx;"&xml")+","+String:C10($Num_cy;"&xml")+")"
				
			Else 
				
				$Txt_value:=$Txt_value+"rotate("+String:C10($Num_angle;"&xml")+")"
				
			End if 
		End if 
		
		DOM SET XML ATTRIBUTE:C866($Dom_target;\
			"transform";$Txt_value)
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 