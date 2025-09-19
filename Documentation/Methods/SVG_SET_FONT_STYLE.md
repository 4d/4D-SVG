# SVG_SET_FONT_STYLE

>**SVG_SET_FONT_STYLE** ( *svgObject* ; *style* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#x1F852; | Reference of SVG element |
| style | Integer | &#x1F852; | Style of characters |



#### Description 

The SVG\_SET\_FONT\_STYLE command can be used to specify the text style for the SVG object having the *svgObject* reference. If *svgObject* does not reference a valid element, an error is generated.

In the *style* parameter, you must pass one of the following values or a combination of several values:

> 0 = Plain  
> 1 = Bold  
> 2 = Italic  
> 4 = Underline  
> 8 = Strikethrough

#### See also 

[SVG\_SET\_FONT\_SIZE](SVG%5FSET%5FFONT%5FSIZE.md)  