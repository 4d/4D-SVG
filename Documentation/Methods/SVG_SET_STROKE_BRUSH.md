# SVG_SET_STROKE_BRUSH

>**SVG_SET_STROKE_BRUSH** ( *svgObject* ; *color* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | Reference of SVG element |
| color | String | &#8594; | Color expression |



#### Description 

The SVG\_SET\_STROKE\_BRUSH command can be used to set the color used for the lines of the SVG object having the *svgObject* reference. If this attribute already exists, its value is replaced by the value passed in the parameter.

For more information about colors, please refer to the “*SVG Colors*” section.

#### Example 

```4d
 $svg:=SVG_New
 $object:=SVG_New_rect($svg;10;10;200;200;0;0;"black";"white";2)
 SVG_SET_STROKE_BRUSH($object;"red")
```

#### See also 

[SVG Colors](../SVG%20Colors.md)  
[SVG\_GET\_DEFAULT\_BRUSHES](SVG_GET_DEFAULT_BRUSHES.md)  
[SVG\_SET\_FILL\_BRUSH](SVG_SET_FILL_BRUSH.md)  