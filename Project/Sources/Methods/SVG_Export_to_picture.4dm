//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Export_to_picture
  // Created 22/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_PICTURE:C286($0)
C_TEXT:C284($1)
C_LONGINT:C283($2)

C_LONGINT:C283($Lon_exportType;$Lon_parameters)
C_PICTURE:C286($Pic_Buffer)
C_TEXT:C284($kTxt_currentMethod;$Txt_svgObject)

If (False:C215)
	C_PICTURE:C286(SVG_Export_to_picture ;$0)
	C_TEXT:C284(SVG_Export_to_picture ;$1)
	C_LONGINT:C283(SVG_Export_to_picture ;$2)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=1)
	
	$Txt_svgObject:=$1
	
	$Lon_exportType:=Copy XML data source:K45:17
	
	If ($Lon_parameters>=2)
		
		$Lon_exportType:=$2
		
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Txt_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		SVG EXPORT TO PICTURE:C1017($Txt_svgObject;$Pic_Buffer;$Lon_exportType)
		
		If (OK=1)
			
			$0:=$Pic_Buffer
			
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 