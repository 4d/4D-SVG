# SVG_Export_to_picture

>**SVG_Export_to_picture** ( *svgObject* {; *exportType*} ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | SVG object reference |
| exportType | Longint | &#8594; | 0 = Do not store data source 1 (default) = Copy data source 2 = Own data source |
| Function result | Picture | &#8592; | Picture rendered by SVG engine |



#### Description 

The SVG\_Export\_to\_picture command returns the picture described by the SVG structure referenced by *svgObject*.

The optional *exportType* parameter can be used to specify the way in which the XML data source must be handled by the command. For more information about this parameter, refer to the description of the 4D *SVG EXPORT TO PICTURE* command. If this parameter is omitted, the default value is 1, Copy XML Data Source.

#### Example 

```4d
 svgRef:=SVG_New(500;200;“Test component”)
 ...
 MyPicture:=SVG_Export_to_picture(svgRef;0)
 
 SVG_CLEAR(svgRef)
```

#### See also 

[SVG\_Export\_to\_XML](SVG_Export_to_XML.md)  
[SVG\_Open\_picture](SVG_Open_picture.md)  
[SVG\_SAVE\_AS\_PICTURE](SVG_SAVE_AS_PICTURE.md)  