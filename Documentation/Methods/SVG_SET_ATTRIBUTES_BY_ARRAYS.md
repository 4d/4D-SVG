<!-- SVG_SET_ATTRIBUTES_BY_ARRAYS ( objectID ; Param_2 ; Param_3 )
 -> objectID (Text)
 -> Param_2 (Pointer)
 -> Param_3 (Pointer)-->
# SVG_SET_ATTRIBUTES_BY_ARRAYS

> SVG_SET_ATTRIBUTES_BY_ARRAYS ( svgObject ; namesArrayPointer ; valuesArrayPointer )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| namesArrayPointer |     | Pointer |     | ➡️ |     | Names of attributes |     |
| valuesArrayPointer |     | Pointer |     | ➡️ |     | Synchronized values of attributes |     |

## Description

The SVG_SET_ATTRIBUTES_BY_ARRAYS command can be used to assign one or more custom attributes to an SVG object having the [svgObject](# "Reference of SVG element") reference. If one or more of these attributes already exist, their values will be replaced by those passed as parameters.

The attributes and their values are passed using two arrays, to which [namesArrayPointer](# "Names of attributes") and [valuesArrayPointer](# "Synchronized values of attributes") point.

### Example  

```4d
 $svg:=SVG_New   
 $object:=SVG_New_rect ($svg;10;10;200;200;0;0;"black";"white";2)  
 ARRAY TEXT($attributes;0)  
 ARRAY TEXT($values;0)  
 APPEND TO ARRAY($attributes;"fill")  
 APPEND TO ARRAY($values;"red")  
 APPEND TO ARRAY($attributes;"stroke")  
 APPEND TO ARRAY($values;"blue")  
 APPEND TO ARRAY($attributes;"stroke-width")  
 APPEND TO ARRAY($values;"3")  
 SVG_SET_ATTRIBUTES_BY_ARRAYS ($object;->$attributes;->$values)
```

## See also

[SVG_GET_ATTRIBUTES](SVG_GET_ATTRIBUTES.md)  
[SVG_SET_ATTRIBUTES](SVG_SET_ATTRIBUTES.md)
