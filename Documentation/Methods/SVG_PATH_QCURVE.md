# SVG_PATH_QCURVE

>**SVG_PATH_QCURVE** ( *parentSVGObject* {; *controlX* ; *controlY*} ; *x* ; *y* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| parentSVGObject | SVG_Ref | &#x1F852; | Reference of parent element |
| controlX | Longint | &#x1F852; | Coordinate on X axis of control point |
| controlY | Longint | &#x1F852; | Coordinate on Y axis of control point |
| x | Longint | &#x1F852; | Coordinate on X axis of destination point |
| y | Longint | &#x1F852; | Coordinate on Y axis of destination point |



#### Description 

The *SVG\_PATH\_CURVE* command adds a quadratic Bezier curve from the current point to the point of the coordinates (*x*, *y*) to the line referenced by *parentSVGObject*. If *parentSVGObject* is not a path reference (‘path’ element), an error is generated.

The optional *controlX* and *controlY* parameters can be used to specify the position of the control point at the beginning of the curve. If they are omitted, the first control point is supposed to be a reflection of the second control point of the previous command with respect to the current point.

#### Example 

See the examples of the *SVG\_New\_path* command.

#### See also 

[SVG\_PATH\_CURVE](SVG%5FPATH%5FCURVE.md)  