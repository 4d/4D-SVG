If (Is compiled mode:C492)
	
	// Component_about
	SET ABOUT:C316(Get localized string:C991("about"); "Component_about")
	
	// Open the viewer
	Viewer_main
	
Else 
	
	ARRAY TEXT:C222($componentsArray; 0x0000)
	COMPONENT LIST:C1001($componentsArray)
	
	If (Find in array:C230($componentsArray; "4DPop QuickOpen")>0)
		
		// Installing quickOpen
		EXECUTE METHOD:C1007("quickOpenInit"; *; Formula:C1597(MODIFIERS); Formula:C1597(KEYCODE))
		ON EVENT CALL:C190("quickOpenEventHandler"; "$quickOpenListener")
		
	End if 
End if 