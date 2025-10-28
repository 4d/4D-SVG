# SVG_New_circle

>**SVG_New_circle** ( *parentSVGObject* ; *x* ; *y* ; *radius* {; *foregroundColor* {; *backgroundColor* {; *strokeWidth*}}} ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| parentSVGObject | SVG_Ref | &#8594; | Reference of parent element |
| x | Longint | &#8594; | Coordinate on center X axis |
| y | Longint | &#8594; | Coordinate on center Y axis |
| radius | Longint | &#8594; | Radius of circle |
| foregroundColor | String | &#8594; | Color or gradient name |
| backgroundColor | String | &#8594; | Color or gradient name |
| strokeWidth | Real | &#8594; | Line thickness |
| Function result | SVG_Ref | &#8592; | Reference of circle |



#### Description 

The SVG\_New\_circle command creates a new circle in the SVG container designated by *parentSVGObject* and returns its reference. If *parentSVGObject* is not an SVG document, an error is generated.

The circle is positioned and sized according to the center coordinates (*x* and *y*) and the *radius* passed as a parameter.

The optional *foregroundColor* and *backgroundColor* parameters contain, respectively, the name of the line color and of the background color. (For more information about colors, please refer to the commands of the *Colors and Gradients* theme).

The optional *strokeWidth* parameter contains the size of the pen expressed in pixels. Its default value is 1.

#### Example 1 

Draw a circle (default fill and border color, default line thickness):  
![](../images/pict194977.en.png)

```4d
 svgRef:=SVG_New
 objectRef:=SVG_New_circle(svgRef;100;100;90)
```

#### Example 2 

Draw a light blue circle with a blue edge and a 2-point link thickness:  
![](../images/pict194978.en.png)

```4d
 svgRef:=SVG_New
 objectRef:=SVG_New_circle(svgRef;100;100;90;"blue";"lightblue";2)
```

#### See also 

[SVG\_New\_ellipse](SVG_New_ellipse.md)  