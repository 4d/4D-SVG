# SVG_Set_title

>**SVG_Set_title** ( *parentSVGObject* ; *title* ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| parentSVGObject | SVG_Ref | &#8594; | Reference of parent element |
| title | String | &#8594; | Text of title |
| Function result | SVG_Ref | &#8592; | Reference of title |



#### Description 

The SVG\_Set\_title command specifies a title for the SVG element designated by *parentSVGObject* and returns its reference. If *parentSVGObject* is not an SVG element, an error is generated.

A title is text data that is not included in the rendered picture but is use for structuring complex documents. Certain SVG rendering engines use the text of this element to display a help tip when the mouse moves over the object.

#### Example 

```4d
 $SVG:=SVG_New
 $rec:=SVG_New_rect($SVG;20;20;650;650;0;0;"gray";"lemonchiffon")
 SVG_Set_title($rec;"Background rectangle")
 $Symbol:=SVG_Define_symbol($SVG;"MySymbol";0;0;110;110;"true")
 SVG_Set_title($Symbol;" Set a symbol composed of 2 squares and 2 circles ")
 ...
```

#### See also 

[SVG\_Set\_description](SVG_Set_description.md)  