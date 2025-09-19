# SVG_GET_DEFAULT_BRUSHES

>**SVG_GET_DEFAULT_BRUSHES** ( *line* {; *background*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| line | Pointer | &#8594; | Alpha variable |
| background | Pointer | &#8594; | Alpha variable |



#### Description 

The SVG\_GET\_DEFAULT\_BRUSHES command returns, in the variable pointed to by *line*, the current default color for drawing lines.

If the optional *background* parameter is passed, the variable pointed to by this parameter will receive the current default color used for backgrounds.

If they have not been modified, these colors are, respectively, black and white.

#### Example 

See the *SVG\_SET\_DEFAULT\_BRUSHES* command.

#### See also 

[SVG\_SET\_DEFAULT\_BRUSHES](SVG_SET_DEFAULT_BRUSHES.md)  
[SVG\_SET\_STROKE\_BRUSH](SVG_SET_STROKE_BRUSH.md)  