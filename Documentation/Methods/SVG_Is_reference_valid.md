# SVG_Is_reference_valid

>**SVG_Is_reference_valid** ( *svgObject* ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#x1F852; | Reference of SVG element |
| Function result | Boolean | &#x1F850; | True if reference belongs to an SVG element |



#### Description 

The SVG\_Is\_reference\_valid command returns *True* if the reference passed in the *svgObject* parameter is that of an element of the SVG tree. If the element does not belong to an SVG tree, the command returns *False*. If *svgObject* is not a valid reference, an error is generated.

#### See also 

[SVG\_References\_array](SVG%5FReferences%5Farray.md)  