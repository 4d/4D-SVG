# SVG_SET_TEXT_ANCHOR

>**SVG_SET_TEXT_ANCHOR** ( *svgObject* ; *alignment* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | Reference of SVG element |
| alignment | Integer | &#8594; | Alignment |



#### Description 

The SVG\_SET\_TEXT\_ANCHOR command can be used to modify the alignment of the SVG object having the *svgObject* reference. If *svgObject* does not reference a valid element, an error is generated.

In the *alignment* parameter, you must pass one of the following values:

> 1 = Align default (left)  
> 2 = Align left  
> 3 = Center  
> 4 = Align right  
> 5 = Justify (only for textArea object)

#### See also 

[SVG\_New\_textArea](SVG_New_textArea.md)  