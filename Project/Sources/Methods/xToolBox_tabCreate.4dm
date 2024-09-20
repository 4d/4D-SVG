//%attributes = {"invisible":true,"preemptive":"incapable"}
// ----------------------------------------------------
// Method : xToolBox_tabCreate
// Created 15/10/08 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($Ptr_target : Pointer; $Ptr_definitionArray : Pointer; $Txt_color : Text) : Integer

var $Dom_root; $Txt_defsID; $Txt_font; $Txt_groupReference; $Txt_objectID; $Txt_selected : Text
var $Txt_Stop; $Txt_tabRef : Text
var $Lon_bottom; $Lon_fontSize; $Lon_i; $Lon_left; $Lon_maxWidth; $Lon_offset : Integer
var $Lon_options; $Lon_right; $Lon_Selected; $Lon_start; $Lon_tabWidth; $Lon_top : Integer
var $Lon_width : Integer

$Lon_Selected:=$Ptr_definitionArray->
$Txt_font:="'Lucida grande','Arial'"
$Lon_fontSize:=10
$Lon_offset:=40

$Lon_tabWidth:=0

If (Not:C34(Is a list:C621(<>Lon_tabList)))
	
	<>Lon_tabList:=New list:C375
	
End if 

OBJECT GET COORDINATES:C663($Ptr_target->; $Lon_left; $Lon_top; $Lon_right; $Lon_bottom)

$Lon_maxWidth:=$Lon_right-$Lon_left

//       ___________________
// / ACI0070028
// || Date 02/05/11
// ( ) Vincent de Lachaux
//       ___________________
$Lon_options:=SVG_Get_options
SVG_SET_OPTIONS

//       ___________________

$Dom_root:=SVG_New(Screen width:C187; 30; ""; ""; True:C214)

$Txt_defsID:=DOM Find XML element:C864($Dom_root; "svg/defs")
$Txt_objectID:=DOM Create XML element:C865($Txt_defsID; "linearGradient"; \
"id"; "gbackground"; \
"spreadMethod"; "reflect")
DOM SET XML ATTRIBUTE:C866($Txt_objectID; \
"x1"; 0; \
"y1"; 0; \
"x2"; 0; \
"y2"; 1)
$Txt_Stop:=DOM Create XML element:C865($Txt_objectID; "stop"; \
"offset"; "0%"; \
"stop-color"; $Txt_color)
DOM SET XML ATTRIBUTE:C866($Txt_Stop; \
"stop-opacity"; 0.6)
$Txt_Stop:=DOM Create XML element:C865($Txt_objectID; "stop"; \
"offset"; "80%"; \
"stop-color"; $Txt_color)
DOM SET XML ATTRIBUTE:C866($Txt_Stop; \
"stop-opacity"; 0.95)
$Txt_objectID:=DOM Create XML element:C865($Txt_defsID; "linearGradient"; \
"id"; "gClicked"; \
"spreadMethod"; "reflect")
DOM SET XML ATTRIBUTE:C866($Txt_objectID; \
"x1"; 0; \
"y1"; 0; \
"x2"; 0; \
"y2"; 1)
$Txt_Stop:=DOM Create XML element:C865($Txt_objectID; "stop"; \
"offset"; "0%"; \
"stop-color"; $Txt_color)
DOM SET XML ATTRIBUTE:C866($Txt_Stop; \
"stop-opacity"; 0.2)
$Txt_Stop:=DOM Create XML element:C865($Txt_objectID; "stop"; \
"offset"; "80%"; \
"stop-color"; $Txt_color)
DOM SET XML ATTRIBUTE:C866($Txt_Stop; \
"stop-opacity"; 0.5)

SVG_New_rect($Dom_root; 0; 0; Screen width:C187; 30; 0; 0; $Txt_color; "url(#gbackground)"; 0)

$Txt_groupReference:=SVG_New_group($Dom_root; "tabs")

For ($Lon_i; 1; Size of array:C274($Ptr_definitionArray->); 1)
	
	$Txt_tabRef:=SVG_New_group($Txt_groupReference; "tab_"+String:C10($Lon_i))
	$Lon_start:=$Lon_start+$Lon_width
	$Lon_width:=SVG_Get_string_width($Ptr_definitionArray->{$Lon_i}; $Txt_font; $Lon_fontSize)+$Lon_offset
	SVG_New_rect($Txt_tabRef; $Lon_start; 0.5; $Lon_width; 20; 0; 0; "white"; "white"; 1)
	SVG_New_rect($Txt_tabRef; $Lon_start; 0; $Lon_width; 20; 0; 0; $Txt_color; "url(#gbackground)"; 1)
	$Txt_selected:=SVG_New_rect($Txt_tabRef; $Lon_start; 0; $Lon_width; 20; 0; 0; $Txt_color; "url(#gClicked)")
	SVG_SET_ID($Txt_selected; "selected_"+String:C10($Lon_i))
	SVG_SET_VISIBILITY($Txt_selected; $Lon_Selected=$Lon_i)
	SVG_New_text($Txt_tabRef; $Ptr_definitionArray->{$Lon_i}; $Lon_start+($Lon_width/2); 4; $Txt_font; $Lon_fontSize; Plain:K14:1; Align center:K42:3; "white")
	$Lon_tabWidth:=$Lon_tabWidth+$Lon_width
	
End for 

// Center

$Lon_offset:=($Lon_maxWidth/2)-($Lon_tabWidth/2)
SVG_SET_TRANSFORM_TRANSLATE($Txt_groupReference; $Lon_offset; 5)

SVG EXPORT TO PICTURE:C1017($Dom_root; $Ptr_target->)

SVG_SET_OPTIONS($Lon_options)

<>svg_tabID:=<>svg_tabID+1
APPEND TO LIST:C376(<>Lon_tabList; ""; <>svg_tabID)
SET LIST ITEM PARAMETER:C986(<>Lon_tabList; <>svg_tabID; "DOM"; $Dom_root)
SET LIST ITEM PARAMETER:C986(<>Lon_tabList; <>svg_tabID; "width"; $Lon_tabWidth)
SET LIST ITEM PARAMETER:C986(<>Lon_tabList; <>svg_tabID; "selected"; $Lon_Selected)

return <>svg_tabID