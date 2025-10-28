# SVG_Color_RGB_from_CMYK

>**SVG_Color_RGB_from_CMYK** ( *cyan* ; *magenta* ; *yellow* ; *black* {; *format*} ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| cyan | Longint | &#8594; | Cyan value |
| magenta | Longint | &#8594; | Magenta value |
| yellow | Longint | &#8594; | Yellow value |
| black | Longint | &#8594; | Black value |
| format | Longint | &#8594; | Color format |
| Function result | Text | &#8592; | Color string |



#### Description 

The SVG\_Color\_RGB\_from\_CMYK command returns a string expressing the color corresponding to the four color parameters, *cyan*, *magenta*, *yellow* and *black*, passed as arguments. The string returned is in the form "RGB(red,greeen,blue)" by default, the syntax recognized by SVG rendering engines.

*cyan*, *magenta*, *yellow* and *black* are longints included between 0 and 100%. 

The optional *format* parameter is used to specify the desired format for the color string returned. The values are:  

| **Value**   | **Format**      |
| ----------- | --------------- |
| 1 (default) | rgb(r,g,b)      |
| 2           | #rgb            |
| 3           | #rrggbb         |
| 4           | rgb(r%, g%, b%) |
