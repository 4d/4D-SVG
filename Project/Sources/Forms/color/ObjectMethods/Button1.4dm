C_LONGINT:C283($Lon_B;$Lon_count;$Lon_G;$Lon_i;$Lon_R;$Lon_ref)
C_TEXT:C284($Txt_name)

$Lon_count:=Count list items:C380(colors)
ARRAY OBJECT:C1221($tObj_color;$Lon_count)

For ($Lon_i;1;$Lon_count;1)
	
	GET LIST ITEM:C378(colors;$Lon_i;$Lon_ref;$Txt_name)
	
	GET LIST ITEM PARAMETER:C985(colors;$Lon_ref;"R";$Lon_R)
	GET LIST ITEM PARAMETER:C985(colors;$Lon_ref;"G";$Lon_G)
	GET LIST ITEM PARAMETER:C985(colors;$Lon_ref;"B";$Lon_B)
	
	OB SET:C1220($tObj_color{$Lon_i};\
		"name";$Txt_name;\
		"r";$Lon_R;\
		"g";$Lon_G;\
		"b";$Lon_B)
	
End for 

TEXT TO DOCUMENT:C1237(Get 4D folder:C485(Current resources folder:K5:16)+"colors.json";JSON Stringify array:C1228($tObj_color;*))