//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_TEXT_LETTERSPACING
  // Created 08/04/10 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // http://www.w3.org/TR/SVG/text.html#LetterSpacingProperty
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($1)
C_REAL:C285($2)
C_TEXT:C284($3)

C_LONGINT:C283($Lon_parameters)
C_REAL:C285($Num_letterspacing)
C_TEXT:C284($Dom_svgObject;$kTxt_currentMethod;$Txt_letterSpacing;$Txt_Name;$Txt_unit)

If (False:C215)
	C_TEXT:C284(SVG_SET_TEXT_LETTER_SPACING ;$1)
	C_REAL:C285(SVG_SET_TEXT_LETTER_SPACING ;$2)
	C_TEXT:C284(SVG_SET_TEXT_LETTER_SPACING ;$3)
End if 

  // ----------------------------------------------------
  // Initialisations
Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_SET_TEXT_LETTERSPACING"  //Nom methode courante

  // ----------------------------------------------------

If ($Lon_parameters>=2)
	
	$Dom_svgObject:=$1
	$Num_letterspacing:=$2
	
	$Txt_unit:="%"
	
	If ($Lon_parameters>=3)
		
		$Txt_unit:=$3
		
	End if 
	
	$Txt_letterSpacing:=String:C10($Num_letterspacing;"&xml")+$Txt_unit
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM GET XML ELEMENT NAME:C730($Dom_svgObject;$Txt_Name)
		
		ARRAY TEXT:C222($tTxt_objects;0x0000)
		COLLECTION TO ARRAY:C1562(Storage:C1525.svg["text content element"];$tTxt_objects)
		
		If (Find in array:C230($tTxt_objects;$Txt_Name)>0)
			
			If ($Num_letterspacing=-1)
				
				DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
					"letter-spacing";"normal")
				
			Else 
				
				DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
					"letter-spacing";$Txt_letterSpacing)
				
			End if 
			
		Else 
			
			ASSERT:C1129(Component_putError (8854))  //Impossible to apply this Command for this Node
			
		End if 
		
		  //#ACI0091143
		CLEAR VARIABLE:C89($tTxt_objects)
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 