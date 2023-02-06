<!-- Text := SVG_Color_from_index ( index )
-> index (Long Integer)-->
# SVG_Color_from_index

> SVG_Color_from_index ( index ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| index |     | Longint |     | ➡️ |     | Number of color |     |
| Function result |     | Text field |     | ↩️ |     | Color designated by index |     |

## Description

The **SVG_Color_from_index** returns the SVG color matching the 4D color specified in the [index](# "Number of color") parameter.

The [index](# "Number of color") parameter designates a number in the 4D color palette, where colors are numbered from 1 to 256. For more information about this point, refer to the description of the 4D [_o_OBJECT SET COLOR](o-OBJECT-SET-COLOR.301-6101929.en.html) command.

### Example  

 In this example, we recreate the 4D color palette:

```4d
 $Dom_svg:=SVG_New   
 $Lon_line:=0  
 For($Lon_ii;0;15;1)  
    $Lon_column:=0  
    For($Lon_i;1;16;1)  
       $Txt_color:=SVG_Color_from_index (($Lon_ii*16)+$Lon_i)  
       $Dom_rect:=SVG_New_rect ($Dom_svg;$Lon_column;  
       $Lon_line;11;11;0;0;"white";$Txt_color)  
       $Lon_column:=$Lon_column+11  
    End for  
    $Lon_line:=$Lon_line+11  
 End for  
 [SVGTool_SHOW_IN_VIEWER](SVGTool_SHOW_IN_VIEWER.md "SVGTool_SHOW_IN_VIEWER")($Dom_svg)
```

![](https://doc.4d.com/4Dv19/picture/927034/pict927034.en.png)

## See also

[SVG_Color_RGB_from_long](SVG_Color_RGB_from_long.md)
