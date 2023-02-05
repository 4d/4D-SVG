<!-- nodeReference := SVG_New_polyline ( parentReference ; path ; strokeColor ; fillColor ; strokeWidth )
 -> parentReference (Text)
 -> path (Text)
 -> strokeColor (Text)
 -> fillColor (Text)
 -> strokeWidth (Real)
 <- nodeReference (Text)-->
# SVG_New_polyline

> SVG_New_polyline ( parentSVGObject {; points {; foregroundColor {; backgroundColor {; strokeWidth}}}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| points |     | String |     | ➡️ |     | Path |     |
| foregroundColor |     | String |     | ➡️ |     | Color or gradient name |     |
| backgroundColor |     | String |     | ➡️ |     | Color or gradient name |     |
| strokeWidth |     | Real |     | ➡️ |     | Line thickness |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of line |     |

## Description

The SVG_New_polyline command creates a new open broken line in the SVG container designated by [parentSVGObject](# "Reference of parent element") and returns its reference. If [parentSVGObject](# "Reference of parent element") is not a valid reference, an error is generated.

The optional [points](# "Path") parameter can be used to pass the path points of the line as expected by the SVG standard. If this parameter is omitted or empty, the points may be set with the [SVG_ADD_POINT](SVG_ADD_POINT.md)  command.

The optional [foregroundColor](# "Color or gradient name") and [backgroundColor](# "Color or gradient name") parameters contain, respectively, the name of the line color and of the background color. (For more information about colors, please refer to the commands of the [Colors and Gradients](Colors%20and%20Gradients.md "Colors and Gradients") theme).

The optional [strokeWidth](# "Line thickness") parameter contains the size of the pen expressed in pixels. Its default value is 1.

### Example  

Draw two triangles:  
![](..Home.md..Home.mdpictureHome.md195301Home.mdpict195301.en.png)

```4d
 $polyline:=SVG_New_polyline ($svg;"10,10 200,100 10,100 10,10";"blue";"blue:50")  
 $polyline:=SVG_New_polyline ($svg;"";"red";"red:50")  
 [SVG_ADD_POINT](SVG_ADD_POINT.md) ($polyline;205;15)  
 [SVG_ADD_POINT](SVG_ADD_POINT.md) ($polyline;15;105)  
 [SVG_ADD_POINT](SVG_ADD_POINT.md) ($polyline;205;105)  
 [SVG_ADD_POINT](SVG_ADD_POINT.md) ($polyline;205;15)
```

## See also

[SVG_New_polyline_by_arrays](SVG_New_polyline_by_arrays.md)
