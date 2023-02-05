<!-- SVG_GET_ATTRIBUTES ( nodeReference ; arrayNames ; arrayValues )
 -> nodeReference (Text)
 -> arrayNames (Pointer)
 -> arrayValues (Pointer)-->
# SVG_GET_ATTRIBUTES

> SVG_GET_ATTRIBUTES ( svgObject ; namesArrayPointer ; valuesArrayPointer )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | SVG reference |     |
| namesArrayPointer |     | Pointer |     | ➡️ |     | Alpha array of attribute names |     |
| valuesArrayPointer |     | Pointer |     | ➡️ |     | Alpha array of attribute values |     |

## Description

The SVG_GET_ATTRIBUTES command fills the arrays pointed to by [namesArrayPointer](# "Alpha array of attribute names") and [valuesArrayPointer](# "Alpha array of attribute values") respectively with the names and values of the attributes of the element whose reference is passed in the [svgObject](# "SVG reference") parameter. If [svgObject](# "SVG reference") is not valid or if this attribute does not exist, an error is generated.

## See also

[SVG_SET_ATTRIBUTES](SVG_SET_ATTRIBUTES.md)  
[SVG_SET_ATTRIBUTES_BY_ARRAYS](SVG_SET_ATTRIBUTES_BY_ARRAYS.md)
