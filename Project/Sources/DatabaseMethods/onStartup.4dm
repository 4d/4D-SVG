C_BOOLEAN:C305($Boo_OK)
C_LONGINT:C283($Win_hdl)
C_TEXT:C284($Dir_preferences;$File_preferences;$Txt_version)
C_OBJECT:C1216($Obj_preferences)

If (Is compiled mode:C492)
	
	  //Component_about
	SET ABOUT:C316(Get localized string:C991("about");"Component_about")
	
	Viewer_main 
	
End if 