<!-- SVG_SCALING_CENTERED ( svgObject ; scale ; X ; Y )
 -> svgObject (Text)
 -> scale (Real)
 -> X (Real) -  {x} (middle)
 -> Y (Real) -  {y} (middle)-->
# SVG_SCALING_CENTERED

> SVG_SCALING_CENTERED ( svgObject ; scale {; x ; y} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | SVG object reference |     |
| scale |     | Real |     | ➡️ |     | Scale value |     |
| x   |     | Real |     | ➡️ |     | X axis |     |
| y   |     | Real |     | ➡️ |     | Y axis |     |

## Description

The **SVG_SCALING_CENTERED** command performs a centered scaling of the SVG image whose reference is passed in the [svgObject](# "SVG object reference") parameter.

In the [scale](# "Scale value") parameter, you pass a positive scale value (>1). If you pass 1, the scale is set to 100%.

In the optional [x](# "X axis") and [y](# "Y axis") parameters, you can pass, respectively, the x- and y-axis coordinates for the center point. If you do not pass these parameters, the center point is determined based on the "x", "y", "width" and "height" attributes of the object (if any). If this type of transformation is applied to an object that does not have these attributes, and the optional [x](# "X axis") and [y](# "Y axis") parameters are omitted, an empty string is returned.
