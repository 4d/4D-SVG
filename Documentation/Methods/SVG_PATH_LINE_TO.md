<!-- SVG_PATH_LINE_TO ( parentReference ; Param_2 ; Param_3 ; Param_4 ; … ; N )
 -> parentReference (Text)
 -> Param_2 (Real)
 -> Param_3 (Real)
 -> Param_4 ; … ; N (Real)-->
# SVG_PATH_LINE_TO

> SVG_PATH_LINE_TO ( parentSVGObject ; x {; y}{; x2 ; y2 ; ... ; xN ; yN} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| x   |     | Longint |     | ➡️ |     | Coordinate on X axis of new point(s) |     |
| y   |     | Longint |     | ➡️ |     | Coordinate on Y axis of new point(s) |     |

## Description

The SVG_PATH_LINE_TO command adds one or more straight segments to the path referred by [parentSVGObject](## "Reference of parent element"). If [parentSVGObject](## "Reference of parent element") is not a path reference (‘path’ element), an error is generated.

The [x](## "Coordinate on X axis of new point(s)") and [y](## "Coordinate on Y axis of new point(s)") parameters can be used to specify the start position of the path in the SVG container.

* If only the [x](## "Coordinate on X axis of new point(s)") parameter is provided, the line will be drawn horizontally from the current point (xc, yc) to the point (x, yc).
* If both [x](## "Coordinate on X axis of new point(s)") and [y](## "Coordinate on Y axis of new point(s)") are passed, a line will be drawn from the current point (xc, yc) to the point (x, y).
* If several pairs of coordinates are passed, the different points will be added successively. In this case, if the last pair of coordinates is incomplete (missing y), it will be ignored.

### Example  

See the examples for the [SVG_New_path](SVG_New_path.md)  command

## See also

[SVG_New_path](SVG_New_path.md)
