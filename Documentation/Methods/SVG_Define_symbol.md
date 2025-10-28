# SVG_Define_symbol

>**SVG_Define_symbol** ( *parentSVGObject* ; *id* {; *x* {; *y* {; *width* {; *height* {; *mode*}}}}} ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| parentSVGObject | SVG_Ref | &#8594; | Reference of parent element |
| id | String | &#8594; | Name of symbol |
| x | Longint | &#8594; | X position of viewbox |
| y | Longint | &#8594; | Y position of viewbox |
| width | Longint | &#8594; | Width of viewbox |
| height | Longint | &#8594; | Height of viewbox |
| mode | String | &#8594; | Adjustment to viewbox |
| Function result | SVG_Ref | &#8592; | Reference of symbol |



#### Description 

The SVG\_Define\_symbol command creates a symbol in the SVG container designated by *parentSVGObject* and returns its reference. If *parentSVGObject* is not an SVG document, an error is generated.

A symbol object is used to specify graphic objects that may be instantiated using the *SVG\_Use* command.

The *id* parameter specifies the name of the symbol.

The optional *x*, *y*, *width* and *height* parameters specify the viewbox rectangle ('viewBox' attribute).

The optional *mode* parameter can be used to indicate if the graphic must be fitted, and how so, to the size of the viewbox. For more information about this point, please refer to the description of the *SVG\_New* command.

#### Example 

Refer to the description of the *SVG\_Use* command.

#### See also 

[SVG\_Use](SVG_Use.md)  