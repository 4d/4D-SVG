# SVG_New_polygon

>**SVG_New_polygon** ( *parentSVGObject* {; *points* {; *foregroundColor* {; *backgroundColor* {; *strokeWidth*}}}} ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| parentSVGObject | SVG_Ref | &#x1F852; | Reference of parent element |
| points | String | &#x1F852; | Path |
| foregroundColor | String | &#x1F852; | Color or gradient name |
| backgroundColor | String | &#x1F852; | Color or gradient name |
| strokeWidth | Real | &#x1F852; | Line thickness |
| Function result | SVG_Ref | &#x1F850; | Reference of polygon |



#### Description 

The SVG\_New\_polygon command creates a new closed form in the SVG container designated by *parentSVGObject* and returns its reference. If *parentSVGObject* is not a valid reference, an error is generated.

The optional *points* parameter can be used to pass thepath points of the polygon as expected by the SVG standard. If this parameter is omitted or empty, the points may be set using the *SVG\_ADD\_POINT* command.

The optional *foregroundColor* and *backgroundColor* parameters contain, respectively, the name of the line color and of the background color. (For more information about colors, please refer to the ”Colors and gradients” section).

The optional *strokeWidth* parameter contains the size of the pen expressed in pixels. Its default value is 1.

#### See also 

[SVG\_New\_polygon\_by\_arrays](SVG%5FNew%5Fpolygon%5Fby%5Farrays.md)  
[SVG\_New\_rect](SVG%5FNew%5Frect.md)  
[SVG\_New\_regular\_polygon](SVG%5FNew%5Fregular%5Fpolygon.md)  