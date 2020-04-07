//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_TEXT_WRITING_MODE
  // Created 08/04/10 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // http://www.w3.org/TR/SVG/text.html#WritingModeProperty
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_svgObject;$kTxt_currentMethod;$Txt_Name;$Txt_writingMode)

If (False:C215)
	C_TEXT:C284(SVG_SET_TEXT_WRITING_MODE ;$1)
	C_TEXT:C284(SVG_SET_TEXT_WRITING_MODE ;$2)
End if 

  // ----------------------------------------------------
  // Initialisations
Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_SET_TEXT_WRITING_MODE"  //Nom methode courante

  // ----------------------------------------------------

If ($Lon_parameters>=2)
	
	$Dom_svgObject:=$1
	$Txt_writingMode:=$2
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM GET XML ELEMENT NAME:C730($Dom_svgObject;$Txt_Name)
		
		ARRAY TEXT:C222($tTxt_objects;0x0000)
		COLLECTION TO ARRAY:C1562(Storage:C1525.svg["text content element"];$tTxt_objects)
		
		If (Find in array:C230($tTxt_objects;$Txt_Name)>0)
			
			ARRAY TEXT:C222($tTxt_values;0x0000)
			COLLECTION TO ARRAY:C1562(Storage:C1525.svg["writing-mode"];$tTxt_values)
			
			Case of 
					
					  //……………………………………………………………………………
				: (Length:C16($Txt_writingMode)=0)
					
					DOM REMOVE XML ATTRIBUTE:C1084($Dom_svgObject;"writing-mode")
					
					  //……………………………………………………………………………
				: (Find in array:C230($tTxt_values;$Txt_writingMode)>0)
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
						"writing-mode";$Txt_writingMode)
					
					  //……………………………………………………………………………
				Else 
					
					ASSERT:C1129(Component_putError (8857;$kTxt_currentMethod))  //Invalid Value for an Argument
					
					  //……………………………………………………………………………
			End case 
			
			  //#ACI0091143
			CLEAR VARIABLE:C89($tTxt_values)
			
			ASSERT:C1129(Component_errorHandler ("deinit"))
			
		Else 
			
			ASSERT:C1129(Component_putError (8854;$kTxt_currentMethod))  //Impossible to apply this Command for this Node
			
		End if 
		
		  //#ACI0091143
		CLEAR VARIABLE:C89($tTxt_objects)
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 