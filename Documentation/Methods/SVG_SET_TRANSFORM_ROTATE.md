<!-- SVG_SET_TRANSFORM_ROTATE ( target ; angle ; cx ; cy )
 -> target (Text)
 -> angle (Real)
 -> cx (Real)
 -> cy (Real)-->
# SVG_SET_TRANSFORM_ROTATE

> SVG_SET_TRANSFORM_ROTATE ( svgObject ; angle {; x ; y} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| angle |     | Longint |     | ➡️ |     | Angle of rotation |     |
| x   |     | Longint |     | ➡️ |     | Coordinate on X axis of center of rotation |     |
| y   |     | Longint |     | ➡️ |     | Coordinate on Y axis of center of rotation |     |

## Description

The SVG_SET_TRANSFORM_ROTATE command applies a rotation of the value angle in degrees to the SVG object having the objectRef reference.  
The [angle](## "Angle of rotation") of rotation is expected in degrees; the rotation is made clockwise.

If the optional [x](## "Coordinate on X axis of center of rotation") and [y](## "Coordinate on Y axis of center of rotation") parameters are not passed, the rotation is carried out with respect to the origin of the current user coordinate system.If these parameters are provided, the rotation is carried out with respect to the coordinates passed ([x](## "Coordinate on X axis of center of rotation"), [y](## "Coordinate on Y axis of center of rotation")).

### Example  

![](https://doc.4d.com/4Dv19/picture/194306/pict194306.en.png)

```4d
 svgRef:=SVG_New   
```

Draw a red rectangle with a blue border

```4d
 $rec:=SVG_New_rect ($svg;150;50;200;400;0;0;"blue";"red";10)  
```

Apply a rotation of 10° clockwise with respect to the center  

```4d
 SVG_SET_TRANSFORM_ROTATE ($rec;370;175;225)
```

## See also

[SVG_SET_TRANSFORM_FLIP](SVG_SET_TRANSFORM_FLIP.md)
