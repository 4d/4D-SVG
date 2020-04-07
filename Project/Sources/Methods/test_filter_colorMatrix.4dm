//%attributes = {}
C_TEXT:C284($Dom_filter;$Dom_node;$Dom_rect;$Dom_svg;$Txt_matrix)

SVG_SET_OPTIONS 

SVG_SET_OPTIONS (SVG_Get_options  ?+ 5)

$Dom_svg:=SVG_New 

$Dom_filter:=SVG_Define_filter ($Dom_svg;"Matrix")
$Txt_matrix:=\
".33 .33 .33 0 0 "\
+".33 .33 .33 0 0 "\
+".33 .33 .33 0 0 "\
+".33 .33 .33 0 0"
$Dom_node:=SVG_Filter_ColorMatrix ($Dom_filter;"SourceGraphic";"";"matrix";$Txt_matrix)

$Dom_filter:=SVG_Define_filter ($Dom_svg;"Saturate")
$Dom_node:=SVG_Filter_ColorMatrix ($Dom_filter;"SourceGraphic";"";"saturate";String:C10(1.5;"&xml"))

$Dom_filter:=SVG_Define_filter ($Dom_svg;"HueRotate90")
$Dom_node:=SVG_Filter_ColorMatrix ($Dom_filter;"SourceGraphic";"";"hueRotate";"90")

$Dom_filter:=SVG_Define_filter ($Dom_svg;"LuminanceToAlpha")
$Dom_node:=SVG_Filter_ColorMatrix ($Dom_filter;"SourceGraphic";"";"luminanceToAlpha")

$Dom_rect:=SVG_New_rect ($Dom_svg;2;0;797;100;0;0;"none";"coral")

$Dom_rect:=SVG_New_rect ($Dom_svg;2;100;797;100;0;0;"none";"coral")
SVG_SET_FILTER ($Dom_rect;"Matrix")

$Dom_rect:=SVG_New_rect ($Dom_svg;2;200;797;100;0;0;"none";"coral")
SVG_SET_FILTER ($Dom_rect;"Saturate")

$Dom_rect:=SVG_New_rect ($Dom_svg;2;300;797;100;0;0;"none";"coral")
SVG_SET_FILTER ($Dom_rect;"HueRotate90")

$Dom_rect:=SVG_New_rect ($Dom_svg;2;400;797;100;0;0;"none";"coral")
SVG_SET_FILTER ($Dom_rect;"LuminanceToAlpha")

SVG_New_text ($Dom_svg;"Pas de filtre";110;10;"Verdana";60;Bold:K14:2;-1;"black")
SVG_New_text ($Dom_svg;"Matrix";110;110;"Verdana";60;Bold:K14:2;-1;"black")
SVG_New_text ($Dom_svg;"Saturate";110;210;"Verdana";60;Bold:K14:2;-1;"black")
SVG_New_text ($Dom_svg;"HueRotate";110;310;"Verdana";60;Bold:K14:2;-1;"black")
SVG_New_text ($Dom_svg;"Luminance";110;410;"Verdana";60;Bold:K14:2;-1;"black")

  //View the result
SVGTool_SHOW_IN_VIEWER ($Dom_svg)

  //SVG_SAVE_AS_TEXT($Dom_svg;System folder(Desktop)+"export.svg")

  //Don't forget to clear the memory
SVG_CLEAR ($Dom_svg)