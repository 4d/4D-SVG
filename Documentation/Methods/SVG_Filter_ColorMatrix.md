# SVG_Filter_ColorMatrix

>**SVG_Filter_ColorMatrix** ( *svgObject* {; *in* ; *result*} {; *type* {; *values*}} ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#x1F852; | SVG object reference |
| in | Text | &#x1F852; | Identifies input for the given filter primitive |
| result | Text | &#x1F852; | Provides a reference for the output result of a filter |
| type | Text | &#x1F852; | Indicates the type of matrix operation |
| values | Text | &#x1F852; | Numeric values for the transformation matrix |
| Function result | SVG_Ref | &#x1F850; | Reference for SVG object with new color values |



#### Description 

The **SVG\_Filter\_ColorMatrix** command applies a color matrix transformation to each pixel in the source image passed in the *svgObject* parameter to produce a result with a new set of color values.

In the *in* parameter, you can either pass a string which matches a previous ‘result’ value or one of the six following keywords: 

* *SourceGraphic*: the target element (image, shape, group etc.) that references the filter. This keyword epresents the graphics elements that were the original input into the ‘filter’ element
* *SourceAlpha*: the canvas beneath the *SourceGraphic*. This keyword represents the graphics elements that were the original input into the ‘filter’ element.
* *BackgroundImage*: the canvas beneath the *SourceGraphic*. This keyword represents an image snapshot of the canvas under the filter region at the time that the ‘filter’ element was invoked.
* *BackgroundAlpha*: the alpha channel of the canvas beneath the *SourceGraphic*. Same as *BackgroundImage* except only the alpha channel is used
* *FillPaint*: a pseudo-graphic equal to the size of the filter region filled with the fill property of the target element. This keyword represents the value of the ‘fill’ property on the target element for the filter effect.
* *StrokePaint*: a pseudo-graphic equal to the size of the filter region filled with the stroke property of the target element. This keyword represents the value of the ‘stroke’ property on the target element for the filter effect.

If no value is passed and this is the first filter primitive, then the *SourceGraphic* is used as its input. If no value is provided and this is a subsequent filter primitive, then this filter primitive will use the result from the previous filter primitive as its input.

In the *result* parameter, you pass a reference for the output result of a filter which can be referenced by the *in* parameter on a subsequent use of this command within the same ‘filter’ element. If no value is provided, the output is only available for re-use as the implicit input for the next filter primitive if that filter primitive provides no value for its *in* parameter.

In the *type* parameter, you can specify the type of matrix operation by passing one of the following keywords:

* *saturate*: adjusts the saturation of all RGB color channels using a real number value of 0 to 1 that is passed in the *values* parameter.
* *hueRotate*: rotates the pixel hue of all RGB color channels by the angle specified (in degree) in the *values* parameter,
* *luminanceToAlpha*: converts the red, green and blue channels into a luminance value. The RGB channels are set to black (0,0,0).)
* *matrix*: sets the color using the list of values passed in the *values* parameter. Allows the value of each channel in the output to be specified from a combination of its existing color and alpha channels.

If you do not pass a *type* parameter, by default the effect is as if a value of *matrix* were specified.

In the *values* parameter, you pass numeric values based on the keyword passed in the *type* parameter:

* With the "*matrix*" keyword: you pass a list of 20 matrix values, separated by whitespace and/or a comma.
* With the "*saturate*" keyword: you pass a single real number value (0 to 1). The permitted value according to the specification is 0-1, but many browsers accept higher values >1 to allow over-saturation.
* With the "*hueRotate*" keyword: you pass a single real number value (to indicate degrees of rotation).
* With the "*luminanceToAlpha*" keyword: you do not pass a numeric value. The *values* parameter is not used with this type, which discards the alpha channel and replaces it with values equal to the input's luminance.

If you do not pass a *values* parameter, the default behavior depends on the keyword passed in the *type* parameter:

* With the "*matrix*" keyword: by default the values of the identity matrix are used
* With the "*saturate*" keyword: by default, the value is 1 (no change).
* With the "*hueRotate*" keyword: by default the value is 0 (no change).
* With the "*luminanceToAlpha*" keyword: by default, this parameter is not used.

**Note:** Under Windows, this command requires the prior disabling of Direct2D (see the Direct2D disabled constant in the description of the *SET DATABASE PARAMETER* command).

#### Example 

![](../images/pict1788318.en.png)

```4d
 var $Dom_filter;$Dom_node;$Dom_rect;$Dom_svg;$Txt_matrix : Text
 
 SVG_SET_OPTIONS(SVG_Get_options?+5)
 
 $Dom_svg:=SVG_New
 
 $Dom_filter:=SVG_Define_filter($Dom_svg;"Matrix")
 $Txt_matrix:=\
 ".33 .33 .33 0 0 "\
 +".33 .33 .33 0 0 "\
 +".33 .33 .33 0 0 "\
 +".33 .33 .33 0 0"
 
 
 $Dom_node:=SVG_Filter_ColorMatrix($Dom_filter;"SourceGraphic";"";"matrix";$Txt_matrix)
 
 $Dom_filter:=SVG_Define_filter($Dom_svg;"Saturate")
 $Dom_node:=SVG_Filter_ColorMatrix($Dom_filter;"SourceGraphic";"";"saturate";"1.5")
  // another syntax for value
  //$Dom_node:=SVG_Filter_ColorMatrix ($Dom_filter;"SourceGraphic";"";"saturate";String(1,5;"&xml"))
 
 $Dom_filter:=SVG_Define_filter($Dom_svg;"HueRotate90")
 $Dom_node:=SVG_Filter_ColorMatrix($Dom_filter;"SourceGraphic";"";"hueRotate";"90")
 
 $Dom_filter:=SVG_Define_filter($Dom_svg;"LuminanceToAlpha")
 $Dom_node:=SVG_Filter_ColorMatrix($Dom_filter;"SourceGraphic";"";"luminanceToAlpha")
 
 $Dom_rect:=SVG_New_rect($Dom_svg;2;0;797;100;0;0;"none";"coral")
 
 $Dom_rect:=SVG_New_rect($Dom_svg;2;100;797;100;0;0;"none";"coral")
 SVG_SET_FILTER($Dom_rect;"Matrix")
 
 $Dom_rect:=SVG_New_rect($Dom_svg;2;200;797;100;0;0;"none";"coral")
 SVG_SET_FILTER($Dom_rect;"Saturate")
 
 $Dom_rect:=SVG_New_rect($Dom_svg;2;300;797;100;0;0;"none";"coral")
 SVG_SET_FILTER($Dom_rect;"HueRotate90")
 
 $Dom_rect:=SVG_New_rect($Dom_svg;2;400;797;100;0;0;"none";"coral")
 SVG_SET_FILTER($Dom_rect;"LuminanceToAlpha")
 
 SVG_New_text($Dom_svg;"No filter";110;10;"Verdana";60;Bold;-1;"black")
 SVG_New_text($Dom_svg;"Matrix";110;110;"Verdana";60;Bold;-1;"black")
 SVG_New_text($Dom_svg;"Saturate";110;210;"Verdana";60;Bold;-1;"black")
 SVG_New_text($Dom_svg;"HueRotate";110;310;"Verdana";60;Bold;-1;"black")
 SVG_New_text($Dom_svg;"Luminance";110;410;"Verdana";60;Bold;-1;"black")
 
  //View the result
 SVGTool_SHOW_IN_VIEWER($Dom_svg)
 
  //SVG_SAVE_AS_TEXT($Dom_svg;System folder(Desktop)+"export.svg")
 
  //Don't forget to clear the memory
 SVG_CLEAR($Dom_svg)
```
