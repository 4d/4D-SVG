# SVG_Get_text

>**SVG_Get_text** ( *svgObject* ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#x1F852; | Reference of text element |
| Function result | Text | &#x1F850; | Text contents |



#### Description 

The SVG\_Get\_text command returns the textual content of the element designated by *svgObject*. If *svgObject* is not a text object reference ('text', 'textArea' or 'tspan'), an error is generated. 

In the case of a textArea object, <tbreak/> elements are converted to CRs. 
