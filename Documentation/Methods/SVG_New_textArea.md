<!-- svgReference := SVG_New_textArea ( svgObject ; text ; x ; y ; width ; height ; Font_Name ; Font_Size ; fontStyles ; fontAlignment )
 -> svgObject (Text)
 -> text (Text) - String to write
 -> x (Real) - X position
 -> y (Real) - Y position
 -> width (Real)
 -> height (Real)
 -> Font_Name (Text) - Default is Time New Roman
 -> Font_Size (Long Integer) - Default is 12 pt
 -> fontStyles (Long Integer) - Default is standard
 -> fontAlignment (Long Integer) - Default is start (Left)
 <- svgReference (Text)-->
# SVG_New_textArea

> SVG_New_textArea ( parentSVGObject ; text {; x {; y {; textWidth {; textHeight {; font \ styleDef {; size {; style {; alignment}}}}}}}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| text |     | Text |     | ➡️ |     | Text to insert |     |
| x   |     | Longint |     | ➡️ |     | Coordinate on X axis |     |
| y   |     | Longint |     | ➡️ |     | Coordinate on Y axis |     |
| textWidth |     | Longint |     | ➡️ |     | Width of text area |     |
| textHeight |     | Longint |     | ➡️ |     | Height of text area |     |
| font \| styleDef |     | Text |     | ➡️ |     | Font name or Style definition |     |
| size |     | Integer |     | ➡️ |     | Size of characters in points |     |
| style |     | Integer |     | ➡️ |     | Style of characters |     |
| alignment |     | Integer |     | ➡️ |     | Alignment |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of SVG text object |     |

## Description

The **SVG_New_textArea** command inserts a text area in the SVG container designated by [parentSVGObject](# "Reference of parent element") and returns its reference. If [parentSVGObject](# "Reference of parent element") is not an SVG document, an error is generated.

The "textArea" element is recommended by the SVG tiny 1.2 standard and implemented in 4D v11 SQL beginning with version 11.3 (see [http://www.w3.org/TR/SVGMobile12/text.html#TextAreaElement](http://www.w3.org/TR/SVGMobile12/text.html#TextAreaElement)). This element implements a text area that, unlike the "text" element, automatically handles the line feed when the text exceeds the width requested.

**Notes:**

* In the "textArea" element, &lt;tbreak/&gt; elements replace line returns.
* Starting with 4D v15, the **SVG_New_textArea** command supports simple Styled text (the text can contain different styles, but SPAN attributes must not be nested). See example 2.

The optional [x](# "Coordinate on X axis") and [y](# "Coordinate on Y axis") parameters can be used to specify the position on the X and Y axes of the top left corner of the area.

The optional [textWidth](# "Width of text area") and [textHeight](# "Height of text area") parameters specify the size of the area in the user coordinate space. If one or the other of these parameters is not provided, the text area will automatically be fitted to its contents.

The **SVG_New_textArea** command accepts two different syntaxes for setting characters:

* You can pass various values in the [font](# "Font name or Style definition") , [size](# "Size of characters in points") , [style](# "Style of characters") and [alignment](# "Alignment") parameters: [font](# "Font name or Style definition") and [size](# "Size of characters in points") can be used to specify the font and size, in points, to be used. When these parameters are omitted, the text will be written in Times New Roman 12 pts.  
    The optional [style](# "Style of characters") parameter gives information about the character style used. In the [style](# "Style of characters") parameter, you must pass one of the following values or a combination of several of them (or you can also use the corresponding 4D constants from the [Font Styles](https://doc.4d.com/4Dv19/4D/19.5/Font-Styles.302-6103262.en.html) theme):  

    > 0 = Plain  
    > 1 = Bold  
    > 2 = Italic  
    > 4 = Underline  
    > 8 = Strikethrough

    The optional [alignment](# "Alignment") parameter can be used to set the type of alignment to be applied to the drawn text. You can pass one of the following values:  

    > 1 = Align default (left)  
    > 2 = Align left  
    > 3 = Center  
    > 4 = Align right  
    > 5 = Justify

* Or you can pass a style definition in the styleDef parameter (instead of the [font](# "Font name or Style definition") parameter) and then omit the following parameters. For example, you can pass:  

```
 SVG_New_textArea ($Dom_svg;"Hello World !";x;y;vWidth;vHeight;style_definition)
```

    ... where the _style_definition_ parameter contains a complete style definition. If you pass, for instance, "{font-size:48px;fill:red;}", this definition is added as a style attribute in the form:  
    
    style="font-size:48px;fill:red;"
    
      
    In this case, any additional parameters are ignored.

### Example 1  

![](https://doc.4d.com/4Dv19/picture/196247/pict196247.en.png)


```4d
 $svg:=SVG_New   
  
```

Position a border rectangle  
```4d
 $rec:=SVG_New_rect ($svg;5;5;210;320;0;0;"#777";"peachpuff";3)  
  
```
The text  
```4d
 $txt:="Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor."  
 $txtArea:=SVG_New_textArea ($svg;$txt;10;10;200;310;"Georgia";25;[Italic](Font-Styles.302-6103262.en.html "Italic");5)  
  
```

Save document  
```4d
 SVG_SAVE_AS_TEXT ($svg;"test.svg")

```
 


### Example 2  

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
 SVG_SET_FONT_COLOR](SVG_SET_FONT_COLOR.md)([SVG_New_text](SVG_SET_FONT_COLOR ($Dom_svg;"_______ SVG_New_textArea ______";10;30;"";-1);"blue")  
  // textArea  
 $Dom_text:=SVG_New_textArea ($Dom_svg;$Txt_buffer;50;50)  
   
 [SVGTool_SHOW_IN_VIEWER](SVGTool_SHOW_IN_VIEWER.md "SVGTool_SHOW_IN_VIEWER")($Dom_svg)  
 SVG_CLEAR ($Dom_svg)
```

![](https://doc.4d.com/4Dv19/picture/2628819/pict2628819.en.png)

## See also

[SVG_APPEND_TEXT_TO_TEXTAREA](SVG_APPEND_TEXT_TO_TEXTAREA.md)  
[SVG_New_text](SVG_New_text.md)  
[SVG_New_vertical_text](SVG_New_vertical_text.md)  
[SVG_SET_TEXTAREA_TEXT](SVG_SET_TEXTAREA_TEXT.md)
