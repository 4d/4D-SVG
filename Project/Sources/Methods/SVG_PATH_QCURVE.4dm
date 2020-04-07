//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_PATH_ADD_CURVE
  // Created 22/08/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)
C_REAL:C285($2)
C_REAL:C285($3)
C_REAL:C285($4)
C_REAL:C285($5)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($kTxt_currentMethod;$Txt_Command;$Txt_name;$Txt_parentReference;$Txt_Path)

If (False:C215)
	C_TEXT:C284(SVG_PATH_QCURVE ;$1)
	C_REAL:C285(SVG_PATH_QCURVE ;$2)
	C_REAL:C285(SVG_PATH_QCURVE ;$3)
	C_REAL:C285(SVG_PATH_QCURVE ;$4)
	C_REAL:C285(SVG_PATH_QCURVE ;$5)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Txt_parentReference:=$1
	
	If ($Lon_parameters>=4)
		
		$Txt_Command:="q"
		$Txt_Command:=$Txt_Command+String:C10($2;"&xml")+","+String:C10($3;"&xml")+" "
		$Txt_Command:=$Txt_Command+String:C10($4;"&xml")+","+String:C10($5;"&xml")
		
	Else 
		
		$Txt_Command:="t"
		$Txt_Command:=$Txt_Command+String:C10($2;"&xml")+","+String:C10($3;"&xml")
		
	End if 
	
	If (Storage:C1525.svg.options ?? 4)
		
		$Txt_Command:=Uppercase:C13($Txt_Command)
		
	End if 
	
	$Txt_Command:=Choose:C955(Storage:C1525.svg.options ?? 5;$Txt_Command+"\r";Replace string:C233($Txt_Command;",-";"-"))
	
	If (Asserted:C1132(xml_referenceValid ($Txt_parentReference);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM GET XML ELEMENT NAME:C730($Txt_parentReference;$Txt_name)
		
		If ($Txt_name="path")
			
			DOM GET XML ATTRIBUTE BY NAME:C728($Txt_parentReference;"d";$Txt_Path)
			
			If (OK=1)
				
				DOM SET XML ATTRIBUTE:C866($Txt_parentReference;\
					"d";$Txt_Path+" "+$Txt_Command)
				
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