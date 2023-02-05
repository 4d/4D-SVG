<!-- Real := SVG_Estimate_weight ( svgObject )
 -> svgObject (Text)-->
# SVG_Estimate_weight

> SVG_Estimate_weight ( svgObject ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG document |     |
| Function result |     | Real |     | ↩️ |     | Size in bytes of SVG document |     |

## Description

The SVG_Estimate_weight command returns the size in bytes of the SVG tree whose reference is passed as in the [svgObject](# "Reference of SVG document") parameter. If [svgObject](# "Reference of SVG document") is not a valid reference, an error is generated.

## See also

[SVG_Count_elements](SVG_Count_elements.md)
