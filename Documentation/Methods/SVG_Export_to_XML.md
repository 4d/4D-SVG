<!-- buffer := SVG_Export_to_XML ( svgObject )
 -> svgObject (Text)
 <- buffer (Text)-->
# SVG_Export_to_XML

> SVG_Export_to_XML ( svgObject ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | SVG object reference |     |
| Function result |     | Text |     | ↩️ |     | XML text of SVG document |     |

## Description

The SVG_Export_to_XML command returns the XML text of the description of the SVG structure referenced by [svgObject](# "SVG object reference").

### Example  

```4d
 svgRef:=SVG_New (500;200;Test component)  
 ...  
 MyText:=SVG_Export_to_XML (svgRef)  
   
 [SVG_CLEAR](SVG_CLEAR.md) (svgRef)
```

## See also

[SVG_Export_to_picture](SVG_Export_to_picture.md)  
[SVG_SAVE_AS_TEXT](SVG_SAVE_AS_TEXT.md)
