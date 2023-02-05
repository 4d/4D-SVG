<!-- <span style="font-family:sans-serif;color:gray;"><span style="font-family:sans-serif;color:gray;font-weight:bold;font-style:italic">SVG_SET_SATURATION</span> ( svObject ; saturation )
 -&gt; svObject (Text)
 -&gt; saturation (Long Integer)</span>-->
# SVG_SET_SATURATION

> SVG_SET_SATURATION ( svgObject ; saturation )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | SVG object reference |     |
| saturation |     | Longint |     | ➡️ |     | Saturation value |     |

## Description

The **SVG_SET_SATURATION** method sets a saturation value for the SVG element designated by the [svgObject](# "SVG object reference") parameter. [svgObject](# "SVG object reference") must be an SVG container (svg, group, symbol, pattern, marker, etc.) or an image; otherwise, an error is returned.

In the [saturation](# "Saturation value") parameter, you pass a value between 0 and 100

## See also

[SVG_SET_HUE](SVG_SET_HUE.md)
