<!-- nodeReference := SVG_New_ellipse ( parentReference ; cx ; cy ; rx ; ry ; strokeColor ; fillColor ; strokeWidth )
 -> parentReference (Text)
 -> cx (Real)
 -> cy (Real)
 -> rx (Real)
 -> ry (Real)
 -> strokeColor (Text)
 -> fillColor (Text)
 -> strokeWidth (Real)
 <- nodeReference (Text)-->
# SVG_New_ellipse

> SVG_New_ellipse ( parentSVGObject ; x ; y ; xRadius ; yRadius {; foregroundColor {; backgroundColor {; strokeWidth}}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| x   |     | Longint |     | ➡️ |     | Coordinate on center X axis of ellipse |     |
| y   |     | Longint |     | ➡️ |     | Coordinate on center Y axis of ellipse |     |
| xRadius |     | Longint |     | ➡️ |     | Radius on X axis |     |
| yRadius |     | Longint |     | ➡️ |     | Radius on Y axis |     |
| foregroundColor |     | String |     | ➡️ |     | Color or gradient name |     |
| backgroundColor |     | String |     | ➡️ |     | Color or gradient name |     |
| strokeWidth |     | Real |     | ➡️ |     | Line thickness |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of ellipse |     |

## Description

The SVG_New_ellipse command creates a new ellipse in the SVG container designated by [parentSVGObject](# "Reference of parent element"). If [parentSVGObject](# "Reference of parent element") is not an SVG document, an error is generated.

The ellipse is positioned and sized according to the values of [x](# "Coordinate on center X axis of ellipse"), [y](# "Coordinate on center Y axis of ellipse"), width and height.

The optional [foregroundColor](# "Color or gradient name") and [backgroundColor](# "Color or gradient name") parameters contain, respectively, the name of the line color and of the background color. (For more information about colors, please refer to the commands of the [Colors and Gradients](../Colors%20and%20Gradients.md) theme).

The optional [strokeWidth](# "Line thickness") parameter contains the size of the pen expressed in pixels. Its default value is 1.

### Example 1  

Draw an ellipse (default fill and border color, default line thickness):  
![](https://doc.4d.com/4Dv19/picture/195019/pict195019.en.png)

```4d
 svgRef:=SVG_New   
 objectRef:=SVG_New_ellipse (svgRef;100;50;90;40)
```

### Example 2  

Draw a light blue ellipse with a blue edge and a 2-point line thickness:  
![](https://doc.4d.com/4Dv19/picture/195020/pict195020.en.png)

```4d
 svgRef:=SVG_New   
 objectRef:=SVG_New_ellipse (svgRef;100;50;90;40;"blue";"lightblue";2)
```

## See also

[SVG_New_circle](SVG_New_circle.md)  
[SVG_New_ellipse_bounded](SVG_New_ellipse_bounded.md)
