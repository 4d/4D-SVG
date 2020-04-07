//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Copy
  // Created 16/06/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // Create a copy of the svg document
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_new;$kTxt_currentMethod;$Txt_Buffer;$Txt_svgObject)

If (False:C215)
	C_TEXT:C284(SVG_Copy ;$0)
	C_TEXT:C284(SVG_Copy ;$1)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_Copy"  //Nom methode courante

Case of 
		
		  //______________________________________________________
	: ($Lon_parameters=0)
		
		ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Argument missing
		
		  //________________________________________
	: (Not:C34(xml_referenceValid ($1)))
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
		  //______________________________________________________
	Else 
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		$Txt_svgObject:=$1
		
		  //       ___________________
		  //  /   ACI0072296
		  // ||   Date 18/07/11
		  //(   ) Vincent de Lachaux
		  //       ___________________
		XML SET OPTIONS:C1090($Txt_svgObject;XML indentation:K45:34;XML no indentation:K45:36)
		
		  //       ___________________
		
		DOM EXPORT TO VAR:C863($Txt_svgObject;$Txt_Buffer)
		
		If (OK=1)
			
			$Dom_new:=DOM Parse XML variable:C720($Txt_Buffer)
			
			If (OK=1)
				
				  // Store the reference {
				Use (Storage:C1525.svg)
					
					If (Storage:C1525.svg.docs=Null:C1517)
						
						Storage:C1525.svg.docs:=New shared collection:C1527
						
					End if 
					
					Storage:C1525.svg.docs.push($Dom_new)
					
				End use 
				  //}
				
				$0:=$Dom_new
				
			End if 
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
		  //______________________________________________________
End case 