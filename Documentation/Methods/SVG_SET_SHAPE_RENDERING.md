<!-- SVG_SET_SHAPE_RENDERING ( object ; rendering )
 -> object (Text)
 -> rendering (Text)-->
# SVG_SET_SHAPE_RENDERING

> SVG_SET_SHAPE_RENDERING ( svgObject ; rendering )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| rendering |     | Text |     | ➡️ |     | Type of rendering |     |

## Description

The SVG_SET_SHAPE_RENDERING command can be used to set which tradeoffs should be made regarding the rendering of graphic elements for the object designated by [svgObject](# "Reference of SVG element"). If [svgObject](# "Reference of SVG element") is not an SVG object, an error is generated.

The [rendering](# "Type of rendering") parameter must contain one of the following values: "auto", "optimizeSpeed", "crispEdges", "geometricPrecision" or "inherit". Otherwise, an error is generated.

**See Also:** [www.w3.orgHome.mdTRHome.md2001Home.mdREC-SVG-20010904Home.mdpainting.html#ShapeRenderingProperty](www.w3.orgHome.mdTRHome.md2001Home.mdREC-SVG-20010904Home.mdpainting.html#ShapeRenderingProperty)[](www.yoyodesign.orgHome.mddocHome.mdw3cHome.mdsvg1Home.mdpainting.html#ShapeRenderingProperty)
