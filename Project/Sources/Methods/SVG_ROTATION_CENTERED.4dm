//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method: SVG_ROTATION_CENTERED
  // Created 19/02/13 by Vincent de Lachaux
  // ----------------------------------------------------
C_TEXT:C284($1)
C_REAL:C285($2)

C_LONGINT:C283($Lon_buffer;$Lon_end;$Lon_parameters;$Lon_start;$Lon_x;$Lon_y)
C_REAL:C285($Num_angle;$Num_cx;$Num_cy)
C_TEXT:C284($Dom_svgObject;$kTxt_currentMethod;$t;$Txt_value)

If (False:C215)
	C_TEXT:C284(SVG_ROTATION_CENTERED ;$1)
	C_REAL:C285(SVG_ROTATION_CENTERED ;$2)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_ROTATION_CENTERED"  //Nom methode courante

If ($Lon_parameters>=2)
	
	$Dom_svgObject:=$1
	$Num_angle:=$2
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		  //Get the current value of transform attribute if any {
		Component_errorHandler ("ERROR_OFF")
		DOM GET XML ATTRIBUTE BY NAME:C728($Dom_svgObject;"transform";$Txt_value)
		
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
		
		  //#ACI0100389 [
		DOM GET XML ELEMENT NAME:C730($Dom_svgObject;$t)
		
		Case of 
				
				  //______________________________________________________
			: ($t="ellipse")\
				 | ($t="circle")
				
				DOM GET XML ATTRIBUTE BY NAME:C728($Dom_svgObject;"cx";$Num_cx)
				DOM GET XML ATTRIBUTE BY NAME:C728($Dom_svgObject;"cy";$Num_cy)
				
				  //______________________________________________________
			Else 
				
				DOM GET XML ATTRIBUTE BY NAME:C728($Dom_svgObject;"x";$Lon_x)
				DOM GET XML ATTRIBUTE BY NAME:C728($Dom_svgObject;"width";$Lon_buffer)
				$Num_cx:=$Lon_x+($Lon_buffer/2)
				
				DOM GET XML ATTRIBUTE BY NAME:C728($Dom_svgObject;"y";$Lon_y)
				DOM GET XML ATTRIBUTE BY NAME:C728($Dom_svgObject;"height";$Lon_buffer)
				$Num_cy:=$Lon_y+($Lon_buffer/2)
				
				  //______________________________________________________
		End case 
		  //]
		
		Component_errorHandler ("ERROR_ON")
		  //}
		
		$Txt_value:=$Txt_value\
			+"rotate("+String:C10($Num_angle;"&xml")\
			+","+String:C10($Num_cx;"&xml")\
			+","\
			+String:C10($Num_cy;"&xml")\
			+")"
		
		DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
			"transform";$Txt_value)
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 