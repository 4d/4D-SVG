# SVG_SET_XY

>**SVG_SET_XY** ( *svgObject* ; *x* {; *y*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#x1F852; | Reference of SVG element |
| x | Longint | &#x1F852; | Coordinate on X axis |
| y | Longint | &#x1F852; | Coordinate on Y axis |



#### Description 

The SVG\_SET\_XY command can be used to set the coordinates of the top left corner of the rectangular area where the SVG object having the *svgObject* reference is placed. If these attributes already exist, their values are replaced by those passed as parameters. If *svgObject* is an SVG element that does not accept this attribute, an error is generated.

The values are expected in the user coordinate system.

#### Example 

```4d
 $svg :=SVG_New //Create a new document
 $object:=SVG_New_image($svg;"#Pictures/logo4D.png") //Place the logo
 SVG_SET_XY($object;10;40) //Modify the position of the picture
```
