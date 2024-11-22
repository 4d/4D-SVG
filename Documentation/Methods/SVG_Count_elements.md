<!-- Count := SVG_Count_elements ( svgObject )
 -> svgObject (Text)
 <- Count (Long Integer)-->
# SVG_Count_elements

> SVG_Count_elements ( svgObject ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | SVG reference |     |
| Function result |     | Longint |     | ↩️ |     | Number of objects |     |

## Description

The SVG_Count_elements command returns the number of graphic objects contains in the [svgObject](## "SVG reference") passed as parameter. A group counts as one object. To find out the number of graphic objects in a group, passed its reference to the command. If [svgObject](## "SVG reference") is not valid, an error is generated.

## See also

[SVG_ELEMENTS_TO_ARRAYS](SVG_ELEMENTS_TO_ARRAYS.md)  
[SVG_New_group](SVG_New_group.md)
