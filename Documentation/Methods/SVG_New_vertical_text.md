<!-- svgReference := SVG_New_vertical_text ( svgObject ; text ; x ; y ; Font_Name ; Font_Size ; Styles ; Aligment ; Color ; rotation )
 -> svgObject (Text)
 -> text (Text) - String to write
 -> x (Real) - X position
 -> y (Real) - Y position
 -> Font_Name (Text) - Default is Time New Roman
 -> Font_Size (Long Integer) - Default is 12 pt
 -> Styles (Long Integer) - Default is standard
 -> Aligment (Long Integer) - Default is start (Left)
 -> Color (Text) - Front color
 -> rotation (Real)
 <- svgReference (Text)-->
# SVG_New_vertical_text

> SVG_New_vertical_text ( parentSVGObject ; text {; x {; y {; font {; size {; style {; alignment {; color {; rotation}}}}}}}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| text |     | Text |     | ➡️ |     | Text to insert |     |
| x   |     | Longint |     | ➡️ |     | Coordinate on X axis |     |
| y   |     | Longint |     | ➡️ |     | Coordinate on Y axis |     |
| font |     | String |     | ➡️ |     | Font name |     |
| size |     | Integer |     | ➡️ |     | Size of characters in points |     |
| style |     | Integer |     | ➡️ |     | Style of characters |     |
| alignment |     | Integer |     | ➡️ |     | Alignment |     |
| color |     | String |     | ➡️ |     | Text color |     |
| rotation |     | Longint |     | ➡️ |     | Angle of rotation of text |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of SVG text object |     |

## Description

The SVG_New_vertical_text command inserts the text of text vertically in the SVG container designated by [parentSVGObject](## "Reference of parent element") and returns its reference. If [parentSVGObject](## "Reference of parent element") is not an SVG document, an error is generated.

The optional [x](## "Coordinate on X axis") and [y](## "Coordinate on Y axis") parameters can be used to specify the position on the X and Y axis of the bottom left corner of the first character of text.

The optional [font](## "Font name") and [size](## "Size of characters in points") parameters can be used to specify the font and its size, in points, to be used. When these parameters are not passed, the text will be written in Times New Roman 12 pt.

The optional [style](## "Style of characters") parameter gives the character style used. In this parameter, you must pass one of the following styles, or a combination of several of these values:

> 0 = Plain  
> 1 = Bold  
> 2 = Italic  
> 4 = Underline  
> 8 = Strikethrough

The optional [alignment](## "Alignment") parameter can be used to set the type of alignment applied to the text drawn. You can pass on eof the following values:

> 2 = Align left  
> 3 = Center  
> 4 = Align right

The optional [color](## "Text color") parameter contains the name of the font color. (For more information about colors, please refer to the ”[Colors and Gradients](../Colors%20and%20Gradients.md)” section).

The optional [rotation](## "Angle of rotation of text") parameter can be used to specify the rotation to be applied to the text.

### Example  

![](https://doc.4d.com/4Dv19/picture/196342/pict196342.en.png)

```4d
 $SVG:=SVG_New   
 $textID:=SVG_New_text ($SVG;"Hello world";10;12)  
 $textID:=SVG_New_vertical_text ($SVG;"Hello world";22;3;"";-1;-1;Center;"blue")
```

## See also

[SVG_New_text](SVG_New_text.md)  
[SVG_New_tspan](SVG_New_tspan.md)
