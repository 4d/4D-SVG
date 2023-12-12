<!-- nodeReference := SVG_New_polygon ( parentReference ; path ; strokeColor ; fillColor ; strokeWidth )
 -> parentReference (Text)
 -> path (Text)
 -> strokeColor (Text)
 -> fillColor (Text)
 -> strokeWidth (Real)
 <- nodeReference (Text)-->
# SVG_New_polygon

> SVG_New_polygon ( parentSVGObject {; points {; foregroundColor {; backgroundColor {; strokeWidth}}}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| points |     | String |     | ➡️ |     | Path |     |
| foregroundColor |     | String |     | ➡️ |     | Color or gradient name |     |
| backgroundColor |     | String |     | ➡️ |     | Color or gradient name |     |
| strokeWidth |     | Real |     | ➡️ |     | Line thickness |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of polygon |     |

## Description

The SVG_New_polygon command creates a new closed form in the SVG container designated by [parentSVGObject](## "Reference of parent element") and returns its reference. If [parentSVGObject](## "Reference of parent element") is not a valid reference, an error is generated.

The optional [points](## "Path") parameter can be used to pass thepath points of the polygon as expected by the SVG standard. If this parameter is omitted or empty, the points may be set using the [SVG_ADD_POINT](SVG_ADD_POINT.md)  command.

The optional [foregroundColor](## "Color or gradient name") and [backgroundColor](## "Color or gradient name") parameters contain, respectively, the name of the line color and of the background color. (For more information about colors, please refer to the ”Colors and gradients” section).

The optional [strokeWidth](## "Line thickness") parameter contains the size of the pen expressed in pixels. Its default value is 1.

## See also

[SVG_New_polygon_by_arrays](SVG_New_polygon_by_arrays.md)  
[SVG_New_rect](SVG_New_rect.md)  
[SVG_New_regular_polygon](SVG_New_regular_polygon.md)
