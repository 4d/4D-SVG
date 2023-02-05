<!-- SVG_PATH_CLOSE ( parentReference )
 -> parentReference (Text)-->
# SVG_PATH_CLOSE

> SVG_PATH_CLOSE ( parentSVGObject )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of path |     |

## Description

The SVG_PATH_CLOSE command closes the current subpath referenced by [parentSVGObject](# "Reference of path") by drawing a straight line from the current point to the initial point. If [parentSVGObject](# "Reference of path") is not a path reference (‘path’ element), an error is generated.

### Example  

See the examples for the [SVG_New_path](SVG_New_path.md)  command.

## See also

[SVG_New_path](SVG_New_path.md)
