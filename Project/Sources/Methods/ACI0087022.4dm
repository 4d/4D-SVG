//%attributes = {}
C_TEXT:C284($Dom_svg;$Dom_text;$Txt_buffer)

SVG_SET_OPTIONS 
SVG_SET_OPTIONS (SVG_Get_options  ?+ 5)

$Dom_svg:=SVG_New 

$Dom_text:=SVG_New_text ($Dom_svg;"Hello\rworld";50;50)

ALERT:C41(SVG_Get_text ($Dom_text))

SVGTool_SHOW_IN_VIEWER ($Dom_svg)
SVG_CLEAR ($Dom_svg)