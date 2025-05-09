<!-- SVG_SET_FONT_SIZE ( svgObject ; fontSize )
 -> svgObject (Text)
 -> fontSize (Long Integer)-->
# SVG_SET_FONT_SIZE

> SVG_SET_FONT_SIZE ( svgObject ; size )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| size |     | Integer |     | ➡️ |     | Size of characters in points |     |

## Description

The SVG_SET_FONT_SIZE command can be used to specify the font [size](## "Size of characters in points") for the SVG object having the [svgObject](## "Reference of SVG element") reference. If [svgObject](## "Reference of SVG element") does not reference a valid element, an error is generated.

The [size](## "Size of characters in points") parameter contains the font size in points.

## See also

[SVG_SET_FONT_STYLE](SVG_SET_FONT_STYLE.md)
