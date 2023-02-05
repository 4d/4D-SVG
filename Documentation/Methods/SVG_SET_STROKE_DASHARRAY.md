<!-- SVG_SET_STROKE_DASHARRAY ( object ; Param_2 ; Param_3 ; … ; N )
 -> object (Text)
 -> Param_2 (Real)
 -> Param_3 ; … ; N (Long Integer)-->
# SVG_SET_STROKE_DASHARRAY

> SVG_SET_STROKE_DASHARRAY ( svgObject ; dash {; value}{; value2 ; ... ; valueN} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| dash |     | Real |     | ➡️ |     | Length of first dash |     |
| value |     | Longint |     | ➡️ |     | Length of spaces and dashes |     |

## Description

The SVG_SET_STROKE_DASHARRAY command is used to set the pattern of dashes and gaps used to outline the path of the SVG object passed in [svgObject](# "Reference of SVG element"). If [svgObject](# "Reference of SVG element") is not a valid SVG reference, an error is generated.

The whole value of the [dash](# "Length of first dash") parameter indicates the length of the first dash of the dotted pattern. If the [value](# "Length of spaces and dashes") parameters are omitted, the dotted line will consists of a series of dashes and gaps of the same length.

The decimal value of the [dash](# "Length of first dash") parameter, if it is not null, indicates the distance into the pattern from which the dashes will start.

If [dash](# "Length of first dash") is 0, the dotted pattern is removed.

The [value](# "Length of spaces and dashes") parameters alternately specify the lengths of the gaps and dashes that follow the first dash. If an odd number of values is given (including the first dash), the list of values is repeated until it produces an even number of values.

**See Also:** [www.w3.orgHome.mdTRHome.mdSVGHome.mdpainting.html#StrokeProperties](www.w3.orgHome.mdTRHome.mdSVGHome.mdpainting.html#StrokeProperties)

### Example  

Illustrations of a dotted line path:  
![](..Home.md..Home.mdpictureHome.md359111Home.mdpict359111.en.png)

```4d
  // Line  
 $Dom_line:=SVG_New_line ($Dom_SVG;10;10;500;500)  
 [SVG_SET_STROKE_WIDTH](SVG_SET_STROKE_WIDTH.md) ($Dom_line;10)  
 [SVG_SET_STROKE_DASHARRAY](SVG_SET_STROKE_DASHARRAY.md) ($Dom_line;8,099)  
 [SVG_SET_STROKE_BRUSH](SVG_SET_STROKE_BRUSH.md) ($Dom_line;"red")  
   
  // Rectangle  
 $Dom_rect:=SVG_New_rect ($Dom_SVG;25;30;320;240;10;10;"red";"yellow:30")  
 [SVG_SET_STROKE_WIDTH](SVG_SET_STROKE_WIDTH.md) ($Dom_rect;5)  
 [SVG_SET_STROKE_DASHARRAY](SVG_SET_STROKE_DASHARRAY.md) ($Dom_rect;2)  
   
  // Circle  
 $Dom_circle:=SVG_New_circle ($Dom_SVG;350;400;100;"blue";"none")  
 [SVG_SET_STROKE_DASHARRAY](SVG_SET_STROKE_DASHARRAY.md) ($Dom_circle;2;4;6;8)
```
