<!-- SVG_PATH_QCURVE ( parentReference ; Param_2 ; Param_3 ; Param_4 ; Param_5 )
 -> parentReference (Text)
 -> Param_2 (Real)
 -> Param_3 (Real)
 -> Param_4 (Real)
 -> Param_5 (Real)-->
# SVG_PATH_QCURVE

> SVG_PATH_QCURVE ( parentSVGObject {; controlX ; controlY} ; x ; y )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| controlX |     | Longint |     | ➡️ |     | Coordinate on X axis of control point |     |
| controlY |     | Longint |     | ➡️ |     | Coordinate on Y axis of control point |     |
| x   |     | Longint |     | ➡️ |     | Coordinate on X axis of destination point |     |
| y   |     | Longint |     | ➡️ |     | Coordinate on Y axis of destination point |     |

## Description

The [SVG_PATH_CURVE](SVG_PATH_CURVE.md)  command adds a quadratic Bezier curve from the current point to the point of the coordinates ([x](# "Coordinate on X axis of destination point"), [y](# "Coordinate on Y axis of destination point")) to the line referenced by [parentSVGObject](# "Reference of parent element"). If [parentSVGObject](# "Reference of parent element") is not a path reference (‘path’ element), an error is generated.

The optional [controlX](# "Coordinate on X axis of control point") and [controlY](# "Coordinate on Y axis of control point") parameters can be used to specify the position of the control point at the beginning of the curve. If they are omitted, the first control point is supposed to be a reflection of the second control point of the previous command with respect to the current point.

### Example  

See the examples of the [SVG_New_path](SVG_New_path.md)  command.

## See also

[SVG_PATH_CURVE](SVG_PATH_CURVE.md)
