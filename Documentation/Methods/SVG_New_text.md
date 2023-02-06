<!-- svgReference := SVG_New_text ( svgObject ; text ; x ; y ; Font_Name ; Font_Size ; Styles ; Aligment ; Color ; rotation ; interlining ; stretch )
 -> svgObject (Text)
 -> text (Text) - String to write
 -> x (Real) - X position
 -> y (Real) - Y position
 -> Font_Name (Text) - Default is Time New Roman
 -> Font_Size (Long Integer) - Default is 12 pt
 -> Styles (Long Integer) - Default is standard
 -> Aligment (Long Integer) - Default is start (Left)
 -> Color (Text) - Front color
 -> rotation (Real) - Rotation
 -> interlining (Real) - Interlining
 -> stretch (Real) - Stretch
 <- svgReference (Text)-->
# SVG_New_text

> SVG_New_text ( parentSVGObject ; text {; x {; y {; font \ styleDef {; size {; style {; alignment {; color {; rotation {; lineSpacing {; stretching}}}}}}}}}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| text |     | Text |     | ➡️ |     | Text to insert |     |
| x   |     | Real |     | ➡️ |     | Coordinate on X axis |     |
| y   |     | Real |     | ➡️ |     | Coordinate on Y axis |     |
| font \| styleDef |     | Text |     | ➡️ |     | Font name or Style definition |     |
| size |     | Longint |     | ➡️ |     | Size of characters in points |     |
| style |     | Longint |     | ➡️ |     | Style of characters |     |
| alignment |     | Longint |     | ➡️ |     | Alignment |     |
| color |     | String |     | ➡️ |     | Text color |     |
| rotation |     | Real |     | ➡️ |     | Angle of rotation of text |     |
| lineSpacing |     | Real |     | ➡️ |     | Line spacing in points |     |
| stretching |     | Real |     | ➡️ |     | Horizontal stretch factor |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of SVG text object |     |

## Description

The **SVG_New_text** command inserts the text in text in the SVG container designated by [parentSVGObject](# "Reference of parent element") and returns its reference. If [parentSVGObject](# "Reference of parent element") is not an SVG document, an error is generated.

**Note:** Starting with 4D v15, the **SVG_New_text** command supports simple Styled text (the text can contain different styles, but SPAN attributes must not be nested). See example 5.

The optional [x](# "Coordinate on X axis") and [y](# "Coordinate on Y axis") parameters can be used to specify the position on the X and Y axis of the upper corner of the first character of text. This point is situated differently according to the alignment value: to the left for a left alignment, to the right for a right alignment or in the center when the text is centered.

The **SVG_New_text** command accepts two different syntaxes for setting characters:

* You can pass various values in the [font](# "Font name or Style definition"), [size](# "Size of characters in points"), [style](# "Style of characters") and [alignment](# "Alignment") parameters: [font](# "Font name or Style definition") and [size](# "Size of characters in points") can be used to specify the font and size, in points, to be used. When these parameters are omitted, the text will be written in Times New Roman 12 pts.  
    The optional [style](# "Style of characters") parameter gives information about the character style used. In the [style](# "Style of characters") parameter, you must pass one of the following values or a combination of several of them (or you can also use the corresponding 4D constants from the [Font Styles](https://doc.4d.com/4Dv19/4D/19.5/Font-Styles.302-6103262.en.html) theme):  

    > 0 = Plain  
    > 1 = Bold  
    > 2 = Italic  
    > 4 = Underline  
    > 8 = Strikethrough

    The optional [alignment](# "Alignment") parameter can be used to set the type of alignment to be applied to the drawn text. You can pass one of the following values:  

    > 2 = Align left  
    > 3 = Center  
    > 4 = Align right  

    The optional [color](# "Text color") parameter contains the name of the font color. (For more information about colors, please refer to the [Colors and Gradients](../Colors%20and%20Gradients.md) section).  
    The optional [rotation](# "Angle of rotation of text") parameter can be used to specify the rotation to be applied to the text.  
    The optional [lineSpacing](# "Line spacing in points") parameter can be used to specify the value of the line spacing if the text has more than one line. Default value = 1.  
    The optional [stretching](# "Horizontal stretch factor") parameter can be used to specify a horizontal stretching (value >1) or condensing (value included between 0 and 1) factor of the text.

* Or you can pass a style definition in the styleDef parameter (instead of the [font](# "Font name or Style definition") parameter) and then omit the following parameters. For example, you can pass:  

```4d
 SVG_New_textArea ($Dom_svg;"Hello World !";x;y;vWidth;vHeight;style_definition)
```

    ... where the _style_definition_ parameter contains a complete style definition. If you pass, for instance, "{font-size:48px;fill:red;}", this definition is added as a style attribute in the form:  
    
    style="font-size:48px;fill:red;"
    
      
    In this case, any additional parameters are ignored.

### Example 1  

Simple text using default text properties:  
![](https://doc.4d.com/4Dv19/picture/196168/pict196168.en.png)

```4d
 $SVG:=SVG_New   
 $textID:=SVG_New_text ($SVG;"Hello world!")
```

### Example 2  

Text that is blue, italic, underlined and aligned to the right:  
![](https://doc.4d.com/4Dv19/picture/196169/pict196169.en.png)

```4d
 $SVG:=SVG_New   
 $text:="Hello world!\rBonjour le monde!\rHola Mundo!"  
 $size:=48  
 $font:="helvetica"  
 $textID:=SVG_New_text ($SVG;$text;400;10;$font;$size;[Italic](Font-Styles.302-6103262.en.html "Italic")+[Underline](Font-Styles.302-6103262.en.html "Underline");[Align right](/4Dv19R8/index.en.html "Align right");"blue")
```

### Example 3  

Vertical text:  
![](https://doc.4d.com/4Dv19/picture/196170/pict196170.en.png)

```4d
 $SVG:=SVG_New   
 $textID:=SVG_New_text ($SVG;$text;-250;0;"";48;-1;-1;"red";-90)
```

### Example 4  

Condensed or expanded text:  
![](https://doc.4d.com/4Dv19/picture/196171/pict196171.en.png)

```4d
 $SVG:=SVG_New   
 $textID:=SVG_New_text ($SVG;"Hello world (condensed)";0;0;"";-1;-1;-1;"blue";0;1;0,8)  
 $textID:=SVG_New_text ($SVG;"Hello world (normal)";0;24)  
 $textID:=SVG_New_text ($SVG;"Hello world (stretched)";0;48;"";-1;-1;-1;"red";0;1;2)
```

### Example 5  

Display of multi-style text:

```4d
 C_TEXT($Dom_svg;$Dom_text;$Txt_buffer)  
  // definition of multi-style text  
 $Txt_buffer:="<SPAN STYLE=\"font-size:18pt\">Hello </SPAN>"+\  
 "<SPAN STYLE=\"font-size:24pt;font-weight:bold;color:#D81E05\">World</SPAN>"+\  
 "<SPAN STYLE=\"font-size:36pt\">!</SPAN><BR/>"+\  
 "<SPAN STYLE=\"font-size:19pt;font-style:italic\">It's </SPAN>"+\  
 "<SPAN STYLE=\"font-size:24pt\">Monday</SPAN>"  
 $Dom_svg:=SVG_New   
   
  // title  
 SVG_SET_FONT_COLOR(SVG_New_text($Dom_svg;"_______ svg_Newtext _______";10;30);"blue")  
  // text  
 $Dom_text:=SVG_New_text ($Dom_svg;$Txt_buffer;50;50)  
   
 SVGTool_SHOW_IN_VIEWER($Dom_svg)  
 SVG_CLEAR ($Dom_svg)
```

![](https://doc.4d.com/4Dv19/picture/2628738/pict2628738.en.png)

## See also

[SVG_New_textArea](SVG_New_textArea.md)  
[SVG_New_tspan](SVG_New_tspan.md)  
[SVG_New_vertical_text](SVG_New_vertical_text.md)
