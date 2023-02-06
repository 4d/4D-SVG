<!-- Text := SVG_Color_grey ( Grey )
-> Grey (Long Integer) - 0 -> 100-->
# SVG_Color_grey

> SVG_Color_grey ( percentage ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| percentage |     | Integer |     | ➡️ |     | Intensity of gray |     |
| Function result |     | String |     | ↩️ |     | Color string |     |

## Description

The SVG_Color_grey command returns a string expressing a gray color having a [percentage](# "Intensity of gray") intensity. The string returned is in "RGB(red, green, blue)" form where the 3 values are equal, the syntax recognized by SVG rendering engines.

### Example  

```4d
 $txtColor:=SVG_Color_grey (60) 
```

$txtColor is "rgb(102,102,102)"

## See also

[SVG_Color_RGB_from_long](SVG_Color_RGB_from_long.md)
