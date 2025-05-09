<!-- nodeReference := SVG_New_circle ( parentReference ; x ; y ; rayon ; strokeColor ; fillColor ; strokeWidth )
 -> parentReference (Text)
 -> x (Real)
 -> y (Real)
 -> rayon (Real)
 -> strokeColor (Text)
 -> fillColor (Text)
 -> strokeWidth (Real)
 <- nodeReference (Text)-->
# SVG_New_circle

> SVG_New_circle ( parentSVGObject ; x ; y ; radius {; foregroundColor {; backgroundColor {; strokeWidth}}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| x   |     | Longint |     | ➡️ |     | Coordinate on center X axis |     |
| y   |     | Longint |     | ➡️ |     | Coordinate on center Y axis |     |
| radius |     | Longint |     | ➡️ |     | Radius of circle |     |
| foregroundColor |     | String |     | ➡️ |     | Color or gradient name |     |
| backgroundColor |     | String |     | ➡️ |     | Color or gradient name |     |
| strokeWidth |     | Real |     | ➡️ |     | Line thickness |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of circle |     |

## Description

The SVG_New_circle command creates a new circle in the SVG container designated by [parentSVGObject](## "Reference of parent element") and returns its reference. If [parentSVGObject](## "Reference of parent element") is not an SVG document, an error is generated.

The circle is positioned and sized according to the center coordinates ([x](## "Coordinate on center X axis") and [y](## "Coordinate on center Y axis")) and the [radius](## "Radius of circle") passed as a parameter.

The optional [foregroundColor](## "Color or gradient name") and [backgroundColor](## "Color or gradient name") parameters contain, respectively, the name of the line color and of the background color. (For more information about colors, please refer to the commands of the [Colors and Gradients](../Colors%20and%20Gradients.md) theme).

The optional [strokeWidth](## "Line thickness") parameter contains the size of the pen expressed in pixels. Its default value is 1.

### Example 1  

Draw a circle (default fill and border color, default line thickness):  
![](https://doc.4d.com/4Dv19/picture/194977/pict194977.en.png)

```4d
 svgRef:=SVG_New   
 objectRef:=SVG_New_circle (svgRef;100;100;90)
```

### Example 2  

Draw a light blue circle with a blue edge and a 2-point link thickness:  
![](https://doc.4d.com/4Dv19/picture/194978/pict194978.en.png)

```4d
 svgRef:=SVG_New   
 objectRef:=SVG_New_circle (svgRef;100;100;90;"blue";"lightblue";2)
```

## See also

[SVG_New_ellipse](SVG_New_ellipse.md)
