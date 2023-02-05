<!-- object := SVG_New_arc ( parent ; cx ; cy ; rayon ; start ; stop ; strokeColor ; fillColor ; strokeWidth )
 -> parent (Text)
 -> cx (Real)
 -> cy (Real)
 -> rayon (Real)
 -> start (Real)
 -> stop (Real)
 -> strokeColor (Text)
 -> fillColor (Text)
 -> strokeWidth (Real)
 <- object (Text)-->
# SVG_New_arc

> SVG_New_arc ( parentSVGObject ; x ; y ; radius ; start ; end {; foregroundColor {; backgroundColor {; strokeWidth}}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| x   |     | Longint |     | ➡️ |     | Coordinate on center X axis |     |
| y   |     | Longint |     | ➡️ |     | Coordinate on center Y axis |     |
| radius |     | Longint |     | ➡️ |     | Radius of circle |     |
| start |     | Longint |     | ➡️ |     | Value in degrees of start of arc |     |
| end |     | Longint |     | ➡️ |     | Value in degrees of end of arc |     |
| foregroundColor |     | String |     | ➡️ |     | Color or gradient name |     |
| backgroundColor |     | String |     | ➡️ |     | Color or gradient name |     |
| strokeWidth |     | Real |     | ➡️ |     | Line thickness |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of arc |     |

## Description

The SVG_New_arc command creates a new circle arc in the SVG container designated by [parentSVGObject](# "Reference of parent element") and returns its reference. If [parentSVGObject](# "Reference of parent element") is not an SVG document, an error is generated.

The optional [foregroundColor](# "Color or gradient name") and [backgroundColor](# "Color or gradient name") parameters contain, respectively, the name of the line color and of the background color. (For more information about colors, please refer to the commands of the [Colors and Gradients](Colors%20and%20Gradients.md "Colors and Gradients") theme).

The optional [strokeWidth](# "Line thickness") parameter contains the size of the pen expressed in pixels. Its default value is 1.

### Example 1  

Draw an arc from 0° to 90° (default fill and border color, default line thickness):  
![](..Home.md..Home.mdpictureHome.md194911Home.mdpict194911.en.png)

```4d
 svgRef:=SVG_New   
 objectRef:=SVG_New_arc (svgRef;100;100;90;90;180)
```

### Example 2  

Draw the arc from 90° to 180° of a light blue circle with a blue edge and a 2-point link thickness:  
![](..Home.md..Home.mdpictureHome.md194912Home.mdpict194912.en.png)

```4d
 svgRef:=SVG_New   
 objectRef:=SVG_New_arc (svgRef;100;100;90;180;270;"blue";"lightblue";2)
```

## See also

[SVG_PATH_ARC](SVG_PATH_ARC.md)
