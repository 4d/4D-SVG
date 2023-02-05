<!-- symbolID := SVG_Define_symbol ( svgObject ; ID ; x ; y ; width ; height ; preserveAspectRatio )
 -> svgObject (Text)
 -> ID (Text)
 -> x (Real)
 -> y (Real)
 -> width (Real)
 -> height (Real)
 -> preserveAspectRatio (Text)
 <- symbolID (Text)-->
# SVG_Define_symbol

> SVG_Define_symbol ( parentSVGObject ; id {; x {; y {; width {; height {; mode}}}}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| id  |     | String |     | ➡️ |     | Name of symbol |     |
| x   |     | Longint |     | ➡️ |     | X position of viewbox |     |
| y   |     | Longint |     | ➡️ |     | Y position of viewbox |     |
| width |     | Longint |     | ➡️ |     | Width of viewbox |     |
| height |     | Longint |     | ➡️ |     | Height of viewbox |     |
| mode |     | String |     | ➡️ |     | Adjustment to viewbox |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of symbol |     |

## Description

The SVG_Define_symbol command creates a symbol in the SVG container designated by [parentSVGObject](# "Reference of parent element") and returns its reference. If [parentSVGObject](# "Reference of parent element") is not an SVG document, an error is generated.

A symbol object is used to specify graphic objects that may be instantiated using the [SVG_Use](SVG_Use.md)  command.

The [id](# "Name of symbol") parameter specifies the name of the symbol.

The optional [x](# "X position of viewbox"), [y](# "Y position of viewbox"), [width](# "Width of viewbox") and [height](# "Height of viewbox") parameters specify the viewbox rectangle ('viewBox' attribute).

The optional [mode](# "Adjustment to viewbox") parameter can be used to indicate if the graphic must be fitted, and how so, to the size of the viewbox. For more information about this point, please refer to the description of the [SVG_New](SVG_New.md)  command.

### Example  

Refer to the description of the [SVG_Use](SVG_Use.md)  command.

## See also

[SVG_Use](SVG_Use.md)
