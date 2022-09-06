//%attributes = {}
C_LONGINT:C283($Lon_error)
C_TEXT:C284($Txt_buffer;$Txt_method;$Txt_pattern;$Txt_patternTemplate;$Txt_replacement)


$Txt_patternTemplate:="(?m)^(.*?(?:SVG_|SVGTool_).*?[^\"])(%)(.*?)$"
$Txt_replacement:="\\1\"\\2\"\\3"

GET MACRO PARAMETER:C997(Full method text:K5:17;$Txt_method)

$Txt_pattern:=Replace string:C233($Txt_patternTemplate;"%";"crispEdges|Black")

Repeat 
	
	$Txt_buffer:=$Txt_method
	$Lon_error:=Rgx_SubstituteText ($Txt_pattern;$Txt_replacement;->$Txt_method;0)
	
Until (($Lon_error#0)\
 | ($Txt_buffer=$Txt_method))

SET MACRO PARAMETER:C998(Full method text:K5:17;$Txt_method)