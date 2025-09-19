# SVG_SET_ROUNDING_RECT

>**SVG_SET_ROUNDING_RECT** ( *svgObject* ; *roundedX* {; *roundedY*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#x1F852; | Reference of SVG element |
| roundedX | Longint | &#x1F852; | Radius on X axis |
| roundedY | Longint | &#x1F852; | Radius on Y axis |



#### Description 

The SVG\_SET\_ROUNDING\_RECT command can be used to set the radii of the ellipse used to round the corners of a rectangle having the *svgObject* reference. If these attributes already exist, their values are replaced by those passed as parameters. If *svgObject* is not the reference of a rectangle, an error is generated.

The values are expected in the user coordinate system.

#### Example 

```4d
 $svg :=SVG_New // Create a new document
 $object:=SVG_New_rect($svg ;10;10;200;100)
 SVG_SET_ROUNDING_RECT($object;20) //Round the corners
```

#### See also 

[SVG\_New\_rect](SVG%5FNew%5Frect.md)  
[SVG\_SET\_STROKE\_LINEJOIN](SVG%5FSET%5FSTROKE%5FLINEJOIN.md)  