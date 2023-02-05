<!-- Reference := SVG_Find_ID ( svgObject ; ID )
 -> svgObject (Text)
 -> ID (Text)
 <- Reference (Text)-->
# SVG_Find_ID

> SVG_Find_ID ( svgObject ; name ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG object |     |
| name |     | String |     | ➡️ |     | ID of SVG element |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of element |     |

## Description

The SVG_Find_ID command returns the reference of the element whose ID is passed in the [name](# "ID of SVG element") parameter, belonging to the SVG structure whose root element is passed in [svgObject](# "Reference of SVG object").  
If the element is not found, an error is generated.

## See also

[SVG_Get_ID](SVG_Get_ID.md)  
[SVG_SET_ID](SVG_SET_ID.md)
