<!-- Boolean := SVG_Is_reference_valid ( svgObject )
 -> svgObject (Text)-->
# SVG_Is_reference_valid

> SVG_Is_reference_valid ( svgObject ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| Function result |     | Boolean |     | ↩️ |     | True if reference belongs to an SVG element |     |

## Description

The SVG_Is_reference_valid command returns [True](True.301-6102033.en.html "True") if the reference passed in the [svgObject](# "Reference of SVG element") parameter is that of an element of the SVG tree. If the element does not belong to an SVG tree, the command returns [False](False.301-6102037.en.html "False"). If [svgObject](# "Reference of SVG element") is not a valid reference, an error is generated.

## See also

[SVG_References_array](SVG_References_array.md)
