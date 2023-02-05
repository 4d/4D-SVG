<!-- SVG_ADD_POINT ( parentReference ; Param_2 ; … ; N )
-> parentReference (Text)
-> Param_2 ; … ; N (Real)-->
# SVG_ADD_POINT

> SVG_ADD_POINT ( parentSVGObject ; x ; y {; x2 ; y2 ; ... ; xN ; yN} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| x   |     | Longint |     | ➡️ |     | Coordinate on X axis of new point(s) |     |
| y   |     | Longint |     | ➡️ |     | Coordinate onY xis of new point(s) |     |

## Description

The SVG_ADD_POINT command adds one or more segments to the path referenced by [parentSVGObject](# "Reference of parent element"). The path may be of the ‘path’, ‘polyline’ or ‘polygon’ type. If [parentSVGObject](# "Reference of parent element") is not a path reference of this type, an error is generated.

If several pairs of coordinates are passed, the different points will be added successively. In this case, if the last pair of coordinates is incomplete (missing y), it will be ignored.

### Example  

See the examples for the [SVG_New_polyline](SVG_New_polyline.md) command.

## See also

[SVG_New_path](SVG_New_path.md)  
[SVG_New_polygon](SVG_New_polygon.md)  
[SVG_New_polyline](SVG_New_polyline.md)
