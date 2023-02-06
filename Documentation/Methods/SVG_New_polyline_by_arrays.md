<!-- nodeReference := SVG_New_polyline_by_arrays ( parentReference ; xArray ; yArray ; strokeColor ; fillColor ; strokeWidth )
 -> parentReference (Text)
 -> xArray (Pointer)
 -> yArray (Pointer)
 -> strokeColor (Text)
 -> fillColor (Text)
 -> strokeWidth (Real)
 <- nodeReference (Text)-->
# SVG_New_polyline_by_arrays

> SVG_New_polyline_by_arrays ( parentSVGObject ; xArrayPointer ; yArrayPointer {; foregroundColor {; backgroundColor {; strokeWidth}}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| xArrayPointer |     | Pointer |     | ➡️ |     | Coordinates on X axis of points |     |
| yArrayPointer |     | Pointer |     | ➡️ |     | Coordinates on Y axis of points |     |
| foregroundColor |     | String |     | ➡️ |     | Color or gradient name |     |
| backgroundColor |     | String |     | ➡️ |     | Color or gradient name |     |
| strokeWidth |     | Real |     | ➡️ |     | Line thickness |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of line |     |

## Description

The SVG_New_polyline_by_arrays command draws a broken line composed of straight segments connected together in the SVG container designated by [parentSVGObject](# "Reference of parent element") and returns its reference. If [parentSVGObject](# "Reference of parent element") is not an SVG document, an error is generated.

Usually, 'polyline' elements design open forms but they can be used for closed forms as well. In this case the last point must be set as equal to the first.

All the coordinate values are in the user coordinate system.

The optional [foregroundColor](# "Color or gradient name") and [backgroundColor](# "Color or gradient name") parameters contain, respectively, the name of the line color and of the background color. (For more information about colors, please refer to the commands of the [Colors and Gradients](../Colors%20and%20Gradients.md) theme).

The optional [strokeWidth](# "Line thickness") parameter contains the size of the pen expressed in pixels. Its default value is 1.

### Example 1  

Draw a triangle (default border color and line thickness):  
![](https://doc.4d.com/4Dv19/picture/196982/pict196982.en.png)

```4d
 ARRAY LONGINT($tX;0)  
 ARRAY LONGINT($tY;0)  
   
 APPEND TO ARRAY($tX;10)  
 APPEND TO ARRAY($tY;10)  
 APPEND TO ARRAY($tX;200)  
 APPEND TO ARRAY($tY;100)  
 APPEND TO ARRAY($tX;10)  
 APPEND TO ARRAY($tY;100)  
 APPEND TO ARRAY($tX;10)  
 APPEND TO ARRAY($tY;10)  
   
 svgRef:=SVG_New   
 objectRef:=SVG_New_polyline_by_arrays (svgRef;->$tX;->$tY)
```

### Example 2  

Draw a line diagram:  
![](https://doc.4d.com/4Dv19/picture/196983/pict196983.en.png)

```4d
 ARRAY LONGINT($tX;0)  
 ARRAY LONGINT($tY;0)  
  
```

X axis  

```4d
 For($Lon_i;0;200;20)  
    APPEND TO ARRAY($tX;$Lon_i)  
 End for  
```

Values  

```4d
 APPEND TO ARRAY($tY;100)  
 APPEND TO ARRAY($tY;100)  
 APPEND TO ARRAY($tY;30)  
 APPEND TO ARRAY($tY;30)  
 APPEND TO ARRAY($tY;80)  
 APPEND TO ARRAY($tY;60)  
 APPEND TO ARRAY($tY;10)  
 APPEND TO ARRAY($tY;40)  
 APPEND TO ARRAY($tY;50)  
 APPEND TO ARRAY($tY;70)  
   
 objectRef:=SVG_New_polyline_by_arrays (svgRef;->$tX;->$tY;"crimson";"none";5)
```

## See also 

[SVG_New_polyline](SVG_New_polyline.md)
