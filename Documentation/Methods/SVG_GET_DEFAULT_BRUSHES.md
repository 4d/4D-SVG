# SVG_GET_DEFAULT_BRUSHES

>**SVG_GET_DEFAULT_BRUSHES** ( *line* {; *background*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| line | Pointer | &#x1F852; | Alpha variable |
| background | Pointer | &#x1F852; | Alpha variable |



#### Description 

The SVG\_GET\_DEFAULT\_BRUSHES command returns, in the variable pointed to by *line*, the current default color for drawing lines.

If the optional *background* parameter is passed, the variable pointed to by this parameter will receive the current default color used for backgrounds.

If they have not been modified, these colors are, respectively, black and white.

#### Example 

See the *SVG\_SET\_DEFAULT\_BRUSHES* command.

#### See also 

[SVG\_SET\_DEFAULT\_BRUSHES](SVG%5FSET%5FDEFAULT%5FBRUSHES.md)  
[SVG\_SET\_STROKE\_BRUSH](SVG%5FSET%5FSTROKE%5FBRUSH.md)  