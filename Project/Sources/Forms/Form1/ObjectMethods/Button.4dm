C_LONGINT:C283($Lon_class;$Lon_column;$Lon_i;$Lon_ii;$Lon_line;$kLon_unit;$kLon_squareSide)
C_TEXT:C284($Dom_rect;$Dom_svg;$Dom_symbol;$Txt_nodeReference)

$kLon_unit:=10  //pixels
$kLon_squareSide:=512  //side of the square



$Dom_svg:=SVG_New 

  //define symbol
$Dom_symbol:=SVG_Define_symbol ($Dom_svg;"u";0;0;$kLon_unit;$kLon_unit)
$Dom_rect:=SVG_New_rect ($Dom_symbol;0;0;$kLon_unit;$kLon_unit;0;0;"inherit";"inherit";0)

  //define styles
SVG_Define_style ($Dom_svg;".b{fill:blue}")
SVG_Define_style ($Dom_svg;".r{fill:red}")
SVG_Define_style ($Dom_svg;".g{fill:green}")

  //%R-
For ($Lon_ii;0;$kLon_squareSide;1)
	
	$Lon_column:=0
	
	For ($Lon_i;1;$kLon_squareSide;1)
		
		$Txt_nodeReference:=DOM Create XML element:C865($Dom_svg;"use";"xlink:href";"#u";\
			"class";Choose:C955(Random:C100%3;"b";"r";"g");\
			"x";$Lon_column;\
			"y";$Lon_line)
		
		$Lon_column:=$Lon_column+$kLon_unit
		
	End for 
	
	$Lon_line:=$Lon_line+$kLon_unit
	
End for 
  //%R+

SVG EXPORT TO PICTURE:C1017($Dom_svg;(OBJECT Get pointer:C1124(Object named:K67:5;"map"))->;Own XML data source:K45:18)
