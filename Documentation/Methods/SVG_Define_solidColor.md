# SVG_Define_solidColor

>**SVG_Define_solidColor** ( *parentSVGObject* ; *id* ; *color* {; *opacity*} )  -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| parentSVGObject | SVG_Ref | &#8594; | Reference of parent element |
| id | String | &#8594; | Color name |
| color | String | &#8594; | Color expression |
| opacity | Longint | &#8594; | Opacity |
| Function result | SVG_Ref | &#8592; | Color reference |



#### Description 

The SVG\_Define\_solidColor command sets a new custom color in the SVG container designated by *parentSVGObject* and returns its reference. If *parentSVGObject* is not an SVG document, an error is generated.

The *id* parameter specifies the color name. The name will be used to associate a color with an object. If an element with the same name exists, it will be replaced.

The *color* parameter is a color expression recognized by SVG (see *Colors and Gradients*).

The optional *opacity* parameter can be used to specify an opacity (from 0 to 100) for this color. If the parameter is omitted, the opacity will be 100%.

The color set in this way will be associated with the fill or stroke paint by passing the string "url(#ID)" as the value when a color expression is expected.

#### Example 

```4d
  //Set blue to 50%
 SVG_Define_solidColor($svg;"MyColor";"blue";50)
 ...
 SVG_New_rect($svg;0;0;20;20;0;0;"url(#MyColor)";"url(#MyColor)")
 ...
 $line:=SVG_New_line(10;10;100;100)
 SVG_SET_STROKE_BRUSH($line;"url(#MyColor)")
```

#### See also 

[SVG Colors](../SVG%20Colors.md)  