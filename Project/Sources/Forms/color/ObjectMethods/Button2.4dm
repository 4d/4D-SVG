C_LONGINT:C283($Lon_B;$Lon_G;$Lon_i;$Lon_R;$Lon_ref)
C_TEXT:C284($Dom_body;$Dom_group;$Dom_group_name;$Dom_group_RGB;$Dom_node;$Dom_root)
C_TEXT:C284($Dom_transUnit;$Txt_name;$Txt_ID_name;$Txt_ID_RGB)

$Dom_root:=DOM Create XML Ref:C861("xliff")

If (OK=1)
	
	DOM SET XML ATTRIBUTE:C866($Dom_root;\
		"version";"1.0";\
		"xmlns:d4";"http://www.4d.com/d4-ns")
	
	$Dom_node:=DOM Create XML element:C865($Dom_root;"file";\
		"datatype";"x-4DK#";\
		"original";"x-undefined";\
		"source-language";"x-none";\
		"target-language";"x-none")
	
	$Dom_body:=DOM Create XML element:C865($Dom_root;"body")
	
	$Dom_group:=DOM Create XML element:C865($Dom_root;"group";\
		"resname";"themes")
	
	$Txt_ID_RGB:="rgb_colors"
	$Dom_transUnit:=DOM Create XML element:C865($Dom_group;"trans-unit";\
		"id";$Txt_ID_RGB;\
		"resname";$Txt_ID_RGB;\
		"translate";"no")
	DOM SET XML ELEMENT VALUE:C868(DOM Create XML element:C865($Dom_transUnit;"source");\
		"SVG Colors (RGB)")
	$Dom_group_RGB:=DOM Create XML element:C865($Dom_root;"group";\
		"d4:groupName";$Txt_ID_RGB;\
		"restype";"x-4DK#")
	
	$Txt_ID_name:="svg_colors"
	$Dom_transUnit:=DOM Create XML element:C865($Dom_group;"trans-unit";\
		"id";$Txt_ID_name;\
		"resname";$Txt_ID_name;\
		"translate";"no")
	DOM SET XML ELEMENT VALUE:C868(DOM Create XML element:C865($Dom_transUnit;"source");\
		"SVG Colors (Names)")
	$Dom_group_name:=DOM Create XML element:C865($Dom_root;"group";\
		"d4:groupName";$Txt_ID_name;\
		"restype";"x-4DK#")
	
	For ($Lon_i;1;Count list items:C380(colors);1)
		
		GET LIST ITEM:C378(colors;$Lon_i;$Lon_ref;$Txt_name)
		
		GET LIST ITEM PARAMETER:C985(colors;$Lon_ref;"R";$Lon_R)
		GET LIST ITEM PARAMETER:C985(colors;$Lon_ref;"G";$Lon_G)
		GET LIST ITEM PARAMETER:C985(colors;$Lon_ref;"B";$Lon_B)
		
		$Dom_transUnit:=DOM Create XML element:C865($Dom_group_RGB;"trans-unit";\
			"d4:value";String:C10(($Lon_R << 16)+($Lon_G << 8)+$Lon_B)+":L";\
			"id";"rgb_"+String:C10($Lon_i))
		
		DOM SET XML ELEMENT VALUE:C868(DOM Create XML element:C865($Dom_transUnit;"source");\
			"color RGB "+$Txt_name)
		
		$Dom_transUnit:=DOM Create XML element:C865($Dom_group_name;"trans-unit";\
			"d4:value";$Txt_name;\
			"id";"name_"+String:C10($Lon_i))
		DOM SET XML ELEMENT VALUE:C868(DOM Create XML element:C865($Dom_transUnit;"source");\
			"color SVG "+$Txt_name)
		
	End for 
	
	DOM EXPORT TO FILE:C862($Dom_root;Get 4D folder:C485(Current resources folder:K5:16)+"SVG Constants.xlf")
	
	DOM CLOSE XML:C722($Dom_root)
	
End if 