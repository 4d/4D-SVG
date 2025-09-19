# SVG_SET_SHAPE_RENDERING

>**SVG_SET_SHAPE_RENDERING** ( *svgObject* ; *rendering* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | Reference of SVG element |
| rendering | Text | &#8594; | Type of rendering |



#### Description 

The SVG\_SET\_SHAPE\_RENDERING command can be used to set which tradeoffs should be made regarding the rendering of graphic elements for the object designated by *svgObject*. If *svgObject* is not an SVG object, an error is generated. 

The *rendering* parameter must contain one of the following values: "auto", "optimizeSpeed", "crispEdges", "geometricPrecision" or "inherit". Otherwise, an error is generated. 

**See Also:** *http://www.w3.org/TR/2001/REC-SVG-20010904/painting.html#ShapeRenderingProperty*
