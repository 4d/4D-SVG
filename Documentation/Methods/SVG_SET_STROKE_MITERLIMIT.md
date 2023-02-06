<!-- SVG_SET_STROKE_MITERLIMIT ( element ; mitterlimit )
 -> element (Text)
 -> mitterlimit (Long Integer)-->
# SVG_SET_STROKE_MITERLIMIT

> SVG_SET_STROKE_MITERLIMIT ( svgObject ; join )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| join |     | Longint |     | ➡️ |     | Value of join |     |

## Description

The SVG_SET_STROKE_MITERLIMIT command is used to set the limit for the length of the miter join between the path and the outline of the SVG object designated by [svgObject](# "Reference of SVG element"). If [svgObject](# "Reference of SVG element") is not a valid SVG reference, an error is generated.

If the [join](# "Value of join") parameter is -1, the value will be the default value (4). If the [join](# "Value of join") parameter is 0, then the definition of the attribute is removed. Any other value < 0 will cause an error.

**See Also:** [www.w3.org/TR/SVG/painting.html#StrokeProperties](www.w3.org/TR/SVG/painting.html#StrokeProperties)
