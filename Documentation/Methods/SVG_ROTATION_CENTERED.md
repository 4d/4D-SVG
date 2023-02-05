<!-- SVG_ROTATION_CENTERED ( svgObject ; angle )
 -> svgObject (Text)
 -> angle (Real)-->
# SVG_ROTATION_CENTERED

> SVG_ROTATION_CENTERED ( svgObject ; angle )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | SVG object reference |     |
| angle |     | Real |     | ➡️ |     | Angle of rotation |     |

## Description

The **SVG_ROTATION_CENTERED** command performs a centered rotation for the SVG object whose reference is passed in the [svgObject](# "SVG object reference") parameter. This type of rotation can only be applied to objects having _x_, _y_, _width_ and _height_ attributes.

In the [angle](# "Angle of rotation") parameter, you pass the angle of rotation to be performed.
