# SVG_SET_VIEWBOX

>**SVG_SET_VIEWBOX** ( *svgObject* ; *x* ; *y* ; *width* ; *height* {; *mode*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#x1F852; | Reference of SVG element |
| x | Real | &#x1F852; | X position of viewbox |
| y | Real | &#x1F852; | Y position of viewbox |
| width | Real | &#x1F852; | Width of viewbox |
| height | Real | &#x1F852; | Height of viewbox |
| mode | Text | &#x1F852; | Adjustment to viewbox |



#### Description 

The SVG\_SET\_VIEWBOX command can be used to specify the viewbox of the SVG object having the *svgObject* reference. If this attribute already exists, its value is replaced by the value passed in the parameter.

The values are expected in the user coordinate system.

The optional *mode* parameter can be used to indicate if the graphic must be fitted, and how so, to the size of the viewbox. The value expected for *mode* must be one recognized by SVG: ‘none’, ‘xMinYMin’, ‘xMidYMin’, ‘xMaxYMin’, ‘xMinYMid’, ‘xMidYMid’, ‘xMaxYMid’, ‘xMinYMax’, ‘xMidYMax’, ‘xMaxYMax’ and ‘true’ (for xMidYMid).

#### Example 

```4d
  //Create an SVG document of 4x8cm
 $svg:=SVG_New
 SVG_SET_DIMENSIONS($SVG;4;8;"cm")
  //Declare the user coordinate system here as 1 cm = 250 user points
 SVG_SET_VIEWBOX($svg;0;0;1000;2000;"true")
```

#### See also 

[SVG\_SET\_VIEWPORT\_FILL](SVG%5FSET%5FVIEWPORT%5FFILL.md)  