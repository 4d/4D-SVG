//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_TRANSFORM_FLIP
  // Created 01/09/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)
C_BOOLEAN:C305($2)
C_BOOLEAN:C305($3)

C_BOOLEAN:C305($Boo_horizontal;$Boo_vertical)
C_LONGINT:C283($Lon_end;$Lon_parameters;$Lon_start;$Lon_x)
C_REAL:C285($Num_horizontal;$Num_vertical)
C_TEXT:C284($Dom_svgObject;$kTxt_currentMethod;$Txt_Buffer;$Txt_value)

If (False:C215)
	C_TEXT:C284(SVG_SET_TRANSFORM_FLIP ;$1)
	C_BOOLEAN:C305(SVG_SET_TRANSFORM_FLIP ;$2)
	C_BOOLEAN:C305(SVG_SET_TRANSFORM_FLIP ;$3)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Dom_svgObject:=$1
	$Boo_vertical:=$2
	
	$Num_horizontal:=1
	$Num_vertical:=1
	
	If ($Lon_parameters>=3)
		
		$Boo_horizontal:=$3
		
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		  //Get the current value of transform attribute if any {
		Component_errorHandler ("ERROR_OFF")
		DOM GET XML ATTRIBUTE BY NAME:C728($Dom_svgObject;"transform";$Txt_value)
		
		If (OK=1)
			
			$Lon_start:=Position:C15("scale(";$Txt_value)
			
			If ($Lon_start>0)
				
				$Lon_end:=Position:C15(")";$Txt_value;$Lon_start+1)
				$Txt_Buffer:=Replace string:C233(Substring:C12($Txt_value;$Lon_start;$Lon_end);"scale(";"")
				$Txt_Buffer:=Replace string:C233($Txt_Buffer;".";",")
				$Txt_value:=Delete string:C232($Txt_value;$Lon_start;$Lon_end-$Lon_start+1)
				$Lon_x:=Position:C15(",";$Txt_Buffer)
				
				If ($Lon_x>0)
					
					$Num_horizontal:=Num:C11(Substring:C12($Txt_Buffer;1;$Lon_x-1))
					$Num_vertical:=Num:C11(Substring:C12($Txt_Buffer;$Lon_x+1))
					
				Else 
					
					$Num_horizontal:=Num:C11($Txt_Buffer)
					$Num_vertical:=$Num_horizontal
					
				End if 
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
		
		$Txt_value:=$Txt_value+"scale("+("-"*Num:C11($Boo_horizontal))+String:C10($Num_horizontal;"&xml")+","+("-"*Num:C11($Boo_vertical))+String:C10($Num_vertical;"&xml")+")"
		
		DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
			"transform";$Txt_value)
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 