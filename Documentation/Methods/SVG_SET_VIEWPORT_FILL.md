<!-- SVG_SET_VIEWPORT_FILL ( objectID ; color ; opacity )
 -> objectID (Text)
 -> color (Text)
 -> opacity (Long Integer)-->
# SVG_SET_VIEWPORT_FILL

> SVG_SET_VIEWPORT_FILL ( svgObject {; color {; opacity}} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| color |     | String |     | ➡️ |     | Fill color |     |
| opacity |     | Longint |     | ➡️ |     | Percentage of opacity |     |

## Description

The SVG_SET_VIEWPORT_FILL command can be used to set the background color of an SVG document having the [svgObject](## "Reference of SVG element") reference.

If this attribute already exists, its value is replaced by the value passed as parameter. If [svgObject](## "Reference of SVG element") is an SVG element that does not accept this attribute, an error is generated.

The optional [color](## "Fill color") parameter indicates the color to be used for the picture background. If this parameter is omitted or contains an empty string, white will be used. For more information about colors, please refer to the [SVG Colors](../SVG%20Colors.md) section.

The optional [opacity](## "Percentage of opacity") parameter can be used to specify the value of the percentage of opacity to be applied to this fill. If this parameter is omitted or if no opacity has been specified for the document, the value 100% is used.

## See also

[SVG Colors](../SVG%20Colors.md)
