<!-- SVG_SET_STROKE_LINEJOIN ( objectID ; linejoin )
 -> objectID (Text)
 -> linejoin (Text)-->
# SVG_SET_STROKE_LINEJOIN

> SVG_SET_STROKE_LINEJOIN ( svgObject ; mode )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| mode |     | String |     | ➡️ |     | Rendering mode |     |

## Description

The SVG_SET_STROKE_LINEJOIN command can be used to specify the form of the path peaks of the SVG object having the [svgObject](## "Reference of SVG element") reference. If this attribute already exists, its value is replaced by the value passed as parameter.

The [mode](## "Rendering mode") parameter must contain one of the following values, managed by SVG:

* miter (default): standard
* round
* bevel
* inherit: inherited from parent object  
    ![](https://doc.4d.com/4Dv19/picture/194191/pict194191.en.png)

If the [mode](## "Rendering mode") parameter contains any other value, an error is generated.

## See also

[SVG_SET_ROUNDING_RECT](SVG_SET_ROUNDING_RECT.md)  
[SVG_SET_STROKE_LINECAP](SVG_SET_STROKE_LINECAP.md)
