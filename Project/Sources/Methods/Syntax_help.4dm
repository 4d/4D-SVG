//%attributes = {"invisible":true}
// ----------------------------------------------------
// Project method : Syntax_help
// Database: 4D SVG
// ID[485C6D26F7D24E3AB05D34BFE1D041B8]
// Created #22-5-2013 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($page : Text)

var $language; $url; $version; $WEB_AREA : Text

$WEB_AREA:="help"

$language:=WA Evaluate JavaScript:C1029(*; $WEB_AREA; "document.getElementsByTagName('html')[0].lang")

If (Length:C16($language)=0)
	
	$language:=Replace string:C233(Replace string:C233(\
		Localized document path:C1105("4DPop.xlf"); Get 4D folder:C485(Current resources folder:K5:16); "")\
		; ".lproj"+Folder separator:K24:12+"4DPop.xlf"; "")
	
End if 

$version:=Substring:C12(Application version:C493; 1; 2)

$url:="http://doc.4d.com/4Dv"+$version+"/help/Title/"+Choose:C955($language=""; "en"; $language)+"/page"+$page+".html"

WA OPEN URL:C1020(*; $WEB_AREA; $url)