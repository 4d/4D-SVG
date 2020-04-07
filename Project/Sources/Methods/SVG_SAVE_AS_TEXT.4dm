//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SAVE_AS_TEXT
  // Created 16/03/06
  // Framework SVgg
  // Author : Gérald Czwiklinski
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (16/06/08)
  // 2004 -> v11
  // ----------------------------------------------------
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_buffer;$Dom_svgObject;$kTxt_currentMethod;$Txt_buffer;$Txt_pathname)

If (False:C215)
	C_TEXT:C284(SVG_SAVE_AS_TEXT ;$1)
	C_TEXT:C284(SVG_SAVE_AS_TEXT ;$2)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_SAVE_AS_TEXT"  //Nom methode courante

If ($Lon_parameters>=1)
	
	$Dom_svgObject:=$1
	
	If ($Lon_parameters>=2)
		
		$Txt_pathname:=$2
		
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		  //       ___________________ 11.5
		  //  /   ACI0063507
		  // ||   Date 17/11/09
		  // (  )  Vincent de Lachaux
		  //       ___________________
		  // Add a test for the path length
		If (Length:C16($Txt_pathname)>0)
			
			  //       ___________________
			
			If (Position:C15(Folder separator:K24:12;$Txt_pathname)=0)
				
				$Txt_pathname:=Get 4D folder:C485(Database folder:K5:14;*)+$Txt_pathname
				
			End if 
		End if 
		
		  // Turn_around #ACI0093875
		  //#ACI0093774 {
		  //DOM EXPORT TO FILE($Dom_svgObject;$Txt_pathname)
		DOM EXPORT TO VAR:C863($Dom_svgObject;$Txt_buffer)
		$Txt_buffer:=Replace string:C233($Txt_buffer;" xmlns=\"\"";"")
		$Dom_buffer:=DOM Parse XML variable:C720($Txt_buffer)
		CLEAR VARIABLE:C89($Txt_buffer)
		DOM EXPORT TO FILE:C862($Dom_buffer;$Txt_pathname)
		DOM CLOSE XML:C722($Dom_buffer)
		  //}
		
		If (OK=1)
			
			  // If (Not(Is nil pointer(<>Ptr_Document)))
			  //<>Ptr_Document->:=DOCUMENT
			  // End if
			
			If (Num:C11(Storage:C1525.svg.variableDocument)>0)
				
				CALL WORKER:C1389(1;"fallBack_Not_thread_safe";New object:C1471(\
					"document";DOCUMENT))
				
			End if 
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  // The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  // Parameters Missing
	
End if 