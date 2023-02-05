<!-- SVG_SET_TEXT_RENDERING ( svgObject ; rendering )
 -> svgObject (Text)
 -> rendering (Text)-->
# SVG_SET_TEXT_RENDERING

> SVG_SET_TEXT_RENDERING ( svgObject ; rendering )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of text element |     |
| rendering |     | Text |     | ➡️ |     | Value of rendering |     |

## Description

The SVG_SET_TEXT_RENDERING command is used to define the tradeoffs to make regarding the rendering of text for the text object designated by [svgObject](# "Reference of text element"). If [svgObject](# "Reference of text element") is not an SVG text object, an error is generated.

The [rendering](# "Value of rendering") parameter can have one of the following values: "auto", "optimizeSpeed", "optimizeLegibility", "geometricPrecision" or "inherit". Otherwise, an error is generated.

**See Also:** [www.w3.orgHome.mdTRHome.md2001Home.mdREC-SVG-20010904Home.mdpainting.html#TextRenderingProperty](www.w3.orgHome.mdTRHome.md2001Home.mdREC-SVG-20010904Home.mdpainting.html#TextRenderingProperty)
