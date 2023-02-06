<!-- SVG_PATH_MOVE_TO ( parentReference ; Param_2 ; Param_3 )
 -> parentReference (Text)
 -> Param_2 (Real)
 -> Param_3 (Real)-->
# SVG_PATH_MOVE_TO

> SVG_PATH_MOVE_TO ( parentSVGObject ; x ; y )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of path |     |
| x   |     | Longint |     | ➡️ |     | Coordinate on X axis |     |
| y   |     | Longint |     | ➡️ |     | Coordinate on Y axis |     |

## Description

The SVG_PATH_MOVE_TO command begins a new subpath at the point of the given coordinates ([x](## "Coordinate on X axis"), [y](## "Coordinate on Y axis")) in the path referenced by [parentSVGObject](## "Reference of path"). If [parentSVGObject](## "Reference of path") is not a path reference (‘path’ element), an error is generated.

The effect produced is as if the “pen” were lifted and moved to a new location. The current point becomes the new starting point which will be taken into account by the [SVG_PATH_CLOSE](SVG_PATH_CLOSE.md)  command.

### Example  

See the examples for the [SVG_New_path](SVG_New_path.md)  command.

## See also

[SVG_New_path](SVG_New_path.md)
