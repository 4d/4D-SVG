# SVG_PATH_CURVE

>**SVG_PATH_CURVE** ( *parentSVGObject* {; *controlStartX* ; *controlStartY*} ; *controlEndX* ; *controlEndY* ; *x* ; *y* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| parentSVGObject | SVG_Ref | &#x1F852; | Reference of parent element |
| controlStartX | Longint | &#x1F852; | Coordinate on X axis of control point |
| controlStartY | Longint | &#x1F852; | Coordinate on Y axis of control point |
| controlEndX | Longint | &#x1F852; | Coordinate on X axis of control point |
| controlEndY | Longint | &#x1F852; | Coordinate on Y axis of control point |
| x | Longint | &#x1F852; | Coordinate on X axis of destination point |
| y | Longint | &#x1F852; | Coordinate on Y axis of destination point |



#### Description 

The SVG\_PATH\_CURVE command adds a cubic Bezier curve to the path referenced by *parentSVGObject* starting from the current point to the point whose coordinates are passed (*x*, *y*). If *parentSVGObject* is not a path reference (‘path’ element), an error is generated.

The optional *controlStartX* and *controlStartY* parameters can be used to specify the position of the control point at the start of the curve. If they are omitted, the first control point is supposed to be the reflection of the second control point of the previous command with respect to the current point.

The *controlEndX* and *controlEndY* parameters are used to specify the position of the control point at the end of the curve.

#### Example 

See the examples for the *SVG\_New\_path* command.

#### See also 

[SVG\_New\_path](SVG%5FNew%5Fpath.md)  
[SVG\_PATH\_QCURVE](SVG%5FPATH%5FQCURVE.md)  