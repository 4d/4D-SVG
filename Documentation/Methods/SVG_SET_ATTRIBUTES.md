# SVG_SET_ATTRIBUTES

>**SVG_SET_ATTRIBUTES** ( *svgObject* ; *attributeName* ; *attributeValue* {; *attributeName2* ; *attributeValue2* ; ... ; *attributeNameN* ; *attributeValueN*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#x1F852; | Reference of SVG element |
| attributeName | String | &#x1F852; | Name of attribute to set |
| attributeValue | String | &#x1F852; | Value of attribute |



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

[SVG\_GET\_ATTRIBUTES](SVG%5FGET%5FATTRIBUTES.md)  
[SVG\_SET\_ATTRIBUTES\_BY\_ARRAYS](SVG%5FSET%5FATTRIBUTES%5FBY%5FARRAYS.md)  