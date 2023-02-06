<!-- node := SVG_Set_title ( svgObject ; value )
 -> svgObject (Text)
 -> value (Text)
 <- node (Text)-->
# SVG_Set_title

> SVG_Set_title ( parentSVGObject ; title ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| title |     | String |     | ➡️ |     | Text of title |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of title |     |

## Description

The SVG_Set_title command specifies a title for the SVG element designated by [parentSVGObject](# "Reference of parent element") and returns its reference. If [parentSVGObject](# "Reference of parent element") is not an SVG element, an error is generated.

A title is text data that is not included in the rendered picture but is use for structuring complex documents. Certain SVG rendering engines use the text of this element to display a help tip when the mouse moves over the object.

### Example  

```4d
 $SVG:=SVG_New   
 $rec:=SVG_New_rect ($SVG;20;20;650;650;0;0;"gray";"lemonchiffon")  
 SVG_Set_title ($rec;"Background rectangle")  
 $Symbol:=SVG_Define_symbol ($SVG;"MySymbol";0;0;110;110;"true")  
 SVG_Set_title ($Symbol;" Set a symbol composed of 2 squares and 2 circles ")  
 ...
```

## See also

[SVG_Set_description](SVG_Set_description.md)
