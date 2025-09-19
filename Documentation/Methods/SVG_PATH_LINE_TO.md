# SVG_PATH_LINE_TO

>**SVG_PATH_LINE_TO** ( *parentSVGObject* ; *x* {; *y*}{; *x2* ; *y2* ; ... ; *xN* ; *yN*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| parentSVGObject | SVG_Ref | &#8594; | Reference of parent element |
| x | Longint | &#8594; | Coordinate on X axis of new point(s) |
| y | Longint | &#8594; | Coordinate on Y axis of new point(s) |



#### Description 

The SVG\_PATH\_LINE\_TO command adds one or more straight segments to the path referred by *parentSVGObject*. If *parentSVGObject* is not a path reference (‘path’ element), an error is generated.

The *x* and *y* parameters can be used to specify the start position of the path in the SVG container.

* If only the *x* parameter is provided, the line will be drawn horizontally from the current point (xc, yc) to the point (x, yc).
* If both *x* and *y* are passed, a line will be drawn from the current point (xc, yc) to the point (x, y).
* If several pairs of coordinates are passed, the different points will be added successively. In this case, if the last pair of coordinates is incomplete (missing y), it will be ignored.

#### Example 

See the examples for the *SVG\_New\_path* command

#### See also 

[SVG\_New\_path](SVG%5FNew%5Fpath.md)  