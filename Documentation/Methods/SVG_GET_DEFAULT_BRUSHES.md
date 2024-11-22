<!-- SVG_GET_DEFAULT_BRUSHES ( strokeColor ; fillColor )
 -> strokeColor (Pointer)
 -> fillColor (Pointer)-->
# SVG_GET_DEFAULT_BRUSHES

> SVG_GET_DEFAULT_BRUSHES ( line {; background} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| line |     | Pointer |     | ➡️ |     | Alpha variable |     |
| background |     | Pointer |     | ➡️ |     | Alpha variable |     |

## Description

The SVG_GET_DEFAULT_BRUSHES command returns, in the variable pointed to by [line](## "Alpha variable"), the current default color for drawing lines.

If the optional [background](## "Alpha variable") parameter is passed, the variable pointed to by this parameter will receive the current default color used for backgrounds.

If they have not been modified, these colors are, respectively, black and white.

### Example  

See the [SVG_SET_DEFAULT_BRUSHES](SVG_SET_DEFAULT_BRUSHES.md)  command.

## See also

[SVG_SET_DEFAULT_BRUSHES](SVG_SET_DEFAULT_BRUSHES.md)  
[SVG_SET_STROKE_BRUSH](SVG_SET_STROKE_BRUSH.md)
