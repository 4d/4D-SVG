# SVG_Color_RGB_from_HLS

>**SVG_Color_RGB_from_HLS** ( *hue* ; *luminosity* ; *saturation* {; *format*} )  -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| hue | Longint | &#x1F852; | Hue value |
| luminosity | Longint | &#x1F852; | Luminosity value |
| saturation | Longint | &#x1F852; | Saturation value |
| format | Longint | &#x1F852; | Color format |
| Function result | Text | &#x1F850; | Color string |



#### Description 

The SVG\_Color\_RGB\_from\_HLS command returns a string expressing the color corresponding to the *hue*, *luminosity* and *saturation* parameters passed as arguments. The string returned is in the form "RGB(red,green,blue)" by default, the syntax recognized by SVG rendering engines.

*hue* is a longint included between 0 and 360°. 

*luminosity* and *saturation* are longints included between 0 and 100%.

The optional *format* parameter is used to specify the desired format for the color string returned. The values are:  

| **Value**   | **Format**      |
| ----------- | --------------- |
| 1 (default) | rgb(r,g,b)      |
| 2           | #rgb            |
| 3           | #rrggbb         |
| 4           | rgb(r%, g%, b%) |
