//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_PATH_ARC
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
C_REAL:C285($6)
C_LONGINT:C283($7)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($kTxt_currentMethod;$Txt_Command;$Txt_name;$Txt_parentReference;$Txt_Path)

If (False:C215)
	C_TEXT:C284(SVG_PATH_ARC ;$1)
	C_REAL:C285(SVG_PATH_ARC ;$2)
	C_REAL:C285(SVG_PATH_ARC ;$3)
	C_REAL:C285(SVG_PATH_ARC ;$4)
	C_REAL:C285(SVG_PATH_ARC ;$5)
	C_REAL:C285(SVG_PATH_ARC ;$6)
	C_LONGINT:C283(SVG_PATH_ARC ;$7)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=5)
	
	$Txt_parentReference:=$1
	
	$Txt_Command:="a"+String:C10($2;"&xml")+","+String:C10($3;"&xml")+" "
	
	If ($Lon_parameters>=6)
		
		$Txt_Command:=$Txt_Command+String:C10($6;"&xml")+" "
		
		If ($Lon_parameters>=7)
			
			Case of 
					
					  //………………………………………………………
				: ($7=0)
					
					$Txt_Command:=$Txt_Command+"0,1 "
					
					  //………………………………………………………
				: ($7=1)
					
					$Txt_Command:=$Txt_Command+"1,0 "
					
					  //………………………………………………………
				: ($7=2)
					
					$Txt_Command:=$Txt_Command+"0,0 "
					
					  //………………………………………………………
				: ($7=3)
					
					$Txt_Command:=$Txt_Command+"1,1 "
					
					  //………………………………………………………
				Else 
					
					$Txt_Command:=$Txt_Command+"0,1 "
					
					  //………………………………………………………
			End case 
		End if 
		
	Else 
		
		$Txt_Command:=$Txt_Command+"0 0,1 "
		
	End if 
	
	$Txt_Command:=$Txt_Command+String:C10($4;"&xml")+","+String:C10($5;"&xml")
	
	If (Storage:C1525.svg.options ?? 4)
		
		$Txt_Command:=Uppercase:C13($Txt_Command)
		
	End if 
	
	If (Storage:C1525.svg.options ?? 5)
		
		$Txt_Command:=$Txt_Command+"\r"
		
	End if 
	
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