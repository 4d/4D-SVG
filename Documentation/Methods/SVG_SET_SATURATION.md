# SVG_SET_SATURATION

>**SVG_SET_SATURATION** ( *svgObject* ; *saturation* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#x1F852; | SVG object reference |
| saturation | Longint | &#x1F852; | Saturation value |



#### Description 

The **SVG\_SET\_SATURATION** method sets a saturation value for the SVG element designated by the *svgObject* parameter. *svgObject* must be an SVG container (svg, group, symbol, pattern, marker, etc.) or an image; otherwise, an error is returned.

In the *saturation* parameter, you pass a value between 0 and 100

#### See also 

[SVG\_SET\_HUE](SVG%5FSET%5FHUE.md)  