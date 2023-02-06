<!-- SVG_SET_ID ( object ; id )
 -> object (Text)
 -> id (Text)-->
# SVG_SET_ID

> SVG_SET_ID ( svgObject ; id )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| id  |     | String |     | ➡️ |     | ID to assign to object |     |

## Description

The SVG_SET_ID command can be used to set the ‘ID’ property of the SVG object having the [svgObject](# "Reference of SVG element") reference. If this attribute already exists, its value is replaced by the value passed in the parameter.

The object id is used to reference an object. This reference will then be recovered using the [SVG_Get_ID](SVG_Get_ID.md)  command. The id is also used by the 4D [SVG Find element ID by coordinates](SVG-Find-element-ID-by-coordinates.301-6102954.en.html "SVG Find element ID by coordinates") command (see the 4D documentation).

### Example  

```4d
 $svg:=SVG_New   
 $object:=SVG_New_rect ($svg;10;10;200;200;0;0;"black";" white";2)  
 SVG_SET_ID ($object;"border")
```

## See also

[SVG_Find_ID](SVG_Find_ID.md)  
[SVG_Get_ID](SVG_Get_ID.md)
