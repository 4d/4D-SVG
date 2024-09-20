//%attributes = {"invisible":true}
var <>SVG_viewerSource : Text
var <>SVG_viewerPicture : Picture
var <>SVG_viewerPictureBackup : Picture
var <>SVG_Txt_Viewer_Callback_Method : Text

var <>showColoredBackground : Boolean
var <>backgroundColor : Integer
var <>sourceFontSize : Integer
var <>automaticallyResize : Boolean

var <>Lon_tabID : Integer
var <>Pic_viewerTab : Picture

var <>svg_recentMenuRef : Text

var <>Lon_viewerTimerEvent : Integer

var <>svg_tabID : Integer
var <>Lon_tabList : Integer

var <>lst_syntax; <>Lon_currentElement : Integer
var <>Txt_Name : Text
var <>Lon_timerEvent : Integer
var <>bDocumentation : Integer

var <>Lon_opacity : Integer

var <>Ptr_Document : Pointer  // Pointer to the Document variable of the host database

If (False:C215)
	
	ARRAY BOOLEAN:C223(<>tBoo_listbox; 0)
	ARRAY PICTURE:C279(<>tPic_Colors; 0x0000)
	ARRAY TEXT:C222(<>tTxt_colorNames; 0x0000)
	
End if 