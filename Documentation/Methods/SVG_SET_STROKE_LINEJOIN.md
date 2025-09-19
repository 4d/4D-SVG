# SVG_SET_STROKE_LINEJOIN

>**SVG_SET_STROKE_LINEJOIN** ( *svgObject* ; *mode* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#x1F852; | Reference of SVG element |
| mode | String | &#x1F852; | Rendering mode |



#### Description 

The SVG\_SET\_STROKE\_LINEJOIN command can be used to specify the form of the path peaks of the SVG object having the *svgObject* reference. If this attribute already exists, its value is replaced by the value passed as parameter.

The *mode* parameter must contain one of the following values, managed by SVG:

* *miter* (default): standard
* *round*
* *bevel*
* *inherit*: inherited from parent object  
![](../images/pict194191.en.png)
If the *mode* parameter contains any other value, an error is generated.

#### See also 

[SVG\_SET\_ROUNDING\_RECT](SVG%5FSET%5FROUNDING%5FRECT.md)  
[SVG\_SET\_STROKE\_LINECAP](SVG%5FSET%5FSTROKE%5FLINECAP.md)  