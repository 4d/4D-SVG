<!-- nodeReference := SVG_Define_marker ( svgObject ; ID ; x ; y ; width ; height ; orient ; markerUnits )
 -> svgObject (Text)
 -> ID (Text)
 -> x (Real) - refX
 -> y (Real) - refYters>=6)
 -> width (Real) - markerWidth
 -> height (Real) - markerHeight
 -> orient (Real) - orient
 -> markerUnits (Text)
 <- nodeReference (Text)-->
# SVG_Define_marker

> SVG_Define_marker ( parentSVGObject ; id {; x ; y {; width ; height {; orientation}}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| id  |     | String |     | ➡️ |     | Name of symbol |     |
| x   |     | Longint |     | ➡️ |     | Coordinate on X axis of reference point |     |
| y   |     | Longint |     | ➡️ |     | Coordinate on Y axis of reference point |     |
| width |     | Longint |     | ➡️ |     | Width of marker |     |
| height |     | Longint |     | ➡️ |     | Height of marker |     |
| orientation |     | Longint |     | ➡️ |     | Orientation of marker |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of marker |     |

## Description

The SVG_Define_marker command creates a marker in the SVG container designated by [parentSVGObject](# "Reference of parent element") and returns its reference. If [parentSVGObject](# "Reference of parent element") is not an SVG document, an error is generated.

A marker object is used to draw an arrow or multiple markers (the points of a curve for example). A marker will be attached to an SVG element with the [SVG_SET_MARKER](SVG_SET_MARKER.md)  command.

The [id](# "Name of symbol") parameter specifies the name of the marker. The name will be used to associate a marker with an object. If an element with the same name exists, it will be replaced.

The optional [x](# "Coordinate on X axis of reference point") and [y](# "Coordinate on Y axis of reference point") parameters specify the coordinates of the reference point that must line up exactly with the marker position.

The optional [width](# "Width of marker") and [height](# "Height of marker") parameters specify the width and height of the rendered rectangle.

The optional [orientation](# "Orientation of marker") parameter can be used to adjust the orientation of the marker. A value included between 0 and 360 represents the angle between the X axis of the marker and that of the user space. If this parameter is omitted or if its value does not fall in the 0 - 360 interval, the placement will be calculated automatically by the rendering engine according to the object.

### Example  

Refer to the example of the [SVG_SET_MARKER](SVG_SET_MARKER.md)  command.

## See also

[SVG_SET_MARKER](SVG_SET_MARKER.md)
