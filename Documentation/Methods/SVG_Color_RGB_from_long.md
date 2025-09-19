# SVG_Color_RGB_from_long

>**SVG_Color_RGB_from_long** ( *color* {; *format*} ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| color | Longint | &#8594; | Value of color |
| format | Integer | &#8594; | Format of color |
| Function result | String | &#8592; | Color string |



#### Description 

The SVG\_Color\_RGB\_from\_long command returns a string expressing the *color* color passed as an argument. The string returned is in "RGB(red, green, blue)" form, the syntax recognized by SVG rendering engines.

The *color* parameter is a 4-byte longint whose format (0x00RRGGBB) is described below (the bytes are numbered from 0 to 3, from right to left):

| **Byte** | **Description**                       |
| -------- | ------------------------------------- |
| 2        | Red component of the color (0..255)   |
| 1        | Green component of the color (0..255) |
| 0        | Blue component of the color (0..255)  |

The optional *format* parameter can be used to specify the desired format for the color string returned. The values are:

| **Value**   | **Format**      |
| ----------- | --------------- |
| 1 (default) | rgb(r,g,b)      |
| 2           | #rgb            |
| 3           | #rrggbb         |
| 4           | rgb(r%, g%, b%) |

#### Example 

```4d
 $txtColor:=SVG_Color_RGB_from_long($color)
  //$txtColor is "rgb(255,128,0)" if $color is 16744448 (orange)
```

#### See also 

[SVG\_Color\_from\_index](SVG_Color_from_index.md)  
[SVG\_Color\_grey](SVG_Color_grey.md)  