# SVG_SET_OPACITY

>**SVG_SET_OPACITY** ( *svgObject* ; *background* {; *line*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | Reference of SVG element |
| background | Longint | &#8594; | Opacity (%) |
| line | Longint | &#8594; | Opacity (%) |



#### Description 

The SVG\_SET\_OPACITY command can be used to set the opacity of the filling and the line of the object having the *svgObject* reference. If these attributes already exist, their values are replaced by those passed as parameters.

The values expected must be included between 0 and 100.

#### Example 

```4d
 $svg :=SVG_New // Create a new document
 $object:=SVG_New_rect($svg ;10;10;200;100;0;0;"red";"blue")
 SVG_SET_OPACITY($object;-1;50) //Set the line opacity to 50%
```

#### See also 

[SVG Colors](../colors-and-gradients.md)  