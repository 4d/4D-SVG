<!-- nodeReference := SVG_New_ellipse_bounded ( parentReference ; left ; top ; width ; height ; strokeColor ; fillColor ; strokeWidth )
 -> parentReference (Text)
 -> left (Real)
 -> top (Real)
 -> width (Real)
 -> height (Real)
 -> strokeColor (Text)
 -> fillColor (Text)
 -> strokeWidth (Real)
 <- nodeReference (Text)-->
# SVG_New_ellipse_bounded

> SVG_New_ellipse_bounded ( parentSVGObject ; x ; y ; width ; height {; foregroundColor {; backgroundColor {; strokeWidth}}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| x   |     | Longint |     | ➡️ |     | Coordinate on X axis of upper left corner |     |
| y   |     | Longint |     | ➡️ |     | Coordinate on Y axis of upper left corner |     |
| width |     | Longint |     | ➡️ |     | Width of bounding rectangle |     |
| height |     | Longint |     | ➡️ |     | Height of bounding rectangle |     |
| foregroundColor |     | String |     | ➡️ |     | Color or gradient name |     |
| backgroundColor |     | String |     | ➡️ |     | Color or gradient name |     |
| strokeWidth |     | Real |     | ➡️ |     | Line thickness |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of ellipse |     |

## Description

The SVG_New_ellipse_bounded command creates a new ellipse in the SVG container designated by [parentSVGObject](# "Reference of parent element"). If [parentSVGObject](# "Reference of parent element") is not an SVG document, an error is generated.

The ellipse created fits into the rectangle set by [x](# "Coordinate on X axis of upper left corner"), [y](# "Coordinate on Y axis of upper left corner"), [width](# "Width of bounding rectangle") and [height](# "Height of bounding rectangle").

The optional [foregroundColor](# "Color or gradient name") and [backgroundColor](# "Color or gradient name") parameters contain, respectively, the name of the line color and of the background color. (For more information about colors, please refer to the commands of the [Colors and Gradients](Colors%20and%20Gradients.md "Colors and Gradients") theme).

The optional [strokeWidth](# "Line thickness") parameter contains the size of the pen expressed in pixels. Its default value is 1.

### Example 1  

Draw an ellipse (default fill and border color, default line thickness):  
![](..Home.md..Home.mdpictureHome.md196835Home.mdpict196835.en.png)

```4d
 svgRef:=SVG_New   
 objectRef:=SVG_New_ellipse_bounded (svgRef;10;10;200;100)
```

### Example 2  

Draw a light blue ellipse with a blue edge and a 2-point line thickness:  
![](..Home.md..Home.mdpictureHome.md196836Home.mdpict196836.en.png)

```4d
 svgRef:=SVG_New   
 objectRef:=SVG_New_ellipse_bounded (svgRef;100;100;200;100;"blue";"lightblue";2)
```

## See also

[SVG_New_ellipse](SVG_New_ellipse.md)
