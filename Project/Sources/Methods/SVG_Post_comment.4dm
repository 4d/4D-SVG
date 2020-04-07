//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method :  SVG_Post_comment
  // Created 21/06/10 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //SVG_Post_comment (svg_ref ; text ) -> svg_ref
  //This command adds the text parameter as a comment
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_svgObject;$kTxt_currentMethod;$Txt_comment)

If (False:C215)
	C_TEXT:C284(SVG_Post_comment ;$0)
	C_TEXT:C284(SVG_Post_comment ;$1)
	C_TEXT:C284(SVG_Post_comment ;$2)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=2;Get localized string:C991("error_missingParameter")))
	
	$Dom_svgObject:=$1
	$Txt_comment:=$2
	
	$kTxt_currentMethod:="SVG_Post_comment"  //Nom methode courante
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 

  // ----------------------------------------------------

Component_errorHandler ("init";$kTxt_currentMethod)

If (Length:C16($Txt_comment)>0)
	
	$0:=DOM Append XML child node:C1080($Dom_svgObject;XML comment:K45:8;$Txt_comment)
	
End if 

ASSERT:C1129(Component_errorHandler ("deinit"))