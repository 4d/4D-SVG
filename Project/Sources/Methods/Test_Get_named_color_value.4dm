//%attributes = {}

SET ASSERT ENABLED:C1131(True:C214)

ASSERT:C1129(SVG_Get_named_color_value ("Moccasin")=16770229)
ASSERT:C1129(SVG_Get_named_color_value ("Moccasin";"b")=181)

ASSERT:C1129(SVG_Get_named_color_value ("Firebrick")=11674146)
ASSERT:C1129(SVG_Get_named_color_value ("Firebrick";"g")=34)

SET ASSERT ENABLED:C1131(False:C215)
