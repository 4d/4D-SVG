<!-- nodeReference := SVG_New_polygon_by_arrays ( parentReference ; xArray ; yArray ; strokeColor ; fillColor ; strokeWidth )
 -> parentReference (Text)
 -> xArray (Pointer)
 -> yArray (Pointer)
 -> strokeColor (Text)
 -> fillColor (Text)
 -> strokeWidth (Real)
 <- nodeReference (Text)-->
# SVG_New_polygon_by_arrays

> SVG_New_polygon_by_arrays ( parentSVGObject ; xArrayPointer ; yArrayPointer {; foregroundColor {; backgroundColor {; strokeWidth}}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| xArrayPointer |     | Pointer |     | ➡️ |     | Coordinates on X axis of points |     |
| yArrayPointer |     | Pointer |     | ➡️ |     | Coordinates on Y axis of points |     |
| foregroundColor |     | String |     | ➡️ |     | Color or gradient name |     |
| backgroundColor |     | String |     | ➡️ |     | Color or gradient name |     |
| strokeWidth |     | Real |     | ➡️ |     | Line thickness |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of polygon |     |

## Description

The SVG_New_polygon_by_arrays command draws a closed form consisting of a set of straight connected segments in the SVG container designated by [parentSVGObject](# "Reference of parent element") and returns its reference. If [parentSVGObject](# "Reference of parent element") is not an SVG document, an error is generated.

All the coordinate values are in the user coordinate system.

The optional [foregroundColor](# "Color or gradient name") and [backgroundColor](# "Color or gradient name") parameters contain, respectively, the name of the line color and of the background color. (For more information about colors, please refer to the commands of the [Colors and Gradients](../Colors%20and%20Gradients.md) theme).

The optional [strokeWidth](# "Line thickness") parameter contains the size of the pen expressed in pixels. Its default value is 1.

### Example  

Draw a star (default border color and line thickness):  
![](https://doc.4d.com/4Dv19/picture/196941/pict196941.en.png)

```4d
 ARRAY LONGINT($tX;0)  
 ARRAY LONGINT($tY;0)  
   
 APPEND TO ARRAY($tX;129)  
 APPEND TO ARRAY($tY;10)  
 APPEND TO ARRAY($tX;158)  
 APPEND TO ARRAY($tY;96)  
 APPEND TO ARRAY($tX;248)  
 APPEND TO ARRAY($tY;96)  
 APPEND TO ARRAY($tX;176)  
 APPEND TO ARRAY($tY;150)  
 APPEND TO ARRAY($tX;202)  
 APPEND TO ARRAY($tY;236)  
 APPEND TO ARRAY($tX;129)  
 APPEND TO ARRAY($tY;185)  
 APPEND TO ARRAY($tX;56)  
 APPEND TO ARRAY($tY;236)  
 APPEND TO ARRAY($tX;82)  
 APPEND TO ARRAY($tY;150)  
 APPEND TO ARRAY($tX;10)  
 APPEND TO ARRAY($tY;96)  
 APPEND TO ARRAY($tX;100)  
 APPEND TO ARRAY($tY;96)  
   
 objectRef:=SVG_New_polygon_by_arrays (svgRef;->$tX;->$tY)
```

## See also

[SVG_New_polygon](SVG_New_polygon.md)  
[SVG_New_regular_polygon](SVG_New_regular_polygon.md)
