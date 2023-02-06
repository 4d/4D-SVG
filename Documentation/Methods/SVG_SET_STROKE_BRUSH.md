<!-- SVG_SET_STROKE_BRUSH ( objectID ; color ; opacity )
 -> objectID (Text)
 -> color (Text)
 -> opacity (Long Integer)-->
# SVG_SET_STROKE_BRUSH

> SVG_SET_STROKE_BRUSH ( svgObject ; color )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| color |     | String |     | ➡️ |     | Color expression |     |

## Description

The SVG_SET_STROKE_BRUSH command can be used to set the color used for the lines of the SVG object having the [svgObject](## "Reference of SVG element") reference. If this attribute already exists, its value is replaced by the value passed in the parameter.

For more information about colors, please refer to the “[SVG Colors](../SVG%20Colors.md)” section.

### Example  

```4d
 $svg:=SVG_New   
 $object:=SVG_New_rect ($svg;10;10;200;200;0;0;"black";"white";2)  
 SVG_SET_STROKE_BRUSH ($object;"red")
```

## See also

[SVG Colors](../SVG%20Colors.md)  
[SVG_GET_DEFAULT_BRUSHES](SVG_GET_DEFAULT_BRUSHES.md)  
[SVG_SET_FILL_BRUSH](SVG_SET_FILL_BRUSH.md)
