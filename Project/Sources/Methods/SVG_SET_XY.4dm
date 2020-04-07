//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_XY
  // Created 17/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)
C_REAL:C285($2)
C_REAL:C285($3)

C_LONGINT:C283($Lon_parameters)
C_REAL:C285($Num_x;$Num_y)
C_TEXT:C284($kTxt_currentMethod;$Txt_name;$Txt_objectID)

If (False:C215)
	C_TEXT:C284(SVG_SET_XY ;$1)
	C_REAL:C285(SVG_SET_XY ;$2)
	C_REAL:C285(SVG_SET_XY ;$3)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Num_x:=-1
	$Num_y:=-1
	
	$Txt_objectID:=$1
	$Num_x:=$2
	
	If ($Lon_parameters>=3)
		
		$Num_y:=$3
		
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Txt_objectID);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM GET XML ELEMENT NAME:C730($Txt_objectID;$Txt_name)
		
		If ($Num_x#-1)
			
			DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
				"x";$Num_x)
			
		End if 
		
		If (OK=1)\
			 & ($Num_y#-1)
			
			DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
				"y";$Num_y)
			
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 