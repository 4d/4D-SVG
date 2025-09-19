# SVG_SET_TRANSFORM_MATRIX

>**SVG_SET_TRANSFORM_MATRIX** ( *svgObject* ; *a* ; *b* {; *c* ; *d* {; *e* ; *f*}} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#x1F852; | Reference of SVG element |
| a | Longint | &#x1F852; | Element a of transform matrix |
| b | Longint | &#x1F852; | Element b of transform matrix |
| c | Longint | &#x1F852; | Element c of transform matrix |
| d | Longint | &#x1F852; | Element d of transform matrix |
| e | Longint | &#x1F852; | Element e of transform matrix |
| f | Longint | &#x1F852; | Element f of transform matrix |



#### Description 

The SVG\_SET\_TRANSFORM\_MATRIX command applies a matrix transformation to the SVG object having the *svgObject* reference.

This type of transformation can be used to combine transformations like, for example, a rotation and a translation.

#### Example 

![](../images/pict194249.en.png)

```4d
 SVG_SET_TRANSFORM_MATRIX($ID;0,707;-0,707;0,707;0,707;255,03;111,21)
  //Is equivalent to applying the 3 following transformations:
 SVG_SET_TRANSFORM_TRANSLATE($ID;50;90)
 SVG_SET_TRANSFORM_ROTATE($ID;-45)
 SVG_SET_TRANSFORM_TRANSLATE($ID;130;160)
```

#### See also 

[SVG\_SET\_TRANSFORM\_ROTATE](SVG%5FSET%5FTRANSFORM%5FROTATE.md)  