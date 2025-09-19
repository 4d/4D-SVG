# SVG_SET_FILL_BRUSH

>**SVG_SET_FILL_BRUSH** ( *svgObject* ; *color* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#x1F852; | Reference of SVG element |
| color | String | &#x1F852; | Color expression |



#### Description 

The SVG\_SET\_FILL\_BRUSH command can be used to set the fill color for the SVG object having the *svgObject* reference. If this attribute already exists, its value is replaced by the value passed in the parameter.

For more information about colors, please refer to the “*SVG Colors*” section.

#### Example 

```4d
 $svg:=SVG_New
 $object:=SVG_New_rect($svg;10;10;200;200;0;0;"black";"white";2)
 SVG_SET_FILL_BRUSH($object;"blue")
```

#### See also 

[SVG Colors](../SVG%20Colors.md)   
[SVG\_SET\_STROKE\_BRUSH](SVG%5FSET%5FSTROKE%5FBRUSH.md)  