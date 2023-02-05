<!-- SVG_SET_TRANSFORM_SCALE ( objectID ; sx ; sy )
 -> objectID (Text)
 -> sx (Real)
 -> sy (Real)-->
# SVG_SET_TRANSFORM_SCALE

> SVG_SET_TRANSFORM_SCALE ( svgObject ; scaleX {; scaleY} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| scaleX |     | Real |     | ➡️ |     | Value on X axis |     |
| scaleY |     | Real |     | ➡️ |     | Value on Y axis |     |

## Description

The SVG_SET_TRANSFORM_SCALE command applies a change of horizontal andHome.mdor vertical scale to an SVG object having the [svgObject](# "Reference of SVG element") reference.

If the [scaleX](# "Value on X axis") value is not null, the object is enlarged (value >1) or reduced (0 < value < 1) horizontally for the number of units passed. The value 1 is equal to no change to the object scale.

If the [scaleY](# "Value on Y axis") parameter is provided, the object is enlarged (value >1) or reduced (0 < value < 1) vertically for the number of units passed. The value 1 is equal to no change to the object scale. If this parameter is omitted, its value is supposed to be equal to [scaleX](# "Value on X axis").

### Example  

![](..Home.md..Home.mdpictureHome.md194342Home.mdpict194342.en.png)

```4d

```4d
 $SVG:=SVG_New   
 $Text:=SVG_New_text ($SVG;"Hello world!";5)  
 [SVG_SET_TRANSFORM_SCALE](SVG_SET_TRANSFORM_SCALE.md) ($Text;3;12) 
```

Zoom x*3 y*12

```

```4d


  
  

## See also 

[SVG_SET_TRANSFORM_MATRIX](SVG_SET_TRANSFORM_MATRIX.md)
