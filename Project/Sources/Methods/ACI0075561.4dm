//%attributes = {}
  //METHOD GET NAMES((OBJECT Get pointer(Object named;"methodNames"))->;"SVG_@")C_TEXT($Dom_g;$Dom_rect;$Dom_svg)
C_TEXT:C284($Dom_g;$Dom_rect;$Dom_svg)

SVG_SET_OPTIONS (SVG_Get_options  ?+ 5)

$Dom_svg:=SVG_New 

  //$Dom_pict:=SVG_New_image ($Dom_svg;"mona.jpg";10;10)
  //SVG_SET_TRANSFORM_FLIP ($Dom_pict;False;False)

$Dom_g:=SVG_New_group ($Dom_svg)
SVG_SET_SHAPE_RENDERING ($Dom_g;"crispEdges")

SVG_New_line ($Dom_g;0;0;100;0;"blue")
SVG_New_line ($Dom_g;0;0;0;100;"blue")

$Dom_rect:=SVG_New_rect ($Dom_g;100;100;100;200)

SVG_SET_TRANSFORM_FLIP ($Dom_g;True:C214;True:C214)
SVG_SET_TRANSFORM_TRANSLATE ($Dom_g;-300;-400)

  //SVG_SET_VIEWBOX ($Dom_svg;0;0;400;200)
  //$tx:=SVG_New_text ($Dom_svg;"4D";10;0;"";96)
  //SVG_SET_FONT_COLOR ($tx;"blue")  //Change the color
  //
  //  //Effect:
  //$tx:=SVG_New_text ($Dom_svg;"4D";10;0;"";96)  //Take the same text
  //SVG_SET_FONT_COLOR ($tx;"lightblue")  // Change the color
  //SVG_SET_TRANSFORM_FLIP ($tx;True)  //Apply a vertical flip
  //SVG_SET_TRANSFORM_SKEW ($tx;-10)  //Incline
  //SVG_SET_TRANSFORM_TRANSLATE ($tx;-17;-193)  //Reposition

SVGTool_SHOW_IN_VIEWER ($Dom_svg)

SVG_CLEAR ($Dom_svg)