# SVG_New_tspan

>**SVG_New_tspan** ( *parentSVGObject* ; *text* {; *x* {; *y* {; font | styleDef {; *size* {; *style* {; *alignment* {; *color*}}}}}}} ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| parentSVGObject | SVG_Ref | &#8594; | Reference of parent element |
| text | Text | &#8594; | Text to insert |
| x | Longint | &#8594; | Coordinate on X axis |
| y | Longint | &#8594; | Coordinate on Y axis |
| font &#124; styleDef | Text | &#8594; | Font name or Style definition |
| size | Integer | &#8594; | Size of characters in points |
| style | Integer | &#8594; | Style of characters |
| alignment | Integer | &#8594; | Alignment |
| color | String | &#8594; | Text color |
| Function result | SVG_Ref | &#8592; | Reference of SVG text object |



#### Description 

The **SVG\_New\_tspan** command creates a new element in the 'text', ‘tspan’ or 'textArea' element designated by *parentSVGObject* and returns its reference. If *parentSVGObject* is not a reference to a 'text', ‘tspan’ or 'textArea' element, an error is generated.

The different optional parameters are described with the *SVG\_New\_text* command. If certain optional parameters are omitted, their values are inherited from parent element(s).

#### Example 1 

In a text, it is possible to create paragraphs that inherit the properties of a parent.  
![](../images/pict196293.en.png)

```4d
 $SVG:=SVG_New
  //Creates a new text that is in Arial, blue, and aligned to the left
 $textID:=SVG_New_text($SVG;"";0;0;"arial";-1;-1;Align left;"blue")
  //Nested paragraphs with indentation and changing of size and style
 $textID:=SVG_New_tspan($textID;"TITLE 1";10;10;"";24;Bold+Underline)
 $textID:=SVG_New_tspan($textID;"Title 2";20;42;"";12;Bold)
 $textID:=SVG_New_tspan($textID;"Title 3";30;60;"";10;Bold+Italic)
 $textID:=SVG_New_tspan($textID;"Title 4";40;78;"";8;Italic)
```

#### Example 2 

Changing a property while remaining in the same "text" element, here the size of the text.  
![](../images/pict196294.en.png)

```4d
 $textID:=SVG_New_text($SVG;"Writing ";10;10;"arial";12)
 SVG_SET_FONT_SIZE(SVG_New_tspan($textID;"with ");14)
 SVG_SET_FONT_SIZE(SVG_New_tspan($textID;"SVG ");18)
 SVG_SET_FONT_SIZE(SVG_New_tspan($textID;"is ");24)
 SVG_SET_FONT_SIZE(SVG_New_tspan($textID;"easy ");36)
```

#### See also 

[SVG\_New\_text](SVG_New_text.md)  