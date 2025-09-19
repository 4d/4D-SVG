# SVG_SET_TRANSFORM_TRANSLATE

>**SVG_SET_TRANSFORM_TRANSLATE** ( *svgObject* ; *x* {; *y*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | Reference of SVG element |
| x | Longint | &#8594; | Coordinate on X axis |
| y | Longint | &#8594; | Coordinate on Y axis |



#### Description 

The SVG\_SET\_TRANSFORM\_TRANSLATE command specifies a horizontal and/or vertical relocation of the SVG object having the *svgObject* reference.

If the *x* value is not null, the object will be moved horizontally for the number of units passed; otherwise, it will be ignored.  
If the *y* parameter is provided, the object will be moved vertically for the number of units passed.

#### Example 

![](../images/pict194400.en.png)

```4d
 svgRef:=SVG_New
  //Draw a red rectangle
 $Object:=SVG_New_rect(svgRef;0;0;200;100;0;0;"black";"red")
  //Draw a square at 0,0
 $Object:=SVG_New_rect(svgRef;0;0;20;20)
  //Move the square to 150,50
 SVG_SET_TRANSFORM_TRANSLATE($Object;150;50)
```

#### See also 

[SVG\_SET\_TRANSFORM\_ROTATE](SVG%5FSET%5FTRANSFORM%5FROTATE.md)  