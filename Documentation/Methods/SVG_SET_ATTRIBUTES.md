<!-- SVG_SET_ATTRIBUTES ( objectID ; Param_2 ; … ; N )
 -> objectID (Text)
 -> Param_2 ; … ; N (Text)-->
# SVG_SET_ATTRIBUTES

> SVG_SET_ATTRIBUTES ( svgObject ; attributeName ; attributeValue {; attributeName2 ; attributeValue2 ; ... ; attributeNameN ; attributeValueN} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| attributeName |     | String |     | ➡️ |     | Name of attribute to set |     |
| attributeValue |     | String |     | ➡️ |     | Value of attribute |     |

## Description

The SVG_SET_ATTRIBUTES command can be used to assign one or more custom attributes to an SVG object having the [svgObject](## "Reference of SVG element") reference. If one or more of these attributes already exist, their values are replaced by those passed as parameters.

The attributes and their values are passed as paired parameters.

### Example  

```4d
 $svg:=SVG_New   
 $object:=SVG_New_rect ($svg;10;10;200;200;0;0;"black";"white";2)  
 SVG_SET_ATTRIBUTES ($object;"style";"fill:red; stroke:blue; stroke-width:3")
```

## See also

[SVG_GET_ATTRIBUTES](SVG_GET_ATTRIBUTES.md)  
[SVG_SET_ATTRIBUTES_BY_ARRAYS](SVG_SET_ATTRIBUTES_BY_ARRAYS.md)
