<!-- color := SVG_Color_RGB_from_CMYK ( C ; M ; Y ; K ; type )
 -> C (Long Integer) -  0 - 100%
 -> M (Long Integer) -  0 - 100%
 -> Y (Long Integer) -  0 - 100%
 -> K (Long Integer) -  0 - 100%
 -> type (Long Integer) - {format} [1 (default) rgb(r,g,b); 2 #rgb; 3 #rrggbb; 4 rgb(r%, g%, b%)]
 <- color (Text)-->
# SVG_Color_RGB_from_CMYK

> SVG_Color_RGB_from_CMYK ( cyan ; magenta ; yellow ; black {; format} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| cyan |     | Longint |     | ➡️ |     | Cyan value |     |
| magenta |     | Longint |     | ➡️ |     | Magenta value |     |
| yellow |     | Longint |     | ➡️ |     | Yellow value |     |
| black |     | Longint |     | ➡️ |     | Black value |     |
| format |     | Longint |     | ➡️ |     | Color format |     |
| Function result |     | Text |     | ↩️ |     | Color string |     |

## Description

The SVG_Color_RGB_from_CMYK command returns a string expressing the color corresponding to the four color parameters, [cyan](# "Cyan value"), [magenta](# "Magenta value"), [yellow](# "Yellow value") and [black](# "Black value"), passed as arguments. The string returned is in the form "RGB(red,greeen,blue)" by default, the syntax recognized by SVG rendering engines.

[cyan](# "Cyan value"), [magenta](# "Magenta value"), [yellow](# "Yellow value") and [black](# "Black value") are longints included between 0 and 100%.

The optional [format](# "Color format") parameter is used to specify the desired format for the color string returned. The values are:  

|     |
| --- | --- |
| **Value** | **Format** |
| 1 (default) | rgb(r,g,b) |
| 2   | #rgb |
| 3   | #rrggbb |
| 4   | rgb(r%, g%, b%) |
