<!-- nodeReference := SVG_New_regular_polygon ( parentReference ; width ; sides ; cx ; cy ; strokeColor ; fillColor ; strokeWidth )
 -> parentReference (Text)
 -> width (Real)
 -> sides (Long Integer)
 -> cx (Real)
 -> cy (Real)
 -> strokeColor (Text)
 -> fillColor (Text)
 -> strokeWidth (Real)
 <- nodeReference (Text)-->
# SVG_New_regular_polygon

> SVG_New_regular_polygon ( parentSVGObject ; width ; number {; x {; y {; foregroundColor {; backgroundColor {; strokeWidth}}}}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| width |     | Longint |     | ➡️ |     | Diameter of surrounding circle |     |
| number |     | Longint |     | ➡️ |     | Number of sides |     |
| x   |     | Longint |     | ➡️ |     | Coordinate on center X axis |     |
| y   |     | Longint |     | ➡️ |     | Coordinate on center Y axis |     |
| foregroundColor |     | String |     | ➡️ |     | Color or gradient name |     |
| backgroundColor |     | String |     | ➡️ |     | Color or gradient name |     |
| strokeWidth |     | Real |     | ➡️ |     | Line thickness |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of polygon |     |

## Description

The SVG_New_regular_polygon command draws a regular polygon with number of sides fit into a circle with a diameter of [width](# "Diameter of surrounding circle") in the SVG container designated by [parentSVGObject](# "Reference of parent element") and returns its reference. If [parentSVGObject](# "Reference of parent element") is not an SVG document, an error is generated.

The optional [x](# "Coordinate on center X axis") and [y](# "Coordinate on center Y axis") parameters can be used to specify the center of the circle. If they are omitted, the figure will be drawn in the upper left corner of the document.

The optional [foregroundColor](# "Color or gradient name") and [backgroundColor](# "Color or gradient name") parameters contain, respectively, the name of the line color and of the background color. (For more information about colors, please refer to the commands of the [Colors and Gradients](../Colors%20and%20Gradients.md) theme).

The optional [strokeWidth](# "Line thickness") parameter contains the size of the pen expressed in pixels. Its default value is 1.

### Example 1  

Draw a pentagon (default fill and border color, default line thickness):  
![](https://doc.4d.com/4Dv19/picture/195397/pict195397.en.png)

```4d
 svgRef:=SVG_New   
 objectRef:=SVG_New_regular_polygon (svgRef;100;5)
```

### Example 2  

Draw an octogon, the circle containing it and the trace lines:  
![](https://doc.4d.com/4Dv19/picture/195398/pict195398.en.png)

```4d
 svgRef:=SVG_New   
 $width:=200  
 $sides:=8  
 objectRef:=SVG_New_regular_polygon (svgRef;$width;$sides;0;0;"crimson";"palevioletred";2)  
   
 $radius:=$width/2  
 objectRef:=SVG_New_rect (svgRef;0;0;$width;$width;0;0;"blue";"none")  
 objectRef:=SVG_New_line (svgRef;0;$radius;$width;$radius;"blue")  
 objectRef:=SVG_New_line (svgRef;$radius;0;$radius;$width;"blue")  
 objectRef:=SVG_New_line (svgRef;0;0;$width;$width;"blue")  
 objectRef:=SVG_New_line (svgRef;$width;0;0;$width;"blue")  
 objectRef:=SVG_New_circle (svgRef;$radius;$radius;$radius;"blue";"none")
```

## See also

[SVG_New_polygon](SVG_New_polygon.md)
