# SVG_Count_elements

>**SVG_Count_elements** ( *svgObject* ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | SVG reference |
| Function result | Longint | &#8592; | Number of objects |



#### Description 

The SVG\_Count\_elements command returns the number of graphic objects contains in the *svgObject* passed as parameter. A group counts as one object. To find out the number of graphic objects in a group, passed its reference to the command. If *svgObject* is not valid, an error is generated.

#### See also 

[SVG\_ELEMENTS\_TO\_ARRAYS](SVG_ELEMENTS_TO_ARRAYS.md)  
[SVG\_New\_group](SVG_New_group.md)  