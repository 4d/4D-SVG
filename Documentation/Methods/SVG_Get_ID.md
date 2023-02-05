<!-- ID := SVG_Get_ID ( nodeReference )
 -> nodeReference (Text)
 <- ID (Text)-->
# SVG_Get_ID

> SVG_Get_ID ( svgObject ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| Function result |     | String |     | ↩️ |     | Name of element |     |

## Description

The SVG_Get_ID command returns the value of the 'id' attribute of the element whose reference is passed in the [svgObject](# "Reference of SVG element") parameter. If [svgObject](# "Reference of SVG element") is not valid or if this attribute does not exist, an error is generated.

## See also

[SVG_Find_ID](SVG_Find_ID.md)  
[SVG_SET_ID](SVG_SET_ID.md)
