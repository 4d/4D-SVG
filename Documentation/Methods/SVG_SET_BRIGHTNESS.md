# SVG_SET_BRIGHTNESS

>**SVG_SET_BRIGHTNESS** ( *svgObject* ; *brightness* {; *brightness2* ; *brightness3*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | SVG object reference |
| brightness | Real | &#8594; | Values between 0 and 1 to darken; > 1 to brighten, applied globally or only to red component |
| brightness2 | Real | &#8594; | Brightness value for green component |
| brightness3 | Real | &#8594; | Brightness value for blue component |



#### Description 

The **SVG\_SET\_BRIGHTNESS** command sets the brightness for an SVG image or container whose reference is passed in the *svgObject* parameter.

In the *brightness* parameter, you pass either a value between 0 and 1 to darken the brightness, or a value greater than 1 to brighten it. When you pass a single *brightness* parameter, the brightness factor is applied globally to the object. 

Alternatively, you can pass two additional (optional) *brightness2* and *brightness3* parameters, in which case each brightness value is applied to a separate part of the color component, i.e. *brightness* is applied to the "R" (red) part, *brightness2* is applied to the "G" (green) part and *brightness3* is applied to the "B" (blue) part.
