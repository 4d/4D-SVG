<!-- SVG_SET_STROKE_WIDTH ( objectID ; strokeWidth ; unit )
 -> objectID (Text)
 -> strokeWidth (Real)
 -> unit (Text)-->
# SVG_SET_STROKE_WIDTH

> SVG_SET_STROKE_WIDTH ( svgObject ; strokeWidth {; unit} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| strokeWidth |     | Real |     | ➡️ |     | Line thickness |     |
| unit |     | String |     | ➡️ |     | Unit of measurement |     |

## Description

The SVG_SET_STROKE_WIDTH command can be used to set the thickness of lines for the SVG object having the [svgObject](# "Reference of SVG element") reference. If this attribute already exists, its value is replaced by the value passed in the parameter.

Pass the value of the line thickness in [strokeWidth](# "Line thickness"). The optional [unit](# "Unit of measurement") parameter can be used to specify the unit to be used. You can pass one of the following values: px, pt, pc, cm, mm, in, em, ex or %. If the [unit](# "Unit of measurement") parameter is omitted, the[strokeWidth](# "Line thickness") parameter is expected in the user coordinate system

### Example  

```4d
 $svg :=SVG_New   
 SVG_SET_STROKE_WIDTH](SVG_SET_STROKE_WIDTH.md)([SVG_New_rect](SVG_SET_STROKE_WIDTH ($svg;10;10;200;200;0;0;"black";"white";2);10)
```

## See also

[SVG_SET_STROKE_BRUSH](SVG_SET_STROKE_BRUSH.md)
