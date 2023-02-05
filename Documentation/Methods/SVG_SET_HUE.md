<!-- <span style="font-family:sans-serif;color:gray;"><span style="font-family:sans-serif;color:gray;font-weight:bold;font-style:italic">SVG_SET_HUE</span> ( svgObject ; hue )
 -&gt; svgObject (Text)
 -&gt; hue (Long Integer)</span>-->
# SVG_SET_HUE

> SVG_SET_HUE ( svgObject ; hue )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | SVG object reference |     |
| hue |     | Longint |     | ➡️ |     | Hue value |     |

## Description

The **SVG_SET_HUE** method sets a hue value for the SVG object designated by the [svgObject](# "SVG object reference") parameter. [svgObject](# "SVG object reference") must be an SVG container (svg, group, symbol, pattern, marker, etc.) or an image; otherwise, an error is returned.

In the [hue](# "Hue value") parameter, you pass a value between 0 and 360.

## See also

[SVG_SET_SATURATION](SVG_SET_SATURATION.md)
