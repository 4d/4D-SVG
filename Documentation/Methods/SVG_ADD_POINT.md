# SVG_ADD_POINT

>**SVG_ADD_POINT** ( *parentSVGObject* ; *x* ; *y* {; *x2* ; *y2* ; ... ; *xN* ; *yN*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| parentSVGObject | SVG_Ref | &#x1F852; | Reference of parent element |
| x | Longint | &#x1F852; | Coordinate on X axis of new point(s) |
| y | Longint | &#x1F852; | Coordinate onY xis of new point(s) |



#### Description 

The SVG\_ADD\_POINT command adds one or more segments to the path referenced by *parentSVGObject*. The path may be of the ‘path’, ‘polyline’ or ‘polygon’ type. If *parentSVGObject* is not a path reference of this type, an error is generated.

If several pairs of coordinates are passed, the different points will be added successively. In this case, if the last pair of coordinates is incomplete (missing y), it will be ignored.

#### Example 

See the examples for the *SVG\_New\_polyline* command.

#### See also 

[SVG\_New\_path](SVG%5FNew%5Fpath.md)  
[SVG\_New\_polygon](SVG%5FNew%5Fpolygon.md)  
[SVG\_New\_polyline](SVG%5FNew%5Fpolyline.md)  