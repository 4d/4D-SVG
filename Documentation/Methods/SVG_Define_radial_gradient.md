<!-- objectID := SVG_Define_radial_gradient ( svgObject ; ID ; startColor ; stopColor ; Param_5 ; Param_6 ; Param_7 ; Param_8 ; Param_9 ; Param_10 )
 -> svgObject (Text)
 -> ID (Text)
 -> startColor (Text)
 -> stopColor (Text)
 -> Param_5 (Long Integer)
 -> Param_6 (Long Integer)
 -> Param_7 (Long Integer)
 -> Param_8 (Long Integer)
 -> Param_9 (Long Integer)
 -> Param_10 (Text)
 <- objectID (Text)-->
# SVG_Define_radial_gradient

> SVG_Define_radial_gradient ( parentSVGObject ; id ; startColor ; endColor {; cx ; cy ; r {; fx ; fy}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| id  |     | String |     | ➡️ |     | Name of gradient |     |
| startColor |     | String |     | ➡️ |     | Start color |     |
| endColor |     | String |     | ➡️ |     | End color |     |
| cx  |     | Integer |     | ➡️ |     | Coordinate on X axis of center of endColor |     |
| cy  |     | Integer |     | ➡️ |     | Coordinate on Y axis of center of endColor |     |
| r   |     | Integer |     | ➡️ |     | Radius of endColor |     |
| fx  |     | Integer |     | ➡️ |     | Coordinate on X axis of center of startColor |     |
| fy  |     | Integer |     | ➡️ |     | Coordinate on Y axis of center of startColor |     |
| Function result |     | String |     | ↩️ |     | Reference of gradient |     |

## Description

The SVG_Define_radial_gradient command sets a new radial gradient in the SVG container designated by [parentSVGObject](# "Reference of parent element") and returns its reference. If [parentSVGObject](# "Reference of parent element") is not an SVG document, an error is generated.

A gradient consists in a continuous progressive color transition from one color to another along a vector. Once specified, gradients are called on a given graphic element, while indicating whether this element must be filled or edged with the gradient called.

The [id](# "Name of gradient") parameter specifies the name of the gradient. If an element with the same name exists, it will be replaced. This is the name that will be used to call the gradient each time a that a color expression is expected by using the syntax "url(#ID)".

The [startColor](# "Start color") and [endColor](# "End color") parameters specify the colors used to begin and end the gradient.

The optional [cx](# "Coordinate on X axis of center of endColor"), [cy](# "Coordinate on Y axis of center of endColor") and [r](# "Radius of endColor") parameters specify, in percent, the external border circle of the endColor of the gradient. Their values must be included between 0 and 100.

The optional [fx](# "Coordinate on X axis of center of startColor") and [fy](# "Coordinate on Y axis of center of startColor") parameters specify, in percent, the focus point of the gradient. The [startColor](# "Start color") begins at the point \[[fx](# "Coordinate on X axis of center of startColor"),[fy](# "Coordinate on Y axis of center of startColor")\]. Their values must be included between 0 and 100. If these arguments are omitted, this point coincides with \[[cx](# "Coordinate on X axis of center of endColor"),[cy](# "Coordinate on Y axis of center of endColor")\].

### Example  

![](https://doc.4d.com/4Dv19/picture/195917/pict195917.en.png)
 

```4d
 $svg:=SVG_New   
   
 SVG_Define_radial_gradient ($svg;"grad1";"yellow";"red")  
 SVG_New_rect ($svg;10;10;90;90;0;0;"black";"url(#grad1)")  
 SVG_New_text ($svg;"grad1";12;10)  
   
 SVG_Define_radial_gradient ($svg;"grad2";"yellow";"red";50;50;20;50;50)  
 SVG_New_rect ($svg;110;10;90;90;0;0;"black";"url(#grad2)")  
 SVG_New_text ($svg;"grad2";112;10)  
   
 SVG_Define_radial_gradient ($svg;"grad3";"yellow";"red";80;60;50;60;80)  
 SVG_New_rect ($svg;10;110;90;90;0;0;"black";"url(#grad3)")  
 SVG_New_text ($svg;"grad3";12;110)  
   
 SVG_Define_radial_gradient ($svg;"grad4";"yellow";"red";20;50;80;20;30)  
 SVG_New_rect ($svg;110;110;90;90;0;0;"black";"url(#grad4)")  
 SVG_New_text ($svg;"grad4";112;110)  
  
```

Save document  
```4d
 SVG_SAVE_AS_TEXT ($svg;"test.svg")  
  
```
Free up memory  
```4d
 SVG_CLEAR ($svg)
```


## See also 

[SVG Colors](SVG%20Colors.md)  
[SVG_Define_linear_gradient](SVG_Define_linear_gradient.md)
