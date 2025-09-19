# SVG_GET_ATTRIBUTES

>**SVG_GET_ATTRIBUTES** ( *svgObject* ; *namesArrayPointer* ; *valuesArrayPointer* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | SVG reference |
| namesArrayPointer | Pointer | &#8594; | Alpha array of attribute names |
| valuesArrayPointer | Pointer | &#8594; | Alpha array of attribute values |



#### Description 

The SVG\_GET\_ATTRIBUTES command fills the arrays pointed to by *namesArrayPointer* and *valuesArrayPointer* respectively with the names and values of the attributes of the element whose reference is passed in the *svgObject* parameter. If *svgObject* is not valid or if this attribute does not exist, an error is generated.

#### See also 

[SVG\_SET\_ATTRIBUTES](SVG%5FSET%5FATTRIBUTES.md)  
[SVG\_SET\_ATTRIBUTES\_BY\_ARRAYS](SVG%5FSET%5FATTRIBUTES%5FBY%5FARRAYS.md)  