//%attributes = {"invisible":true}
C_TEXT:C284(<>SVG_viewerSource)
C_PICTURE:C286(<>SVG_viewerPicture)
C_PICTURE:C286(<>SVG_viewerPictureBackup)
C_TEXT:C284(<>SVG_Txt_Viewer_Callback_Method)

C_BOOLEAN:C305(<>showColoredBackground)
C_LONGINT:C283(<>backgroundColor)
C_LONGINT:C283(<>sourceFontSize)
C_BOOLEAN:C305(<>automaticallyResize)

C_LONGINT:C283(<>Lon_tabID)
C_PICTURE:C286(<>Pic_viewerTab)

C_TEXT:C284(<>svg_recentMenuRef)

C_LONGINT:C283(<>Lon_viewerTimerEvent)

C_LONGINT:C283(<>svg_tabID)
C_LONGINT:C283(<>Lon_tabList)

C_LONGINT:C283(<>lst_syntax;<>Lon_currentElement)
C_TEXT:C284(<>Txt_Name)
C_LONGINT:C283(<>Lon_timerEvent)
C_LONGINT:C283(<>bDocumentation)

C_LONGINT:C283(<>Lon_opacity)

C_POINTER:C301(<>Ptr_Document)  // Pointer to the Document variable of the host database

If (False:C215)
	
	ARRAY BOOLEAN:C223(<>tBoo_listbox;0)
	ARRAY PICTURE:C279(<>tPic_Colors;0x0000)
	ARRAY TEXT:C222(<>tTxt_colorNames;0x0000)
	
	  // ----------------------------------------------------
	C_OBJECT:C1216(fallBack_Not_thread_safe ;$1)
	
	  // ----------------------------------------------------
	C_BOOLEAN:C305(syntax_EXPAND ;$1)
	
	  // ----------------------------------------------------
	C_TEXT:C284(Syntax_help ;$1)
	
	  // ----------------------------------------------------
	C_LONGINT:C283(syntax_List ;$0)
	
	  // ----------------------------------------------------
	C_TEXT:C284(Syntax_main ;$1)
	
	  // ----------------------------------------------------
	C_TEXT:C284(Viewer_main ;$1)
	C_TEXT:C284(Viewer_main ;$2)
	
	  // ----------------------------------------------------
	C_TEXT:C284(viewer_sources ;$0)
	C_TEXT:C284(viewer_sources ;$1)
	
	  // ----------------------------------------------------
	C_TEXT:C284(Color_main ;$1)
	
	  // ----------------------------------------------------
	C_POINTER:C301(SVG_ABOUT ;$1)
	
	  // ----------------------------------------------------
	C_POINTER:C301(SVGTool_Display_syntax ;$1)
	
	  // ----------------------------------------------------
	C_POINTER:C301(SVGTool_Display_viewer ;$1)
	
	  // ----------------------------------------------------
	C_POINTER:C301(SVGTool_Display_colors ;$1)
	
	  // ----------------------------------------------------
	C_TEXT:C284(SVGTool_SHOW_IN_VIEWER ;$1)
	C_TEXT:C284(SVGTool_SHOW_IN_VIEWER ;$2)
	
	  // ----------------------------------------------------
	C_TEXT:C284(SVGTool_SET_VIEWER_CALLBACK ;$1)
	
	  // ----------------------------------------------------
	C_LONGINT:C283(xToolBox_tabCreate ;$0)
	C_POINTER:C301(xToolBox_tabCreate ;$1)
	C_POINTER:C301(xToolBox_tabCreate ;$2)
	C_TEXT:C284(xToolBox_tabCreate ;$3)
	
	  // ----------------------------------------------------
	C_LONGINT:C283(xToolBox_tabHandler ;$0)
	C_LONGINT:C283(xToolBox_tabHandler ;$1)
	C_POINTER:C301(xToolBox_tabHandler ;$2)
	C_LONGINT:C283(xToolBox_tabHandler ;$3)
	C_LONGINT:C283(xToolBox_tabHandler ;$4)
	
	  // ----------------------------------------------------
	C_TEXT:C284(xToolBox_BytesToString ;$0)
	C_REAL:C285(xToolBox_BytesToString ;$1)
	C_TEXT:C284(xToolBox_BytesToString ;$2)
	C_TEXT:C284(xToolBox_BytesToString ;$3)
	C_TEXT:C284(xToolBox_BytesToString ;$4)
	C_LONGINT:C283(xToolBox_BytesToString ;$5)
	
	  // ----------------------------------------------------
	xToolBox_NO_ERROR 
	
	  // ----------------------------------------------------
End if 