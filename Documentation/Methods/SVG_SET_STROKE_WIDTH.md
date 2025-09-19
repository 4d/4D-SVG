# SVG_SET_STROKE_WIDTH

>**SVG_SET_STROKE_WIDTH** ( *svgObject* ; *strokeWidth* {; *unit*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | Reference of SVG element |
| strokeWidth | Real | &#8594; | Line thickness |
| unit | String | &#8594; | Unit of measurement |



#### Description 

The SVG\_SET\_STROKE\_WIDTH command can be used to set the thickness of lines for the SVG object having the *svgObject* reference. If this attribute already exists, its value is replaced by the value passed in the parameter.

Pass the value of the line thickness in *strokeWidth*. The optional *unit* parameter can be used to specify the unit to be used. You can pass one of the following values: px, pt, pc, cm, mm, in, em, ex or %. If the *unit* parameter is omitted, the*strokeWidth* parameter is expected in the user coordinate system

#### Example 

```4d
 $svg :=SVG_New
 SVG_SET_STROKE_WIDTH(SVG_New_rect($svg;10;10;200;200;0;0;"black";"white";2);10)
```

#### See also 

[SVG\_SET\_STROKE\_BRUSH](SVG_SET_STROKE_BRUSH.md)  