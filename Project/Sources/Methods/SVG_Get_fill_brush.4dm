//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Project method : SVG_Get_fill_brush
  // Database: 4D SVG
  // ID[70600DADB38149E786B8CD6800B420F5]
  // Created 19-2-2013 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  //
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($0)
C_TEXT:C284($1)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_svgObject;$Txt_Error_Method;$Txt_fill)

If (False:C215)
	C_TEXT:C284(SVG_Get_fill_brush ;$0)
	C_TEXT:C284(SVG_Get_fill_brush ;$1)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=1;"Missing parameter"))
	
	$Dom_svgObject:=$1
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		$Txt_Error_Method:=Method called on error:C704
		ON ERR CALL:C155("xToolBox_NO_ERROR")
		DOM GET XML ATTRIBUTE BY NAME:C728($Dom_svgObject;"fill";$Txt_fill)
		ON ERR CALL:C155($Txt_Error_Method)
		
		$0:=$Txt_fill
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;Current method name:C684))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;Current method name:C684))  //Parameters Missing
	
End if 

  // ----------------------------------------------------
  // End