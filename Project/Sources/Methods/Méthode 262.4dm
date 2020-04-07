//%attributes = {}
C_LONGINT:C283($Lon_bottom;$Lon_height;$Lon_left;$Lon_right;$Lon_top)
C_LONGINT:C283($Lon_width)
C_TEXT:C284($Dom_clip;$Dom_g;$Dom_rect;$Dom_svg;$Dom_text)
C_TEXT:C284($Txt_buffer)

GET PRINTABLE MARGIN:C711($Lon_left;$Lon_top;$Lon_right;$Lon_bottom)
GET PRINTABLE AREA:C703($Lon_height;$Lon_width)

$Lon_width:=$Lon_width-$Lon_left-$Lon_right
$Lon_height:=$Lon_height-$Lon_top-$Lon_bottom

$Dom_svg:=SVG_New ($Lon_width;$Lon_height)

$Dom_g:=SVG_New_group ($Dom_svg)

$Dom_rect:=SVG_New_rect ($Dom_g;0;0;$Lon_width;$Lon_height;0;0;"black";"red:10")
$Dom_text:=SVG_New_textArea ($Dom_g;"PAGE - 1";0;0;$Lon_width;$Lon_height;"Arial";36;Bold:K14:2;Align center:K42:3)

$Dom_rect:=SVG_New_rect ($Dom_g;0;$Lon_height;$Lon_width;$Lon_height;0;0;"black";"blue:10")
$Dom_text:=SVG_New_textArea ($Dom_g;"PAGE - 2";0;$Lon_height;$Lon_width;$Lon_height;"Arial";36;Bold:K14:2;Align center:K42:3)

$Dom_clip:=SVG_Define_clip_Path ($Dom_svg;"page-1")
$Dom_rect:=SVG_New_rect ($Dom_clip;0;0;$Lon_width;$Lon_height)

$Dom_clip:=SVG_Define_clip_Path ($Dom_svg;"page-2")
$Dom_rect:=SVG_New_rect ($Dom_clip;0;$Lon_height;$Lon_width;$Lon_height)

Case of 
		
		  //______________________________________________________
	: (False:C215)  // page 1
		
		$Txt_buffer:="page-1.pdf"
		SVG_SET_CLIP_PATH ($Dom_g;"page-1")
		
		  //______________________________________________________
	: (True:C214)  // page 2
		
		$Txt_buffer:="page-2.pdf"
		SVG_SET_CLIP_PATH ($Dom_g;"page-2")
		SVG_SET_TRANSFORM_TRANSLATE ($Dom_svg;0;-$Lon_height)
		
		  //______________________________________________________
	Else 
		
		  //______________________________________________________
End case 

SVG_SAVE_AS_PICTURE ($Dom_svg;System folder:C487(Desktop:K41:16)+$Txt_buffer;".pdf")
SVGTool_SHOW_IN_VIEWER ($Dom_svg)

  //Don't forget to clear the memory
SVG_CLEAR ($Dom_svg)