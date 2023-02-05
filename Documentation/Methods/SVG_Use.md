<!-- nodeReference := SVG_Use ( parentReference ; URL ; x ; y ; Width ; Height )
 -> parentReference (Text)
 -> URL (Text)
 -> x (Real)
 -> y (Real)
 -> Width (Real)
 -> Height (Real)
 <- nodeReference (Text)-->
# SVG_Use

> SVG_Use ( parentSVGObjec ; id {; x ; y ; width ; height {; mode}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObjec |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| id  |     | String |     | ➡️ |     | Name of symbol |     |
| x   |     | Longint |     | ➡️ |     | X position of viewbox |     |
| y   |     | Longint |     | ➡️ |     | Y position of viewbox |     |
| width |     | Longint |     | ➡️ |     | Width of viewbox |     |
| height |     | Longint |     | ➡️ |     | Height of viewbox |     |
| mode |     | String |     | ➡️ |     | Adjustment to viewbox |     |
| Function result |     | SVG_Ref |     | ↩️ |     | SVG object reference |     |

## Description

The SVG_Use command places an occurrence of the symbol in the SVG container designated by parentSVGObject and returns its reference. If parentSVGObject is not an SVG document or if [id](# "Name of symbol") is not the object name of an SVG document, an error is generated.

A symbol is used to specify graphic objects; it is never rendered directly but may be instantiated using the SVG_Use command.

The [id](# "Name of symbol") parameter specifies the name of the symbol.

The optional [x](# "X position of viewbox"), [y](# "Y position of viewbox"), [width](# "Width of viewbox") and [height](# "Height of viewbox") parameters specify the viewbox rectangle ('viewBox' attribute).

The optional [mode](# "Adjustment to viewbox") parameter can be used to indicate if the graphic must be fitted, and how so, to the size of the viewbox. (see the [SVG_New](SVG_New.md)  command).

### Example  

Specify a graphic composed of two red circles and two blue squares. Then use this graphic in a loop to create 36 occurrences with varying positions, opacity and rotation of the original graphic.  
![](..Home.md..Home.mdpictureHome.md195636Home.mdpict195636.en.png)

```4d

```4d
 $SVG:=SVG_New   
  
```

Draw a background  
 [SVG_New_rect](SVG_New_rect.md) ($SVG;20;20;650;650;0;0;"gray";"lemonchiffon")  
  
```
Specify a symbol composed of 2 squares and 2 circles  
 $Symbol:=SVG_Define_symbol ($SVG;"MySymbol";0;0;110;110;"true")  
 [SVG_New_circle](SVG_New_circle.md) ($Symbol;30;30;25;"red";"palevioletred")  
 [SVG_New_rect](SVG_New_rect.md) ($Symbol;10;60;40;40;0;0;"blue";"cornflowerblue")  
 [SVG_New_rect](SVG_New_rect.md) ($Symbol;60;10;40;40;0;0;"blue";"cornflowerblue")  
 [SVG_New_circle](SVG_New_circle.md) ($Symbol;80;80;25;"red";"palevioletred")  
  
```

In a group…  
 $g:=SVG_New_group ($SVG)  
  
```
…positioned 20 units from the top left corner of the document…  
 [SVG_SET_TRANSFORM_TRANSLATE](SVG_SET_TRANSFORM_TRANSLATE.md) ($g;20;20)  
  
```

…place 36 patterns by varying the position, opacity and rotation  
 For($x;0;540;90)

```
6 columns  
    For($y;0;540;90) 
```

6 rows  
       $use:=SVG_Use ($g;"MySymbol";$x;$y;110;110)  
       [SVG_SET_OPACITY](SVG_SET_OPACITY.md) ($use;100-($yHome.md12)+($xHome.md12)  
       [SVG_SET_TRANSFORM_ROTATE](SVG_SET_TRANSFORM_ROTATE.md) ($use;($x*(18Home.md50))+($y*(18Home.md50));($x+55);($y+55))  
    End for  
 End for

```

```4d


  
  

## See also 

[SVG_Define_symbol](SVG_Define_symbol.md)
