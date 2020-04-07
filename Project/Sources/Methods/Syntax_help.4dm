//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project method : Syntax_help
  // Database: 4D SVG
  // ID[485C6D26F7D24E3AB05D34BFE1D041B8]
  // Created #22-5-2013 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  //
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($1)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($kTxt_webArea;$Txt_language;$Txt_url;$Txt_version)

If (False:C215)
	C_TEXT:C284(Syntax_help ;$1)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=1;"Missing parameter"))
	
	$kTxt_webArea:="help"
	
Else 
	
	ABORT:C156
	
End if 

  // ----------------------------------------------------
$Txt_language:=WA Evaluate JavaScript:C1029(*;$kTxt_webArea;"document.getElementsByTagName('html')[0].lang")

If (Length:C16($Txt_language)=0)
	
	$Txt_language:=Replace string:C233(Replace string:C233(\
		Get localized document path:C1105("4DPop.xlf");Get 4D folder:C485(Current resources folder:K5:16);"")\
		;".lproj"+Folder separator:K24:12+"4DPop.xlf";"")
	
End if 

$Txt_version:=Substring:C12(Application version:C493;1;2)

$Txt_url:="http://doc.4d.com/4Dv"+$Txt_version+"/help/Title/"+Choose:C955($Txt_language="";"en";$Txt_language)+"/page"+$1+".html"

WA OPEN URL:C1020(*;$kTxt_webArea;$Txt_url)

  // ----------------------------------------------------
  // End