<!-- color := SVG_Color_RGB_from_HLS ( hue ; luminosity ; saturation ; type )
 -> hue (Long Integer) - 0 à 360°
 -> luminosity (Long Integer) - 0 à 100%
 -> saturation (Long Integer) - 0 à 100%
 -> type (Long Integer) - {format} [1 (default) rgb(r,g,b); 2 #rgb; 3 #rrggbb; 4 rgb(r%, g%, b%)]
 <- color (Text)-->
# SVG_Color_RGB_from_HLS

> SVG_Color_RGB_from_HLS ( hue ; luminosity ; saturation {; format} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| hue |     | Longint |     | ➡️ |     | Hue value |     |
| luminosity |     | Longint |     | ➡️ |     | Luminosity value |     |
| saturation |     | Longint |     | ➡️ |     | Saturation value |     |
| format |     | Longint |     | ➡️ |     | Color format |     |
| Function result |     | Text |     | ↩️ |     | Color string |     |

## Description

The SVG_Color_RGB_from_HLS command returns a string expressing the color corresponding to the [hue](# "Hue value"), [luminosity](# "Luminosity value") and [saturation](# "Saturation value
") parameters passed as arguments. The string returned is in the form "RGB(red,green,blue)" by default, the syntax recognized by SVG rendering engines.

[hue](# "Hue value") is a longint included between 0 and 360°.

[luminosity](# "Luminosity value") and [saturation](# "Saturation value
") are longints included between 0 and 100%.

The optional [format](# "Color format") parameter is used to specify the desired format for the color string returned. The values are:  

|     |
| --- | --- |
| **Value** | **Format** |
| 1 (default) | rgb(r,g,b) |
| 2   | #rgb |
| 3   | #rrggbb |
| 4   | rgb(r%, g%, b%) |
