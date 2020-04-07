//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_TEXT_ANCHOR
  // Created 10/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)
C_LONGINT:C283($2)

C_LONGINT:C283($Lon_fontAlignment;$Lon_parameters)
C_TEXT:C284($Dom_svgObject;$kTxt_currentMethod;$Txt_Name)

If (False:C215)
	C_TEXT:C284(SVG_SET_TEXT_ANCHOR ;$1)
	C_LONGINT:C283(SVG_SET_TEXT_ANCHOR ;$2)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_SET_TEXT_ANCHOR"  //Nom methode courante

If ($Lon_parameters>=2)
	
	$Dom_svgObject:=$1
	$Lon_fontAlignment:=$2
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM GET XML ELEMENT NAME:C730($Dom_svgObject;$Txt_Name)
		
		ARRAY TEXT:C222($tTxt_objects;0x0000)
		COLLECTION TO ARRAY:C1562(Storage:C1525.svg["text content element"];$tTxt_objects)
		
		If (Find in array:C230($tTxt_objects;$Txt_Name)>0)
			
			Case of 
					
					  //.....................................................
				: ($Lon_fontAlignment=Align center:K42:3)
					
					If ($Txt_Name="textArea")
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
							"text-align";"center")
						
					Else 
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
							"text-anchor";"middle")
						
					End if 
					
					  //.....................................................
				: ($Lon_fontAlignment=Align right:K42:4)
					
					If ($Txt_Name="textArea")
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
							"text-align";"end")
						
					Else 
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
							"text-anchor";"end")
						
					End if 
					
					  //.....................................................
				: ($Lon_fontAlignment=Align left:K42:2)\
					 | ($Lon_fontAlignment=Align default:K42:1)
					
					If ($Txt_Name="textArea")
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
							"text-align";"start")
						
					Else 
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
							"text-anchor";"start")
						
					End if 
					
					  //.....................................................
				: ($Lon_fontAlignment=5)\
					 & ($Txt_Name="textArea")
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
						"text-align";"justify")
					
					  //.....................................................
				Else 
					
					If ($Txt_Name="textArea")
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
							"text-align";"inherit")
						
					Else 
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
							"text-anchor";"inherit")
						
					End if 
					
					  //.....................................................
			End case 
			
			ASSERT:C1129(Component_errorHandler ("deinit"))
			
		Else 
			
			ASSERT:C1129(Component_putError (8854))  //Impossible to apply this Command for this Node
			
		End if 
		
		  //#ACI0091143
		CLEAR VARIABLE:C89($tTxt_objects)
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 