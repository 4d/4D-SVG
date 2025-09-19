# SVG_SCALING_CENTERED

>**SVG_SCALING_CENTERED** ( *svgObject* ; *scale* {; *x* ; *y*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#x1F852; | SVG object reference |
| scale | Real | &#x1F852; | Scale value |
| x | Real | &#x1F852; | X axis |
| y | Real | &#x1F852; | Y axis |



#### Description 

The **SVG\_SCALING\_CENTERED** command performs a centered scaling of the SVG image whose reference is passed in the *svgObject* parameter.

In the *scale* parameter, you pass a positive scale value (>1). If you pass 1, the scale is set to 100%.

In the optional *x* and *y* parameters, you can pass, respectively, the x- and y-axis coordinates for the center point. If you do not pass these parameters, the center point is determined based on the "x", "y", "width" and "height" attributes of the object (if any). If this type of transformation is applied to an object that does not have these attributes, and the optional *x* and *y* parameters are omitted, an empty string is returned. 
