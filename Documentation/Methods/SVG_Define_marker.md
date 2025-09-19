# SVG_Define_marker

>**SVG_Define_marker** ( *parentSVGObject* ; *id* {; *x* ; *y* {; *width* ; *height* {; *orientation*}}} ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| parentSVGObject | SVG_Ref | &#8594; | Reference of parent element |
| id | String | &#8594; | Name of symbol |
| x | Longint | &#8594; | Coordinate on X axis of reference point |
| y | Longint | &#8594; | Coordinate on Y axis of reference point |
| width | Longint | &#8594; | Width of marker |
| height | Longint | &#8594; | Height of marker |
| orientation | Longint | &#8594; | Orientation of marker |
| Function result | SVG_Ref | &#8592; | Reference of marker |



#### Description 

The SVG\_Define\_marker command creates a marker in the SVG container designated by *parentSVGObject* and returns its reference. If *parentSVGObject* is not an SVG document, an error is generated.

A marker object is used to draw an arrow or multiple markers (the points of a curve for example). A marker will be attached to an SVG element with the *SVG\_SET\_MARKER* command.

The *id* parameter specifies the name of the marker. The name will be used to associate a marker with an object. If an element with the same name exists, it will be replaced.

The optional *x* and *y* parameters specify the coordinates of the reference point that must line up exactly with the marker position.

The optional *width* and *height* parameters specify the width and height of the rendered rectangle.

The optional *orientation* parameter can be used to adjust the orientation of the marker. A value included between 0 and 360 represents the angle between the X axis of the marker and that of the user space. If this parameter is omitted or if its value does not fall in the 0 - 360 interval, the placement will be calculated automatically by the rendering engine according to the object.

#### Example 

Refer to the example of the *SVG\_SET\_MARKER* command.

#### See also 

[SVG\_SET\_MARKER](SVG%5FSET%5FMARKER.md)  