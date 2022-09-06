//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project method : draw_picture
  // Database: 4D SVG
  // ID[0E4F7D54AA0E4D9B8742D65D4BC65F53]
  // Created 28-2-2013 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  //
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($1)

C_BOOLEAN:C305($Boo_brightness;$Boo_grayscale;$Boo_skew)
C_LONGINT:C283($Lon_blur;$Lon_hue;$Lon_parameters;$Lon_rotate;$Lon_saturation;$Lon_skewX;$Lon_skewY;$Lon_transparency)
C_REAL:C285($Num_blue;$Num_green;$Num_red;$Num_scale)
C_TEXT:C284($Dom_filter;$Dom_group;$Dom_node;$Dom_picture;$Dom_root;$Dom_svg)

If (False:C215)
	C_TEXT:C284(draw_picture ;$1)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=1;"Missing parameter"))
	
	$Dom_root:=$1
	$Dom_node:=DOM Find XML element:C864($Dom_root;"root/picture")
	
	DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node;"saturation";$Lon_saturation)
	DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node;"r";$Num_red)
	DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node;"g";$Num_green)
	DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node;"b";$Num_blue)
	DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node;"link-rvb";$Boo_brightness)
	DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node;"scale";$Num_scale)
	DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node;"grayscale";$Boo_grayscale)
	DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node;"rotate";$Lon_rotate)
	DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node;"hue";$Lon_hue)
	DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node;"transparency";$Lon_transparency)
	DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node;"blur";$Lon_blur)
	DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node;"skew-x";$Lon_skewX)
	DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node;"skew-y";$Lon_skewY)
	DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node;"link-skew";$Boo_skew)
	
Else 
	
	ABORT:C156
	
End if 

  // ----------------------------------------------------

$Dom_svg:=SVG_New 

  //  SVG_SET_STROKE_DASHARRAY (SVG_New_rect ($Dom_svg;0;0;358;529;0;0;"grey";"none");1;2;3)

$Dom_group:=SVG_New_group ($Dom_svg)

If ($Boo_grayscale)
	
	SVG_FADE_TO_GREY_SCALE ($Dom_group)
	
Else 
	
	If ($Lon_saturation#0)
		
		SVG_SET_SATURATION ($Dom_group;$Lon_saturation+100)
		
	End if 
End if 

If ($Boo_brightness)
	
	If ($Num_red#0)
		
		$Dom_group:=SVG_New_group ($Dom_group)
		SVG_SET_BRIGHTNESS ($Dom_group;(0.00875*$Num_red)+1)
		
	End if 
	
Else 
	
	If ($Num_red#0) & ($Num_green#0) & ($Num_blue#0)
		
		$Dom_group:=SVG_New_group ($Dom_group)
		SVG_SET_BRIGHTNESS ($Dom_group;(0.00875*$Num_red)+1;(0.00875*$Num_green)+1;(0.00875*$Num_blue)+1)
		
	End if 
End if 

If ($Lon_hue#0)
	
	$Dom_group:=SVG_New_group ($Dom_group)
	SVG_SET_HUE ($Dom_group;$Lon_hue)
	
End if 

If ($Lon_blur#0)
	
	$Dom_filter:=SVG_Define_filter ($Dom_svg;"blur")
	SVG_Filter_Blur ($Dom_filter;$Lon_blur)
	
	$Dom_group:=SVG_New_group ($Dom_group)
	SVG_SET_FILTER ($Dom_group;"blur")
	
End if 

$Dom_picture:=SVG_New_image ($Dom_group;"#dev/mona.jpg";100;50)

If ($Num_scale#100)
	
	SVG_SCALING_CENTERED ($Dom_picture;$Num_scale/100)
	
End if 

If ($Lon_rotate#0)
	
	SVG_ROTATION_CENTERED ($Dom_picture;$Lon_rotate)
	
End if 

If ($Lon_transparency#0)
	
	SVG_SET_OPACITY ($Dom_picture;Abs:C99($Lon_transparency-100))
	
End if 

If ($Boo_skew) | (($Lon_skewX+$Lon_skewY)#0)
	
	SVG_SET_TRANSFORM_SKEW ($Dom_picture;$Lon_skewX;$Lon_skewY)
	
End if 

(OBJECT Get pointer:C1124(Object named:K67:5;"viewerPicture"))->:=SVG_Export_to_picture ($Dom_svg)
SVG_CLEAR ($Dom_svg)

  // ----------------------------------------------------
  // End