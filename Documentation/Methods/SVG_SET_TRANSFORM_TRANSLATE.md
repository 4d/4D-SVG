<!-- SVG_SET_TRANSFORM_TRANSLATE ( objectID ; Param_2 ; Param_3 )
 -> objectID (Text)
 -> Param_2 (Real)
 -> Param_3 (Real)-->
# SVG_SET_TRANSFORM_TRANSLATE

> SVG_SET_TRANSFORM_TRANSLATE ( svgObject ; x {; y} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| x   |     | Longint |     | ➡️ |     | Coordinate on X axis |     |
| y   |     | Longint |     | ➡️ |     | Coordinate on Y axis |     |

## Description

The SVG_SET_TRANSFORM_TRANSLATE command specifies a horizontal and/or vertical relocation of the SVG object having the [svgObject](# "Reference of SVG element") reference.

If the [x](# "Coordinate on X axis") value is not null, the object will be moved horizontally for the number of units passed; otherwise, it will be ignored.  
If the [y](# "Coordinate on Y axis") parameter is provided, the object will be moved vertically for the number of units passed.

### Example  

![](https://doc.4d.com/4Dv19/picture/194400/pict194400.en.png)

```4d
 svgRef:=SVG_New  
```

Draw a red rectangle  

```4d
 $Object:=SVG_New_rect (svgRef;0;0;200;100;0;0;"black";"red")  
  
```

Draw a square at 0,0  

```4d
 $Object:=SVG_New_rect (svgRef;0;0;20;20)  
  
```

Move the square to 150,50  

```4d
SVG_SET_TRANSFORM_TRANSLATE($Object;150;50)

```

## See also

[SVG_SET_TRANSFORM_ROTATE](SVG_SET_TRANSFORM_ROTATE.md)
