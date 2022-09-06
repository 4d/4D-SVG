//%attributes = {}

  //$svgRef:=SVG_New
  //$test:="Test Test Test Test Test Test"
  //For ($i;1;100000)
  //$object:=SVG_New_text ($svgRef;$test)
  //SVG_SET_FONT_FAMILY ($object;"Arial Narrow")
  //End for
  //SVG_CLEAR ($svgRef)
  //ALERT("finished")

C_LONGINT:C283($Lon_i)
C_TEXT:C284($Dom_text;$Dom_xml)

ARRAY REAL:C219($tNum_objectNumber;0)
ARRAY REAL:C219($tNum_objectNumber_2;0)
ARRAY REAL:C219($tNum_values;0)
ARRAY REAL:C219($tNum_values_2;0)
ARRAY TEXT:C222($tTxt_titles;0)

GET MEMORY STATISTICS:C1118(1;$tTxt_titles;$tNum_values;$tNum_objectNumber)

$Dom_xml:=DOM Create XML Ref:C861("root")

For ($Lon_i;1;100000;1)
	
	$Dom_text:=DOM Create XML element:C865($Dom_xml;"text")
	
End for 

DOM CLOSE XML:C722($Dom_xml)

GET MEMORY STATISTICS:C1118(1;$tTxt_titles;$tNum_values_2;$tNum_objectNumber_2)