<!-- nodeReference := SVG_Define_solidColor ( svgObject ; ID ; color ; Param_4 )
 -> svgObject (Text)
 -> ID (Text)
 -> color (Text)
 -> Param_4 (Long Integer)
 <- nodeReference (Text)-->
# SVG_Define_solidColor

> SVG_Define_solidColor ( parentSVGObject ; id ; color {; opacity} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| id  |     | String |     | ➡️ |     | Color name |     |
| color |     | String |     | ➡️ |     | Color expression |     |
| opacity |     | Longint |     | ➡️ |     | Opacity |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Color reference |     |

## Description

The SVG_Define_solidColor command sets a new custom color in the SVG container designated by [parentSVGObject](# "Reference of parent element") and returns its reference. If [parentSVGObject](# "Reference of parent element") is not an SVG document, an error is generated.

The [id](# "Color name") parameter specifies the color name. The name will be used to associate a color with an object. If an element with the same name exists, it will be replaced.

The [color](# "Color expression") parameter is a color expression recognized by SVG (see [Colors and Gradients](Colors%20and%20Gradients.md "Colors and Gradients")).

The optional [opacity](# "Opacity") parameter can be used to specify an opacity (from 0 to 100) for this color. If the parameter is omitted, the opacity will be 100%.

The color set in this way will be associated with the fill or stroke paint by passing the string "url(#ID)" as the value when a color expression is expected.

### Example  

```4d

```4d
  
```

Set blue to 50%  
 [SVG_Define_solidColor](SVG_Define_solidColor.md) ($svg;"MyColor";"blue";50)  
 ...  
 [SVG_New_rect](SVG_New_rect.md) ($svg;0;0;20;20;0;0;"url(#MyColor)";"url(#MyColor)")  
 ...  
 $line:=SVG_New_line (10;10;100;100)  
 [SVG_SET_STROKE_BRUSH](SVG_SET_STROKE_BRUSH.md) ($line;"url(#MyColor)")

```

```4d


  
  

## See also 

[SVG Colors](SVG%20Colors.md)
