<!-- SVG_SET_XY ( objectID ; x ; y )
 -> objectID (Text)
 -> x (Real)
 -> y (Real)-->
# SVG_SET_XY

> SVG_SET_XY ( svgObject ; x {; y} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| x   |     | Longint |     | ➡️ |     | Coordinate on X axis |     |
| y   |     | Longint |     | ➡️ |     | Coordinate on Y axis |     |

## Description

The SVG_SET_XY command can be used to set the coordinates of the top left corner of the rectangular area where the SVG object having the [svgObject](# "Reference of SVG element") reference is placed. If these attributes already exist, their values are replaced by those passed as parameters. If [svgObject](# "Reference of SVG element") is an SVG element that does not accept this attribute, an error is generated.

The values are expected in the user coordinate system.

### Example  

```4d

```4d
 $svg :=SVG_New  
```

Create a new document  
 $object:=SVG_New_image ($svg;"#PicturesHome.mdlogo4D.png")

```
Place the logo  
 [SVG_SET_XY](SVG_SET_XY.md) ($object;10;40) 
```

Modify the position of the picture

```

```4d
