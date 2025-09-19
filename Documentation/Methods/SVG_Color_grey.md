# SVG_Color_grey

>**SVG_Color_grey** ( *percentage* ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| percentage | Integer | &#8594; | Intensity of gray |
| Function result | String | &#8592; | Color string |



#### Description 

The SVG\_Color\_grey command returns a string expressing a gray color having a *percentage* intensity. The string returned is in "RGB(red, green, blue)" form where the 3 values are equal, the syntax recognized by SVG rendering engines.

#### Example 

```4d
 $txtColor:=SVG_Color_grey(60)
  //$txtColor is "rgb(102,102,102)"
```

#### See also 

[SVG\_Color\_RGB\_from\_long](SVG_Color_RGB_from_long.md)  