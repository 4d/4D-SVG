<!-- SVG_SET_ROUNDING_RECT ( objectID ; rx ; ry )
 -> objectID (Text)
 -> rx (Real)
 -> ry (Real)-->
# SVG_SET_ROUNDING_RECT

> SVG_SET_ROUNDING_RECT ( svgObject ; roundedX {; roundedY} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| roundedX |     | Longint |     | ➡️ |     | Radius on X axis |     |
| roundedY |     | Longint |     | ➡️ |     | Radius on Y axis |     |

## Description

The SVG_SET_ROUNDING_RECT command can be used to set the radii of the ellipse used to round the corners of a rectangle having the [svgObject](# "Reference of SVG element") reference. If these attributes already exist, their values are replaced by those passed as parameters. If [svgObject](# "Reference of SVG element") is not the reference of a rectangle, an error is generated.

The values are expected in the user coordinate system.

### Example  

```4d

```4d
 $svg :=SVG_New  
```

 Create a new document  
 $object:=SVG_New_rect ($svg ;10;10;200;100)  
 SVG_SET_ROUNDING_RECT ($object;20)

```
Round the corners
```

```4d


  
  

## See also 

[SVG_New_rect](SVG_New_rect.md)  
[SVG_SET_STROKE_LINEJOIN](SVG_SET_STROKE_LINEJOIN.md)
