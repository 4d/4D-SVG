//%attributes = {}
var $svg : Text
var $pathname : Text

// MARK:-SVG_New
$svg:=SVG_New

//SVG_SET_OPTIONS
//SVG_SET_OPTIONS(SVG_Get_options ?+ 5)

$pathname:=File:C1566(File:C1566("/PACKAGE/TESTS/new.svg").platformPath; fk platform path:K87:2).platformPath

If (Structure file:C489=Structure file:C489(*))
	
	// Save result
	File:C1566($pathname; fk platform path:K87:2).delete()
	
	SVG_SAVE_AS_TEXT($svg; $pathname)
	
End if 

var $xml : Text:=Replace string:C233(SVG_Export_to_XML($svg); "\r"; "")

SVG_CLEAR($svg)

//ASSERT($xml=File($pathname; fk platform path).getText())

// MARK:-SVG_Validate_file
$svg:=SVG_New
var $node : Text:=SVG_New_rect($svg; 5; 5; 210; 320; 0; 0; "#777"; "peachpuff"; 3)

$pathname:=Folder:C1567(Temporary folder:C486; fk platform path:K87:2).file("test.svg").platformPath

SVG_SAVE_AS_TEXT($svg; $pathname)
SVG_CLEAR($svg)

ASSERT:C1129(SVG_Validate_file($pathname))