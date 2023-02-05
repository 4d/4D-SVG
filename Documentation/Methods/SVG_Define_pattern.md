<!-- Text := SVG_Define_pattern ( svgObject ; ID ; width ; height ; x ; y ; patternUnits ; viewBox )
 -> svgObject (Text)
 -> ID (Text)
 -> width (Real)
 -> height (Real)
 -> x (Real)
 -> y (Real)
 -> patternUnits (Text)
 -> viewBox (Text)-->
# SVG_Define_pattern

> SVG_Define_pattern ( parentSVGObject ; patternID {; width {; height {; x {; y {; unit {; viewBox}}}}}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| patternID |     | Text |     | ➡️ |     | Name of pattern |     |
| width |     | Longint |     | ➡️ |     | Width of pattern |     |
| height |     | Longint |     | ➡️ |     | Height of pattern |     |
| x   |     | Longint |     | ➡️ |     | Position X of pattern |     |
| y   |     | Longint |     | ➡️ |     | Position Y of pattern |     |
| unit |     | Text |     | ➡️ |     | Unit of lengths and positions |     |
| viewBox |     | Text |     | ➡️ |     | Viewbox rectangle |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of pattern |     |

## Description

The SVG_Define_pattern command is used to set a new custom pattern in the SVG container designated by [parentSVGObject](# "Reference of parent element") and returns its reference. If [parentSVGObject](# "Reference of parent element") is not (or does not belong to) an SVG document, an error is generated.

The [patternID](# "Name of pattern") parameter specifies the name of the pattern. This name will be used to associate the pattern with an object. If an element with the same name already exists, an error is generated.

The optional [width](# "Width of pattern"), [height](# "Height of pattern"), [x](# "Position X of pattern"), [y](# "Position Y of pattern"), [unit](# "Unit of lengths and positions") and [viewBox](# "Viewbox rectangle") parameters define the reference rectangle of the pattern, in other words, the way the pattern tiles will be placed and spaced.

The pattern will be associated as fill or stroke paint by passing the "url(#id)" string as the value when a color expression is expected.

**See Also:** [www.w3.orgHome.mdTRHome.mdSVGHome.mdpservers.html#Patterns](www.w3.orgHome.mdTRHome.mdSVGHome.mdpservers.html#Patterns)

### Example 1  

Setting a pattern and using it to fill an ellipse:  
![](..Home.md..Home.mdpictureHome.md359150Home.mdpict359150.en.png)

```4d
  // Definition of pattern  
 $Dom_pattern:=SVG_Define_pattern ($Dom_SVG;"MyPattern";100;100;0;0;"";"0 0 10 10")  
 $Dom_path:=SVG_New_path ($Dom_pattern;0;0)  
   
 [SVG_PATH_MOVE_TO](SVG_PATH_MOVE_TO.md) ($Dom_path;0;0)  
 [SVG_PATH_LINE_TO](SVG_PATH_LINE_TO.md) ($Dom_path;7;0)  
 [SVG_PATH_LINE_TO](SVG_PATH_LINE_TO.md) ($Dom_path;3,5;7)  
 [SVG_PATH_CLOSE](SVG_PATH_CLOSE.md) ($Dom_path)  
 [SVG_SET_FILL_BRUSH](SVG_SET_FILL_BRUSH.md) ($Dom_path;"red")  
 [SVG_SET_STROKE_BRUSH](SVG_SET_STROKE_BRUSH.md) ($Dom_path;"blue")  
   
  // Drawing an ellipse filled with the pattern  
 $Dom_ellipse:=SVG_New_ellipse ($Dom_SVG;400;200;350;150;"black";"url(#MyPattern)";5)
```

### Example 2  

Setting a pattern and using it to fill and stroke the outline of an ellipse:  
![](..Home.md..Home.mdpictureHome.md359157Home.mdpict359157.en.png)

```4d
  // Definition of pattern  
 $Dom_pattern:=SVG_Define_pattern ($Dom_SVG;"MyPattern ";80;80;0;0;"";"0 0 20 20")  
 $Dom_rect:=SVG_New_rect ($Dom_pattern;0;0;20;20;0;0;"white";"red")  
   
  // Drawing an ellipse  
 $Dom_ellipse:=SVG_New_ellipse ($Dom_SVG;400;200;350;150)  
   
  // Using pattern for filling and outline  
 [SVG_SET_FILL_BRUSH](SVG_SET_FILL_BRUSH.md) ($Dom_ellipse;"url(#MyPattern)")  
 [SVG_SET_STROKE_BRUSH](SVG_SET_STROKE_BRUSH.md) ($Dom_ellipse;"url(#MyPattern)")
```
