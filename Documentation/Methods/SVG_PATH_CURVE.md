<!-- SVG_PATH_CURVE ( parentReference ; Param_2 ; Param_3 ; Param_4 ; Param_5 ; Param_6 ; Param_7 )
 -> parentReference (Text)
 -> Param_2 (Real)
 -> Param_3 (Real)
 -> Param_4 (Real)
 -> Param_5 (Real)
 -> Param_6 (Real)
 -> Param_7 (Real)-->
# SVG_PATH_CURVE

> SVG_PATH_CURVE ( parentSVGObject {; controlStartX ; controlStartY} ; controlEndX ; controlEndY ; x ; y )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| controlStartX |     | Longint |     | ➡️ |     | Coordinate on X axis of control point |     |
| controlStartY |     | Longint |     | ➡️ |     | Coordinate on Y axis of control point |     |
| controlEndX |     | Longint |     | ➡️ |     | Coordinate on X axis of control point |     |
| controlEndY |     | Longint |     | ➡️ |     | Coordinate on Y axis of control point |     |
| x   |     | Longint |     | ➡️ |     | Coordinate on X axis of destination point |     |
| y   |     | Longint |     | ➡️ |     | Coordinate on Y axis of destination point |     |

## Description

The SVG_PATH_CURVE command adds a cubic Bezier curve to the path referenced by [parentSVGObject](# "Reference of parent element") starting from the current point to the point whose coordinates are passed ([x](# "Coordinate on X axis of destination point"), [y](# "Coordinate on Y axis of destination point")). If [parentSVGObject](# "Reference of parent element") is not a path reference (‘path’ element), an error is generated.

The optional [controlStartX](# "Coordinate on X axis of control point") and [controlStartY](# "Coordinate on Y axis of control point") parameters can be used to specify the position of the control point at the start of the curve. If they are omitted, the first control point is supposed to be the reflection of the second control point of the previous command with respect to the current point.

The [controlEndX](# "Coordinate on X axis of control point") and [controlEndY](# "Coordinate on Y axis of control point") parameters are used to specify the position of the control point at the end of the curve.

### Example  

See the examples for the [SVG_New_path](SVG_New_path.md)  command.

## See also

[SVG_New_path](SVG_New_path.md)  
[SVG_PATH_QCURVE](SVG_PATH_QCURVE.md)
