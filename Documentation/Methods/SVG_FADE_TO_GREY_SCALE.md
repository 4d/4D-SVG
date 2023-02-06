<!-- SVG_FADE_TO_GREY_SCALE ( svgObject ; grey )
 -> svgObject (Text)
 -> grey (Real) - {grey value}-->
# SVG_FADE_TO_GREY_SCALE

> SVG_FADE_TO_GREY_SCALE ( svgObject {; value} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | SVG object reference |     |
| value |     | Real |     | ➡️ |     | Grey value |     |

## Description

The **SVG_FADE_TO_GREY_SCALE** command applies a filter to transform the gray scale for an SVG image whose reference is passed in the [svgObject](## "SVG object reference") parameter.

You can pass the gray scale value to be applied in the optional [value](## "Grey value") parameter. If you do not pass this parameter, the transformation is in accordance with the visual perception of the luminance (30% red, 59% green and 11% blue).
