<!-- Buffer := SVG_Export_to_picture ( svgObject ; exportType )
 -> svgObject (Text)
 -> exportType (Long Integer)
 <- Buffer (Picture)-->
# SVG_Export_to_picture

> SVG_Export_to_picture ( svgObject {; exportType} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | SVG object reference |     |
| exportType |     | Longint |     | ➡️ |     | 0 = Do not store data source 1 (default) = Copy data source 2 = Own data source |     |
| Function result |     | Picture |     | ↩️ |     | Picture rendered by SVG engine |     |

## Description

The SVG_Export_to_picture command returns the picture described by the SVG structure referenced by [svgObject](# "SVG object reference").

The optional [exportType](# "0 = Do not store data source 1 (default) = Copy data source 2 = Own data source") parameter can be used to specify the way in which the XML data source must be handled by the command. For more information about this parameter, refer to the description of the 4D [SVG EXPORT TO PICTURE](https://doc.4d.com/4Dv19/4D/19.5/SVG-EXPORT-TO-PICTURE.301-6137564.en.html) command. If this parameter is omitted, the default value is 1, Copy XML Data Source.

### Example  

```4d
 svgRef:=SVG_New (500;200;Test component)  
 ...  
 MyPicture:=SVG_Export_to_picture (svgRef;0)  
   
 SVG_CLEAR (svgRef)
```

## See also

[SVG_Export_to_XML](SVG_Export_to_XML.md)  
[SVG_Open_picture](SVG_Open_picture.md)  
[SVG_SAVE_AS_PICTURE](SVG_SAVE_AS_PICTURE.md)
