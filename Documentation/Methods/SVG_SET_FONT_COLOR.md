<!-- SVG_SET_FONT_COLOR ( svgObject ; fillColor ; strokeColor )
 -> svgObject (Text)
 -> fillColor (Text)
 -> strokeColor (Text)-->
# SVG_SET_FONT_COLOR

> SVG_SET_FONT_COLOR ( svgObject ; color )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| color |     | String |     | ➡️ |     | Text color |     |

## Description

The SVG_SET_FONT_COLOR command can be used to specify the font color for the for the SVG object having the [svgObject](# "Reference of SVG element") reference. If [svgObject](# "Reference of SVG element") does not reference a valid element, an error is generated.

The [color](# "Text color") parameter contains the name of the color to be used. (For more information about colors, please refer to the "[SVG Colors](../SVG%20Colors.md)" section).

## See also

[SVG Colors](../SVG%20Colors.md)
