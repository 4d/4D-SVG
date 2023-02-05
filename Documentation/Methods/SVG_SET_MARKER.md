<!-- SVG_SET_MARKER ( parentReference ; URL ; Type )
 -> parentReference (Text)
 -> URL (Text)
 -> Type (Text)-->
# SVG_SET_MARKER

> SVG_SET_MARKER ( svgObject ; id {; position} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| id  |     | String |     | ➡️ |     | Name of marker |     |
| position |     | String |     | ➡️ |     | Position of marker |     |

## Description

The **SVG_SET_MARKER** command can be used to associate a marker with the object having the [svgObject](# "Reference of SVG element") reference or to remove an existing marker. If [svgObject](# "Reference of SVG element") is not the reference of a 'line', 'path', 'polyline' or 'polygon' element, an error is generated. If the attribute already exists, its value is replaced.

The [id](# "Name of marker") parameter is the name of the marker element to be used as specified by the [SVG_Define_marker](SVG_Define_marker.md)  command. If this name does not exist, an error is generated.  
In order to remove an existing marker, pass "none" or an empty string in the [id](# "Name of marker") parameter.

The optional [position](# "Position of marker") parameter can be used to set the position of the marker with respect to the object. It is possible to place different markers (if desired) at the beginning, end or any other peak of a path. The values may be as follows:

* start to place a marker at the beginning of the path
* end to place a marker at the end of the path
* middle to place a marker at each peak other than at the beginning and end.
* all to place markers at all peaks of the path.  
    If this parameter is omitted, the marker will be placed at the end of the path.

### Example 1  

Draw an arrow:  
![](..Home.md..Home.mdpictureHome.md194079Home.mdpict194079.en.png)

```4d
 $SVG:=SVG_New   
  
```

Set the arrow  
```4d
 $arrow:=SVG_Define_marker ($SVG;"arrow";0;5;4;3;-1)  
 [SVG_SET_VIEWBOX](SVG_SET_VIEWBOX.md) ($arrow;0;0;10;10)  
 $path:=SVG_New_path ($arrow;0;0)  
 [SVG_SET_FILL_BRUSH](SVG_SET_FILL_BRUSH.md) ($path;"black")  
 [SVG_PATH_LINE_TO](SVG_PATH_LINE_TO.md) ($path;10;5)  
 [SVG_PATH_LINE_TO](SVG_PATH_LINE_TO.md) ($path;0;10)  
 [SVG_PATH_CLOSE](SVG_PATH_CLOSE.md) ($path)  

 $line:=SVG_New_path ($SVG;100;75)  
 [SVG_SET_STROKE_WIDTH](SVG_SET_STROKE_WIDTH.md) ($line;10)  
 [SVG_PATH_LINE_TO](SVG_PATH_LINE_TO.md) ($line;200;75)  
 [SVG_PATH_LINE_TO](SVG_PATH_LINE_TO.md) ($line;250;125)  
  
```
Put an arrow at the end of a path 
```4d 
 [SVG_SET_MARKER](SVG_SET_MARKER.md) ($line;" arrow ")
```
 


### Example 2  

Draw a diagram with different markers at the beginning and end:  
![](..Home.md..Home.mdpictureHome.md194080Home.mdpict194080.en.png)
 

```4d
 $SVG:=SVG_New   
 [SVG_SET_DEFAULT_BRUSHES](SVG_SET_DEFAULT_BRUSHES.md) ("red";"red")  
   
  
```

Set a circle to mark the points  
```4d
 $point:=SVG_Define_marker ($SVG;"pointMarker";2;2;3;3)  
 [SVG_SET_VIEWBOX](SVG_SET_VIEWBOX.md) ($point;0;0;4;4)  
 [SVG_New_circle](SVG_New_circle.md) ($point;2;2;1)  

```
Set a square for the starting point  
```4d
 $start:=SVG_Define_marker ($SVG;"startMarker";1;1;2;2)  
 [SVG_New_rect](SVG_New_rect.md) ($start;0;0;2;2)  
   
  
```

Set a triangle for the end point  
```4d
 $end:=SVG_Define_marker ($SVG;"endMarker";5;5;3;3;60)  
 [SVG_SET_VIEWBOX](SVG_SET_VIEWBOX.md) ($end;0;0;10;10)  
 [SVG_New_regular_polygon](SVG_New_regular_polygon.md) ($end;10;3)  

 ARRAY LONGINT($tX;0)  
 ARRAY LONGINT($tY;0)  
  
```
X axis  
```4d
 For($Lon_i;0;200;20)  
    APPEND TO ARRAY($tX;$Lon_i+10)  
 End for  
  
```

Data  
```4d
 APPEND TO ARRAY($tY;100)  
 APPEND TO ARRAY($tY;100)  
 APPEND TO ARRAY($tY;30)  
 APPEND TO ARRAY($tY;30)  
 APPEND TO ARRAY($tY;80)  
 APPEND TO ARRAY($tY;60)  
 APPEND TO ARRAY($tY;10)  
 APPEND TO ARRAY($tY;40)  
 APPEND TO ARRAY($tY;50)  
 APPEND TO ARRAY($tY;70)  
 $line:=SVG_New_polyline_by_arrays ($SVG;->$tX;->$tY;"red";"none";5)  
  
```
Arrange the markers:  
```4d
 [SVG_SET_MARKER](SVG_SET_MARKER.md) ($line;"startMarker";"start")  
 [SVG_SET_MARKER](SVG_SET_MARKER.md) ($line;"pointMarker";"middle")  
 [SVG_SET_MARKER](SVG_SET_MARKER.md) ($line;"endMarker";"end")
```
 
  

## See also 

[SVG_Define_marker](SVG_Define_marker.md)
