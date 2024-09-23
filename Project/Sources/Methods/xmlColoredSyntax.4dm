//%attributes = {"invisible":true}
// ----------------------------------------------------
// Project method : xmlColoredSyntax
// ID[20858E31C6A94C829CD0963124FCD4C1]
// Created 06/07/11 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
// Return colored XML to display in a Multi-style text object
// ----------------------------------------------------
#DECLARE($xml : Text) : Text

var $Txt_attributeFontWeight; $Txt_attributeNameColor; $Txt_attributeValueColor; $Txt_commentColor; $Txt_commentFontWeight; $Txt_defaultColor : Text
var $Txt_defaultFontWeight; $Txt_doctypeColor; $Txt_doctypeFontWeight; $Txt_elementColor; $Txt_elementFontWeight; $Txt_entityColor : Text
var $Txt_entityFontWeight; $Txt_pattern; $Txt_processingColor; $Txt_processingFontWeight; $Txt_styleAttribute; $Txt_styleComment : Text
var $Txt_styleDoctype; $Txt_styleElement; $Txt_styleEntity; $Txt_styleProcessing : Text
var $Lon_error : Integer

$Txt_defaultColor:=Get Application color scheme:C1763="dark" ? "white" : "black"
$Txt_defaultFontWeight:="normal"

$Txt_elementColor:="#2a2aa7"
$Txt_elementFontWeight:="normal"

$Txt_attributeFontWeight:="normal"
$Txt_attributeNameColor:="#f58953"
$Txt_attributeValueColor:="#9d3d0a"

$Txt_commentColor:="green"
$Txt_commentFontWeight:="normal"

$Txt_processingColor:="#8526C2"
$Txt_processingFontWeight:="normal"

$Txt_doctypeColor:="blue"
$Txt_doctypeFontWeight:="normal"

$Txt_entityColor:="#94961C"
$Txt_entityFontWeight:="normal"

$Txt_styleElement:="<span style=\"color:"+$Txt_elementColor\
+";font-weight:"+$Txt_elementFontWeight+";\">\\1</span>"

$Txt_styleAttribute:="<span style=\"color:"+$Txt_attributeNameColor\
+";font-weight:"+$Txt_attributeFontWeight\
+";\">\\1</span><span style=\"color:"+$Txt_defaultColor\
+";font-weight:"+$Txt_defaultFontWeight\
+";\">=\"<span style=\"color:"+$Txt_attributeValueColor\
+";font-weight:"+$Txt_attributeFontWeight\
+";\">\\2</span>\"</span>"

$Txt_styleComment:="<span style=\"color:"+$Txt_commentColor\
+";font-weight:"+$Txt_commentFontWeight+";\">\\1</span>"

$Txt_styleProcessing:="<span style=\"color:"+$Txt_processingColor\
+";font-weight:"+$Txt_processingFontWeight+";\">\\1</span>"

$Txt_styleDoctype:="<span style=\"color:"+$Txt_doctypeColor\
+";font-weight:"+$Txt_doctypeFontWeight+";\">\\1</span>"

$Txt_styleEntity:="<span style=\"color:"+$Txt_entityColor\
+";font-weight:"+$Txt_entityFontWeight+";\">\\1</span>"

// Replace < and > caracteres
$xml:=Replace string:C233($xml; "<"; "_§§")
$xml:=Replace string:C233($xml; ">"; "_¿¿")

// #ACI0098253
$xml:=Replace string:C233($xml; "&"; "&amp;")

// Processing instruction
$Txt_pattern:="(_\\?[^_¿¿]*\\?_¿¿)"
$Lon_error:=Rgx_SubstituteText($Txt_pattern; $Txt_styleProcessing; ->$xml)

// Attributes
$Txt_pattern:="(\\s+[^= ]*)=\"([^\"]*)\"(?!.*\\?_¿¿)"
$Lon_error:=Rgx_SubstituteText($Txt_pattern; $Txt_styleAttribute; ->$xml)

// Elements
$Txt_pattern:="(_\\[^?_¿¿]*_¿¿)"
$Lon_error:=Rgx_SubstituteText($Txt_pattern; $Txt_styleElement; ->$xml)

// Comments
$Txt_pattern:="(_\\!--.*?--_¿¿)"
$Lon_error:=Rgx_SubstituteText($Txt_pattern; $Txt_styleComment; ->$xml)

// Default
$xml:="<span style=\"color:"+$Txt_defaultColor\
+";font-weight:"+$Txt_defaultFontWeight+";\">"+$xml+"</span>"

// Doctype
$Txt_pattern:="(_\\\\![^-][^_¿¿]*_¿¿)"
$Lon_error:=Rgx_SubstituteText($Txt_pattern; $Txt_styleDoctype; ->$xml)

// Entities
$Txt_pattern:="(&amp;[^;]*;)"
$Lon_error:=Rgx_SubstituteText($Txt_pattern; $Txt_styleEntity; ->$xml)

// Restore < and > caracteres
$xml:=Replace string:C233($xml; "_§§"; "&lt;")
$xml:=Replace string:C233($xml; "_¿¿"; "&gt;")

return $xml