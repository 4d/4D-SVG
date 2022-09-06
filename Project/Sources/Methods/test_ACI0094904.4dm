//%attributes = {}

SVG_SET_OPTIONS 

ASSERT:C1129(fontReplaceArial ("'Lucida Grande'")="'Lucida Grande'")

ASSERT:C1129(fontReplaceArial ("Arial")="'Arial Unicode MS','Arial'")
ASSERT:C1129(fontReplaceArial ("'Arial'")="'Arial Unicode MS','Arial'")
ASSERT:C1129(fontReplaceArial ("'Arial','Lucida Grande'")="'Arial Unicode MS','Arial','Lucida Grande'")
ASSERT:C1129(fontReplaceArial ("Arial Black")="'Arial Black'")
ASSERT:C1129(fontReplaceArial ("'Arial Black'")="'Arial Black'")
ASSERT:C1129(fontReplaceArial ("Arial Black, Arial")="'Arial Black','Arial Unicode MS','Arial'")
ASSERT:C1129(fontReplaceArial ("Arial Black, 'Arial'")="'Arial Black','Arial Unicode MS','Arial'")
ASSERT:C1129(fontReplaceArial ("Arial Black, 'Arial','Lucida Grande'")="'Arial Black','Arial Unicode MS','Arial','Lucida Grande'")
ASSERT:C1129(fontReplaceArial ("Arial Narrow, Arial Black,Arial, Lucida Grande")="'Arial Narrow','Arial Black','Arial Unicode MS','Arial','Lucida Grande'")

