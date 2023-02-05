<!-- name := SVG_Read_element_type ( svgObject )
 -> svgObject (Text)
 <- name (Text)-->
# SVG_Read_element_type

> SVG_Read_element_type ( svgObject ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| Function result |     |     |     | ↩️ |     | Type of element |     |

## Description

The SVG_Read_element_type command returns the type of element whose reference is passed in the [svgObject](# "Reference of SVG element") parameter.

If [svgObject](# "Reference of SVG element") is not a valid reference or if this attribute does not exist, an error is generated.
