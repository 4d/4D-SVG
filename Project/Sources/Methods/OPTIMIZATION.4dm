//%attributes = {}
C_BOOLEAN:C305($Boo_assertion_1;$Boo_assertion_2)
C_LONGINT:C283($kLon_count;$Lon_i;$Lon_j)
C_TEXT:C284($Dom_svg)

ARRAY LONGINT:C221($tLon_timer;0)
$kLon_count:=200

If (True:C214)
	
	For ($Lon_j;1;20;1)
		
		SVG_SET_OPTIONS (SVG_Get_options  ?- 12)
		
		$Boo_assertion_1:=SVG_Get_options  ?? 12
		
		$Dom_svg:=SVG_New 
		
		APPEND TO ARRAY:C911($tLon_timer;Milliseconds:C459)
		For ($Lon_i;1;$kLon_count;1)
			SVG_SET_ID (SVG_New_textArea ($Dom_svg;"Hello World!");String:C10($Lon_i))
		End for 
		APPEND TO ARRAY:C911($tLon_timer;Milliseconds:C459)
		
		SVG_CLEAR ($Dom_svg)
		
		SVG_SET_OPTIONS (SVG_Get_options  ?+ 12)
		
		$Boo_assertion_2:=SVG_Get_options  ?? 12
		
		$Dom_svg:=SVG_New 
		
		APPEND TO ARRAY:C911($tLon_timer;Milliseconds:C459)
		For ($Lon_i;1;$kLon_count;1)
			SVG_SET_ID (SVG_New_textArea ($Dom_svg;"Hello World!");String:C10($Lon_i))
		End for 
		APPEND TO ARRAY:C911($tLon_timer;Milliseconds:C459)
		
		SVG_CLEAR ($Dom_svg)
		
		ALERT:C41("Assert "+Choose:C955($Boo_assertion_1;"ON";"OFF")+": "\
			+String:C10($tLon_timer{2}-$tLon_timer{1})+"ms"\
			+"\rAssert "+Choose:C955($Boo_assertion_2;"ON";"OFF")+": "\
			+String:C10($tLon_timer{4}-$tLon_timer{3})+"ms")
		
	End for 
	
Else 
	
	SVG_SET_OPTIONS (SVG_Get_options  ?+ 12)
	$Boo_assertion_1:=SVG_Get_options  ?? 12
	
	$Dom_svg:=SVG_New 
	SVG_ADD_NAMESPACE ($Dom_svg)
	SVG_CLEAR ($Dom_svg)
	
	SVG_SET_OPTIONS (SVG_Get_options  ?- 12)
	$Boo_assertion_2:=SVG_Get_options  ?? 12
	
	$Dom_svg:=SVG_New 
	SVG_ADD_NAMESPACE ($Dom_svg)
	SVG_CLEAR ($Dom_svg)
	
End if 