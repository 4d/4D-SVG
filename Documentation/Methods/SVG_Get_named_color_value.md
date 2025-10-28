# SVG_Get_named_color_value

>**SVG_Get_named_color_value** ( *colorName* {; *rgbComponent*} ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| colorName | Text | &#8594; | SVG color name |
| rgbComponent | Text | &#8594; | "R", "G" or "B" to indicate color component |
| Function result | Longint | &#8592; | Returns color value |



#### Description 

The **SVG\_Get\_named\_color\_value** command returns the value of the SVG color whose name is specified in the *colorName* parameter.

In the optional *rgbComponent* parameter, you can pass either "R" (red), "G" (green) or "B" (blue) to indicate the specific color component for which you want to get the value. If you do not pass this parameter, the command returns the (complete) long color value.
