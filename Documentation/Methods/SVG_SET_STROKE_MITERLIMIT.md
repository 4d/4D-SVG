# SVG_SET_STROKE_MITERLIMIT

>**SVG_SET_STROKE_MITERLIMIT** ( *svgObject* ; *join* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | Reference of SVG element |
| join | Longint | &#8594; | Value of join |



#### Description 

The SVG\_SET\_STROKE\_MITERLIMIT command is used to set the limit for the length of the miter join between the path and the outline of the SVG object designated by *svgObject*. If *svgObject* is not a valid SVG reference, an error is generated. 

If the *join* parameter is -1, the value will be the default value (4). If the *join* parameter is 0, then the definition of the attribute is removed. Any other value < 0 will cause an error. 

**See Also:** *http://www.w3.org/TR/SVG/painting.html#StrokeProperties*
