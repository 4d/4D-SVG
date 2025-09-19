# SVG_Color_grey

>**SVG_Color_grey** ( *percentage* ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| percentage | Integer | &#x1F852; | Intensity of gray |
| Function result | String | &#x1F850; | Color string |



#### Description 

The SVG\_Color\_grey command returns a string expressing a gray color having a *percentage* intensity. The string returned is in "RGB(red, green, blue)" form where the 3 values are equal, the syntax recognized by SVG rendering engines.

#### Example 

```4d
 $txtColor:=SVG_Color_grey(60)
  //$txtColor is "rgb(102,102,102)"
```

#### See also 

[SVG\_Color\_RGB\_from\_long](SVG%5FColor%5FRGB%5Ffrom%5Flong.md)  