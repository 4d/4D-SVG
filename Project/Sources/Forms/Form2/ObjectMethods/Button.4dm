C_LONGINT:C283($Lon_bottom;$Lon_left;$Lon_right;$Lon_top)
C_TEXT:C284($Dom_rect;$Dom_svg)

OBJECT GET COORDINATES:C663(*;"Variable";$Lon_left;$Lon_top;$Lon_right;$Lon_bottom)
$Dom_svg:=SVG_New ($Lon_right-$Lon_left;$Lon_bottom-$Lon_top)
$Dom_rect:=SVG_New_rect ($Dom_svg;0;0;-1;-1)
SVG_SET_DIMENSIONS ($Dom_rect;100;100;"%")


(OBJECT Get pointer:C1124(Object named:K67:5;"Variable"))->:=SVG_Export_to_picture ($Dom_svg)
SVG_CLEAR ($Dom_svg)