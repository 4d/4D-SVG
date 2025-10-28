# SVG_SET_ATTRIBUTES

>**SVG_SET_ATTRIBUTES** ( *svgObject* ; *attributeName* ; *attributeValue* {; *attributeName2* ; *attributeValue2* ; ... ; *attributeNameN* ; *attributeValueN*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | Reference of SVG element |
| attributeName | String | &#8594; | Name of attribute to set |
| attributeValue | String | &#8594; | Value of attribute |



#### Description 

The SVG\_SET\_ATTRIBUTES command can be used to assign one or more custom attributes to an SVG object having the *svgObject* reference. If one or more of these attributes already exist, their values are replaced by those passed as parameters.

The attributes and their values are passed as paired parameters.

#### Example 

```4d
 $svg:=SVG_New
 $object:=SVG_New_rect($svg;10;10;200;200;0;0;"black";"white";2)
 SVG_SET_ATTRIBUTES($object;"style";"fill:red; stroke:blue; stroke-width:3")
```

#### See also 

[SVG\_GET\_ATTRIBUTES](SVG_GET_ATTRIBUTES.md)  
[SVG\_SET\_ATTRIBUTES\_BY\_ARRAYS](SVG_SET_ATTRIBUTES_BY_ARRAYS.md)  