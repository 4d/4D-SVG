<!-- nodeReference := SVG_New_line ( parentReference ; x1 ; y1 ; x2 ; y2 ; strokeColor ; strokeWidth )
 -> parentReference (Text)
 -> x1 (Real)
 -> y1 (Real)
 -> x2 (Real)
 -> y2 (Real)
 -> strokeColor (Text)
 -> strokeWidth (Real)
 <- nodeReference (Text)-->
# SVG_New_line

> SVG_New_line ( parentSVGObject ; startX ; startY ; endX ; endY {; color {; strokeWidth}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| startX |     | Longint |     | ➡️ |     | Horizontal start position |     |
| startY |     | Longint |     | ➡️ |     | Vertical start position |     |
| endX |     | Longint |     | ➡️ |     | Horizontal end position |     |
| endY |     | Longint |     | ➡️ |     | Vertical end position |     |
| color |     | String |     | ➡️ |     | Color or gradient name |     |
| strokeWidth |     | Real |     | ➡️ |     | Line thickness |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of line |     |

## Description

The SVG_New_line command creates a new line in the SVG container designated by [parentSVGObject](## "Reference of parent element") and returns its reference. The object is positioned according to the [startX](## "Horizontal start position"), [startY](## "Vertical start position"), [endX](## "Horizontal end position") and [endY](## "Vertical end position") coordinates. The SVG container can be the document root or any other reference to an SVG object that can contain this type of element.

The optional [color](## "Color or gradient name") parameter contains the name of the line color. (For more information about colors, please refer to the commands of the [Colors and Gradients](../Colors%20and%20Gradients.md) theme).

The optional [strokeWidth](## "Line thickness") parameter contains the pen size expressed in pixels. Its default value is 1.

### Example  

Draw a blue line that is 3 pixels thick:

![](https://doc.4d.com/4Dv19/picture/195146/pict195146.en.png)

```4d
 svgRef:=SVG_New   
 objectRef:=SVG_New_line (svgRef;10;10;200;100;"blue";3)
```

## See also

[SVG_New_polyline](SVG_New_polyline.md)  
[SVG_PATH_LINE_TO](SVG_PATH_LINE_TO.md)
