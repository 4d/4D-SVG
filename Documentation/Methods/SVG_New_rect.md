<!-- nodeReference := SVG_New_rect ( parentReference ; x ; y ; width ; height ; rX ; rY ; strokeColor ; fillColor ; strokeWidth )
 -> parentReference (Text)
 -> x (Real)
 -> y (Real)
 -> width (Real)
 -> height (Real)
 -> rX (Real)
 -> rY (Real)
 -> strokeColor (Text)
 -> fillColor (Text)
 -> strokeWidth (Real)
 <- nodeReference (Text)-->
# SVG_New_rect

> SVG_New_rect ( parentSVGObject ; x ; y ; width ; height {; roundedX {; roundedY {; foregroundColor {; backgroundColor {; strokeWidth}}}}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| x   |     | Longint |     | ➡️ |     | X of upper left corner |     |
| y   |     | Longint |     | ➡️ |     | Y of upper left corner |     |
| width |     | Longint |     | ➡️ |     | Width of rectangle |     |
| height |     | Longint |     | ➡️ |     | Height of rectangle |     |
| roundedX |     | Longint |     | ➡️ |     | Horizontal curve |     |
| roundedY |     | Longint |     | ➡️ |     | Vertical curve |     |
| foregroundColor |     | String |     | ➡️ |     | Color or gradient name |     |
| backgroundColor |     | String |     | ➡️ |     | Color or gradient name |     |
| strokeWidth |     | Real |     | ➡️ |     | Line thickness |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of rectangle |     |

## Description

The SVG_New_rect command creates a new rectangle in the SVG container designated by [parentSVGObject](## "Reference of parent element") and returns its reference. If [parentSVGObject](## "Reference of parent element") is not an SVG document, an error is generated.

The rectangle is positioned and sized according to the values of [x](## "X of upper left corner"), [y](## "Y of upper left corner"), [width](## "Width of rectangle") and [height](## "Height of rectangle").

The optional [roundedX](## "Horizontal curve") and [roundedY](## "Vertical curve") parameters can be used to round off the angles according to the indicated values. If the [roundedY](## "Vertical curve") parameter is omitted (or is -1), the curve will be regular. Pass -1 in these parameters if you want them to be ignored by the command.

The optional [foregroundColor](## "Color or gradient name") and [backgroundColor](## "Color or gradient name") parameters contain, respectively, the name of the line color and of the background color. (For more information about colors, please refer to the commands of the [Colors and Gradients](../Colors%20and%20Gradients.md) theme).

The optional [strokeWidth](## "Line thickness") parameter contains the size of the pen expressed in pixels. Its default value is 1.

### Example 1  

Draw a rectangle (default fill and border color, default line thickness):

![](https://doc.4d.com/4Dv19/picture/195332/pict195332.en.png)

```4d
 svgRef:=SVG_New   
 objectRef:=SVG_New_rect (svgRef;10;10;200;100)
```

### Example 2  

Draw a blue rectangle with a 3-pixel red border:

![](https://doc.4d.com/4Dv19/picture/195333/pict195333.en.png)svgRef:= SVG_New  
objectRef:=SVG_New_rect (svgRef;10;10;200;100;0;0;"red";"blue";3)

### Example 3  

Draw a square with rounded edges (default fill and border color, default line thickness):

![](https://doc.4d.com/4Dv19/picture/195334/pict195334.en.png)

```4d
 svgRef:=SVG_New   
 objectRef:=SVG_New_rect (svgRef;10;10;100;100;20)
```

### Example 4  

Draw a light blue rectangle with rounded ends and a blue edge (default line thickness):

![](https://doc.4d.com/4Dv19/picture/195335/pict195335.en.png)

```4d
 svgRef:=SVG_New   
 objectRef:=SVG_New_rect (svgRef;10;10;200;100;-1;50;"blue";"lightblue")
```

## See also

[SVG_New_polygon](SVG_New_polygon.md)  
[SVG_SET_ROUNDING_RECT](SVG_SET_ROUNDING_RECT.md)
