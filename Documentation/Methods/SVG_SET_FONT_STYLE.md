<!-- SVG_SET_FONT_STYLE ( svgObject ; fontStyle )
 -> svgObject (Text)
 -> fontStyle (Long Integer)-->
# SVG_SET_FONT_STYLE

> SVG_SET_FONT_STYLE ( svgObject ; style )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| style |     | Integer |     | ➡️ |     | Style of characters |     |

## Description

The SVG_SET_FONT_STYLE command can be used to specify the text style for the SVG object having the [svgObject](# "Reference of SVG element") reference. If [svgObject](# "Reference of SVG element") does not reference a valid element, an error is generated.

In the [style](# "Style of characters") parameter, you must pass one of the following values or a combination of several values:

> 0 = Plain  
> 1 = Bold  
> 2 = Italic  
> 4 = Underline  
> 8 = Strikethrough

## See also

[SVG_SET_FONT_SIZE](SVG_SET_FONT_SIZE.md)
