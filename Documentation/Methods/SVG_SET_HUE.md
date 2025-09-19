# SVG_SET_HUE

>**SVG_SET_HUE** ( *svgObject* ; *hue* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | SVG object reference |
| hue | Longint | &#8594; | Hue value |



#### Description 

The **SVG\_SET\_HUE** method sets a hue value for the SVG object designated by the *svgObject* parameter. *svgObject* must be an SVG container (svg, group, symbol, pattern, marker, etc.) or an image; otherwise, an error is returned.

In the *hue* parameter, you pass a value between 0 and 360.

#### See also 

[SVG\_SET\_SATURATION](SVG_SET_SATURATION.md)  