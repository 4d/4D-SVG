//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SCALING_CENTERED
  // Created 19/02/13 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)
C_REAL:C285($2)
C_REAL:C285($3)
C_REAL:C285($4)

C_BOOLEAN:C305($Boo_coordinates)
C_LONGINT:C283($Lon_buffer;$Lon_parameters;$Lon_x;$Lon_y)
C_REAL:C285($Num_scale;$Num_X;$Num_Y)
C_TEXT:C284($Dom_svgObject;$kTxt_currentMethod;$Txt_value)

If (False:C215)
	C_TEXT:C284(SVG_SCALING_CENTERED ;$1)
	C_REAL:C285(SVG_SCALING_CENTERED ;$2)
	C_REAL:C285(SVG_SCALING_CENTERED ;$3)
	C_REAL:C285(SVG_SCALING_CENTERED ;$4)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Dom_svgObject:=$1
	$Num_scale:=$2
	
	$Boo_coordinates:=($Lon_parameters>=4)
	
	If ($Boo_coordinates)
		
		$Num_X:=$3  // {x} (middle)
		$Num_Y:=$4  // {y} (middle)
		
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		If (Not:C34($Boo_coordinates))
			
			DOM GET XML ATTRIBUTE BY NAME:C728($Dom_svgObject;"x";$Lon_x)
			DOM GET XML ATTRIBUTE BY NAME:C728($Dom_svgObject;"width";$Lon_buffer)
			$Num_X:=$Lon_x+($Lon_buffer/2)
			
			DOM GET XML ATTRIBUTE BY NAME:C728($Dom_svgObject;"y";$Lon_y)
			DOM GET XML ATTRIBUTE BY NAME:C728($Dom_svgObject;"height";$Lon_buffer)
			$Num_Y:=$Lon_y+($Lon_buffer/2)
			
		End if 
		
		  //translate(-centreX*(n-1), -centreY*(n-1)) scale(n)
		$Txt_value:="translate("+String:C10(-$Num_X*($Num_scale-1);"&xml")+", "+String:C10(-$Num_Y*($Num_scale-1);"&xml")+") scale("+String:C10($Num_scale;"&xml")+")"
		
		DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
			"transform";$Txt_value)
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 