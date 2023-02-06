<!-- svgReference := SVG_New_tspan ( svgObject ; text ; Param_3 ; Param_4 ; Font_Name ; Param_6 ; Styles ; Aligment ; Color )
 -> svgObject (Text)
 -> text (Text) - String to write
 -> Param_3 (Real)
 -> Param_4 (Real)
 -> Font_Name (Text) - Default is Time New Roman
 -> Param_6 (Long Integer)
 -> Styles (Long Integer) - Default is standard
 -> Aligment (Long Integer) - Default is start (Left)
 -> Color (Text) - Front color
 <- svgReference (Text)-->
# SVG_New_tspan

> SVG_New_tspan ( parentSVGObject ; text {; x {; y {; font \ styleDef {; size {; style {; alignment {; color}}}}}}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| text |     | Text |     | ➡️ |     | Text to insert |     |
| x   |     | Longint |     | ➡️ |     | Coordinate on X axis |     |
| y   |     | Longint |     | ➡️ |     | Coordinate on Y axis |     |
| font \| styleDef |     | Text |     | ➡️ |     | Font name or Style definition |     |
| size |     | Integer |     | ➡️ |     | Size of characters in points |     |
| style |     | Integer |     | ➡️ |     | Style of characters |     |
| alignment |     | Integer |     | ➡️ |     | Alignment |     |
| color |     | String |     | ➡️ |     | Text color |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of SVG text object |     |

## Description

The **SVG_New_tspan** command creates a new element in the 'text', ‘tspan’ or 'textArea' element designated by [parentSVGObject](# "Reference of parent element") and returns its reference. If [parentSVGObject](# "Reference of parent element") is not a reference to a 'text', ‘tspan’ or 'textArea' element, an error is generated.

The different optional parameters are described with the [SVG_New_text](SVG_New_text.md) command. If certain optional parameters are omitted, their values are inherited from parent element(s).

### Example 1  

In a text, it is possible to create paragraphs that inherit the properties of a parent.  
![](https://doc.4d.com/4Dv19/picture/196293/pict196293.en.png)

```4d

```4d
 $SVG:=SVG_New   
  
```

Creates a new text that is in Arial, blue, and aligned to the left  
 $textID:=SVG_New_text ($SVG;"";0;0;"arial";-1;-1;[Align left](/4Dv19R8/index.en.html "Align left");"blue")  
  
```
Nested paragraphs with indentation and changing of size and style  
 $textID:=SVG_New_tspan ($textID;"TITLE 1";10;10;"";24;[Bold](Font-Styles.302-6103262.en.html "Bold")+[Underline](Font-Styles.302-6103262.en.html "Underline"))  
 $textID:=SVG_New_tspan ($textID;"Title 2";20;42;"";12;[Bold](Font-Styles.302-6103262.en.html "Bold"))  
 $textID:=SVG_New_tspan ($textID;"Title 3";30;60;"";10;[Bold](Font-Styles.302-6103262.en.html "Bold")+[Italic](Font-Styles.302-6103262.en.html "Italic"))  
 $textID:=SVG_New_tspan ($textID;"Title 4";40;78;"";8;[Italic](Font-Styles.302-6103262.en.html "Italic"))
```

```4d


### Example 2  

Changing a property while remaining in the same "text" element, here the size of the text.  
![](https://doc.4d.com/4Dv19/picture/196294/pict196294.en.png)


```4d
 $textID:=SVG_New_text ($SVG;"Writing ";10;10;"arial";12)  
 SVG_SET_FONT_SIZE](SVG_SET_FONT_SIZE.md)([SVG_New_tspan](SVG_SET_FONT_SIZE ($textID;"with ");14)  
 SVG_SET_FONT_SIZE](SVG_SET_FONT_SIZE.md)([SVG_New_tspan](SVG_SET_FONT_SIZE ($textID;"SVG ");18)  
 SVG_SET_FONT_SIZE](SVG_SET_FONT_SIZE.md)([SVG_New_tspan](SVG_SET_FONT_SIZE ($textID;"is ");24)  
 SVG_SET_FONT_SIZE](SVG_SET_FONT_SIZE.md)([SVG_New_tspan](SVG_SET_FONT_SIZE ($textID;"easy ");36)
```

## See also

[SVG_New_text](SVG_New_text.md)
