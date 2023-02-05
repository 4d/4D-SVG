<!-- SVG_SET_OPACITY ( object ; fillOpacity ; strokeOpacity )
 -> object (Text)
 -> fillOpacity (Long Integer)
 -> strokeOpacity (Long Integer)-->
# SVG_SET_OPACITY

> SVG_SET_OPACITY ( svgObject ; background {; line} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| background |     | Longint |     | ➡️ |     | Opacity (%) |     |
| line |     | Longint |     | ➡️ |     | Opacity (%) |     |

## Description

The SVG_SET_OPACITY command can be used to set the opacity of the filling and the line of the object having the [svgObject](# "Reference of SVG element") reference. If these attributes already exist, their values are replaced by those passed as parameters.

The values expected must be included between 0 and 100.

### Example  

 Create a new document

```4d
 $svg :=SVG_New  
```

Set the line opacity to 50%

```4d
 $object:=SVG_New_rect ($svg ;10;10;200;100;0;0;"red";"blue")  
 [SVG_SET_OPACITY](SVG_SET_OPACITY.md) ($object;-1;50)
```

## See also

[SVG Colors](SVG%20Colors.md)
