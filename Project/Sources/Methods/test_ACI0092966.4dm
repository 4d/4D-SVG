//%attributes = {}
  //ACI0092966
C_TEXT:C284($Dom_svg;$Dom_text;$Txt_buffer)

ARRAY TEXT:C222($tTxt_keys;0)
ARRAY TEXT:C222($tTxt_keys_2;0)
ARRAY TEXT:C222($tTxt_values;0)
ARRAY TEXT:C222($tTxt_values_2;0)

SVG_SET_OPTIONS (SVG_Get_options  ?+ 5)

$Dom_svg:=SVG_New 

$Dom_text:=SVG_New_text ($Dom_svg;"Hello world")

SVG_SET_ATTRIBUTES ($Dom_text;"style";"font-family:'Arial';font-size:9;fill:#000000;font-weight:bold")

SVG_GET_ATTRIBUTES ($Dom_text;->$tTxt_keys;->$tTxt_values)

DOM GET XML ATTRIBUTE BY NAME:C728($Dom_text;"style";$Txt_buffer)

ASSERT:C1129($tTxt_values{2}=$Txt_buffer)

SVG_SET_ATTRIBUTES_BY_ARRAYS ($Dom_text;->$tTxt_keys;->$tTxt_values)

SVG_GET_ATTRIBUTES ($Dom_text;->$tTxt_keys_2;->$tTxt_values_2)

DOM GET XML ATTRIBUTE BY NAME:C728($Dom_text;"style";$Txt_buffer)

ASSERT:C1129($tTxt_values{2}=$tTxt_values_2{2})
ASSERT:C1129($tTxt_values{2}=$Txt_buffer)

SVG_CLEAR ($Dom_svg)