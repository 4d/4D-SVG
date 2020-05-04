//%attributes = {}
  // Color palette - Optimized version
  // The generated XML is less than half relative to the example for the command SVG_Color_from_index
  // This is possible by using a style definition
C_LONGINT:C283($Lon_column;$Lon_i;$Lon_id;$Lon_ii;$Lon_line;$Lon_start)
C_TEXT:C284($Dom_rect;$Dom_svg)

If (Shift down:C543)
	
	SVG_SET_OPTIONS (SVG_Get_options  ?- 5)
	
Else 
	
	SVG_SET_OPTIONS (SVG_Get_options  ?+ 5)
	
End if 

$Lon_start:=Milliseconds:C459

$Dom_svg:=SVG_New 
SVG_Define_style ($Dom_svg;"rect{width:11;height:11;stroke-width:1;stroke:white}")

For ($Lon_ii;0;15;1)
	
	$Lon_column:=0
	
	For ($Lon_i;1;16;1)
		
		$Lon_id:=($Lon_ii*16)+$Lon_i
		
		$Dom_rect:=DOM Create XML element:C865($Dom_svg;"rect";\
			"fill";SVG_Color_from_index ($Lon_id);\
			"x";$Lon_column;\
			"y";$Lon_line;\
			"id";String:C10($Lon_id))
		
		$Lon_column:=$Lon_column+11
		
	End for 
	
	$Lon_line:=$Lon_line+11
	
End for 

SVGTool_SHOW_IN_VIEWER ($Dom_svg)
SVG_CLEAR ($Dom_svg)

  //ALERT(String(Milliseconds-$Lon_start))