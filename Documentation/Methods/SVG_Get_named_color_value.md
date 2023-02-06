<!-- color := SVG_Get_named_color_value ( colorName ; what )
 -> colorName (Text) -  svg color name
 -> what (Text) - {what value} "r" or "g" or "v" or "b" for the color component, else long color
 <- color (Long Integer)-->
# SVG_Get_named_color_value

> SVG_Get_named_color_value ( colorName {; rgbComponent} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| colorName |     | Text |     | ➡️ |     | SVG color name |     |
| rgbComponent |     | Text |     | ➡️ |     | "R", "G" or "B" to indicate color component |     |
| Function result |     | Longint |     | ↩️ |     | Returns color value |     |

## Description

The **SVG_Get_named_color_value** command returns the value of the SVG color whose name is specified in the [colorName](## "SVG color name") parameter.

In the optional [rgbComponent](## ""R", "G" or "B" to indicate color component") parameter, you can pass either "R" (red), "G" (green) or "B" (blue) to indicate the specific color component for which you want to get the value. If you do not pass this parameter, the command returns the (complete) long color value.
