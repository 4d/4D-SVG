//%attributes = {}
var $svg : Text:=SVG_New

SVG_SET_OPTIONS(SVG_Get_options ?+ 2)

SVG_New_arc($svg; 300; 300; 40; 0; 105; "gray"; "lightcoral"; 1)
SVG_New_arc($svg; 300; 300; 40; 105; 138; "gray"; "lightskyblue"; 1)
SVG_New_arc($svg; 300; 300; 40; 138; 230; "gray"; "lightgreen"; 1)
SVG_New_arc($svg; 300; 300; 40; 230; 270; "gray"; "lightsteelblue"; 1)
SVG_New_arc($svg; 300; 300; 40; 270; 360; "gray"; "lightyellow"; 1)

var $path : Text:=File:C1566(File:C1566("/PACKAGE/TESTS/arc.svg").platformPath; fk platform path:K87:2).platformPath

// Save result
If (Structure file:C489=Structure file:C489(*))
	
	SVG_SAVE_AS_TEXT($svg; $path)
	
End if 

var $xml : Text:=SVG_Export_to_XML($svg)

SVG_CLEAR($svg)

ASSERT:C1129($xml=File:C1566($path; fk platform path:K87:2).getText())