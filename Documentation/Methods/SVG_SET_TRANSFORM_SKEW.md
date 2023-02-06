<!-- SVG_SET_TRANSFORM_SKEW ( objectID ; angleVertical ; angleHorizontal )
 -> objectID (Text)
 -> angleVertical (Real)
 -> angleHorizontal (Real)-->
# SVG_SET_TRANSFORM_SKEW

> SVG_SET_TRANSFORM_SKEW ( svgObject ; horizontal {; vertical} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| horizontal |     | Longint |     | ➡️ |     | Value of incline along X axis |     |
| vertical |     | Longint |     | ➡️ |     | Value of incline along Y axis |     |

## Description

The SVG_SET_TRANSFORM_SKEW command specifies a horizontal and/or vertical incline for the SVG object having the [svgObject](# "Reference of SVG element") reference.

If the value of the [horizontal](# "Value of incline along X axis") parameter is not null, the object will be inclined horizontally according to the number of units passed; otherwise, it is ignored.

If the value of the [vertical](# "Value of incline along Y axis") parameter is not null, the object will be inclined vertically according to the number of units passed.

### Example  

![](https://doc.4d.com/4Dv19/picture/194371/pict194371.en.png)

```4d
 $svg :=SVG_New   
```

Draw a background  

```4d
 SVG_New_rect ($svg;0;0;270;160;10;10;"black";"gray")  
```

Place the text…  

```4d
 $tx:=SVG_New_text ($svg;"Hello world!";100;5;"";48)  
```

in white  

```4d
 SVG_SET_FONT_COLOR ($tx;"white")  
```

Incline it  

```4d
 SVG_SET_TRANSFORM_SKEW ($tx;-50;10) 
```

## See also 

[SVG_SET_TRANSFORM_FLIP](SVG_SET_TRANSFORM_FLIP.md)
