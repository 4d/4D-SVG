<!-- SVG_SET_VIEWBOX ( objectID ; x ; y ; width ; height ; preserveAspectRatio )
 -> objectID (Text)
 -> x (Real)
 -> y (Real)
 -> width (Real)
 -> height (Real)
 -> preserveAspectRatio (Text)-->
# SVG_SET_VIEWBOX

> SVG_SET_VIEWBOX ( svgObject ; x ; y ; width ; height {; mode} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| x   |     | Real |     | ➡️ |     | X position of viewbox |     |
| y   |     | Real |     | ➡️ |     | Y position of viewbox |     |
| width |     | Real |     | ➡️ |     | Width of viewbox |     |
| height |     | Real |     | ➡️ |     | Height of viewbox |     |
| mode |     | Text |     | ➡️ |     | Adjustment to viewbox |     |

## Description

The SVG_SET_VIEWBOX command can be used to specify the viewbox of the SVG object having the [svgObject](# "Reference of SVG element") reference. If this attribute already exists, its value is replaced by the value passed in the parameter.

The values are expected in the user coordinate system.

The optional [mode](# "Adjustment to viewbox") parameter can be used to indicate if the graphic must be fitted, and how so, to the size of the viewbox. The value expected for [mode](# "Adjustment to viewbox") must be one recognized by SVG: ‘none’, ‘xMinYMin’, ‘xMidYMin’, ‘xMaxYMin’, ‘xMinYMid’, ‘xMidYMid’, ‘xMaxYMid’, ‘xMinYMax’, ‘xMidYMax’, ‘xMaxYMax’ and ‘true’ (for xMidYMid).

### Example  

Create an SVG document of 4x8cm  

```4d
 $svg:=SVG_New
 SVG_SET_DIMENSIONS ($SVG;4;8;"cm")  

```

Declare the user coordinate system here as 1 cm = 250 user points

```4d
 SVG_SET_VIEWBOX ($svg;0;0;1000;2000;"true")
```

## See also

[SVG_SET_VIEWPORT_FILL](SVG_SET_VIEWPORT_FILL.md)
