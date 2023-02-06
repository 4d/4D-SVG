<!-- SVG_SET_TRANSFORM_MATRIX ( objectID ; Param_2 ; Param_3 ; Param_4 ; Param_5 ; Param_6 ; Param_7 )
 -> objectID (Text)
 -> Param_2 (Real)
 -> Param_3 (Real)
 -> Param_4 (Real)
 -> Param_5 (Real)
 -> Param_6 (Real)
 -> Param_7 (Real)-->
# SVG_SET_TRANSFORM_MATRIX

> SVG_SET_TRANSFORM_MATRIX ( svgObject ; a ; b {; c ; d {; e ; f}} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| a   |     | Longint |     | ➡️ |     | Element a of transform matrix |     |
| b   |     | Longint |     | ➡️ |     | Element b of transform matrix |     |
| c   |     | Longint |     | ➡️ |     | Element c of transform matrix |     |
| d   |     | Longint |     | ➡️ |     | Element d of transform matrix |     |
| e   |     | Longint |     | ➡️ |     | Element e of transform matrix |     |
| f   |     | Longint |     | ➡️ |     | Element f of transform matrix |     |

## Description

The SVG_SET_TRANSFORM_MATRIX command applies a matrix transformation to the SVG object having the [svgObject](# "Reference of SVG element") reference.

This type of transformation can be used to combine transformations like, for example, a rotation and a translation.

### Example  

![](https://doc.4d.com/4Dv19/picture/194249/pict194249.en.png)

```4d
 SVG_SET_TRANSFORM_MATRIX ($ID;0,707;-0,707;0,707;0,707;255,03;111,21)  
  
```

Is equivalent to applying the 3 following transformations: 
```4d 
 SVG_SET_TRANSFORM_TRANSLATE ($ID;50;90)  
 SVG_SET_TRANSFORM_ROTATE ($ID;-45)  
 SVG_SET_TRANSFORM_TRANSLATE ($ID;130;160)
```

## See also 

[SVG_SET_TRANSFORM_ROTATE](SVG_SET_TRANSFORM_ROTATE.md)
