# SVG_Find_ID

>**SVG_Find_ID** ( *svgObject* ; *name* ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#x1F852; | Reference of SVG object |
| name | String | &#x1F852; | ID of SVG element |
| Function result | SVG_Ref | &#x1F850; | Reference of element |



#### Description 

The SVG\_Find\_ID command returns the reference of the element whose ID is passed in the *name* parameter, belonging to the SVG structure whose root element is passed in *svgObject*.  
If the element is not found, an error is generated.

#### See also 

[SVG\_Get\_ID](SVG%5FGet%5FID.md)  
[SVG\_SET\_ID](SVG%5FSET%5FID.md)  