<!-- <span style="font-family:sans-serif;color:gray;"><span style="font-family:sans-serif;color:gray;font-weight:bold;font-style:italic">SVG_SET_BRIGHTNESS</span> ( svgObject ; Param_2 ; … ; N )
 -&gt; svgObject (Text)
 -&gt; Param_2 ; … ; N (Real)</span>-->
# SVG_SET_BRIGHTNESS

> SVG_SET_BRIGHTNESS ( svgObject ; brightness {; brightness2 ; brightness3} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | SVG object reference |     |
| brightness |     | Real |     | ➡️ |     | Values between 0 and 1 to darken; > 1 to brighten, applied globally or only to red component |     |
| brightness2 |     | Real |     | ➡️ |     | Brightness value for green component |     |
| brightness3 |     | Real |     | ➡️ |     | Brightness value for blue component |     |

## Description

The **SVG_SET_BRIGHTNESS** command sets the brightness for an SVG image or container whose reference is passed in the [svgObject](# "SVG object reference") parameter.

In the [brightness](# "Values between 0 and 1 to darken; > 1 to brighten, applied globally or only to red component") parameter, you pass either a value between 0 and 1 to darken the brightness, or a value greater than 1 to brighten it. When you pass a single [brightness](# "Values between 0 and 1 to darken; > 1 to brighten, applied globally or only to red component") parameter, the brightness factor is applied globally to the object.

Alternatively, you can pass two additional (optional) [brightness2](# "Brightness value for green component") and [brightness3](# "Brightness value for blue component") parameters, in which case each brightness value is applied to a separate part of the color component, i.e. [brightness](# "Values between 0 and 1 to darken; > 1 to brighten, applied globally or only to red component") is applied to the "R" (red) part, [brightness2](# "Brightness value for green component") is applied to the "G" (green) part and [brightness3](# "Brightness value for blue component") is applied to the "B" (blue) part.
