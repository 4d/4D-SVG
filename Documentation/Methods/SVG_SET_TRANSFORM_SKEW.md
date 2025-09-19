# SVG_SET_TRANSFORM_SKEW

>**SVG_SET_TRANSFORM_SKEW** ( *svgObject* ; *horizontal* {; *vertical*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | Reference of SVG element |
| horizontal | Longint | &#8594; | Value of incline along X axis |
| vertical | Longint | &#8594; | Value of incline along Y axis |



#### Description 

The SVG\_SET\_TRANSFORM\_SKEW command specifies a horizontal and/or vertical incline for the SVG object having the *svgObject* reference.

If the value of the *horizontal* parameter is not null, the object will be inclined horizontally according to the number of units passed; otherwise, it is ignored.

If the value of the *vertical* parameter is not null, the object will be inclined vertically according to the number of units passed.

#### Example 

![](../images/pict194371.en.png)

```4d
 $svg :=SVG_New
  //Draw a background
 SVG_New_rect($svg;0;0;270;160;10;10;"black";"gray")
  //Place the text…
 $tx:=SVG_New_text($svg;"Hello world!";100;5;"";48)
  //in white
 SVG_SET_FONT_COLOR($tx;"white")
  //Incline it
 SVG_SET_TRANSFORM_SKEW($tx;-50;10) //Incline
```

#### See also 

[SVG\_SET\_TRANSFORM\_FLIP](SVG%5FSET%5FTRANSFORM%5FFLIP.md)  