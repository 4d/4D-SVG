# SVG_SET_TEXT_RENDERING

>**SVG_SET_TEXT_RENDERING** ( *svgObject* ; *rendering* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | Reference of text element |
| rendering | Text | &#8594; | Value of rendering |



#### Description 

The SVG\_SET\_TEXT\_RENDERING command is used to define the tradeoffs to make regarding the rendering of text for the text object designated by *svgObject*. If *svgObject* is not an SVG text object, an error is generated. 

The *rendering* parameter can have one of the following values: "auto", "optimizeSpeed", "optimizeLegibility", "geometricPrecision" or "inherit". Otherwise, an error is generated.

**See Also:** *http://www.w3.org/TR/2001/REC-SVG-20010904/painting.html#TextRenderingProperty*
