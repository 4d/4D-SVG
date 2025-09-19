# SVG_Export_to_XML

>**SVG_Export_to_XML** ( *svgObject* ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#x1F852; | SVG object reference |
| Function result | Text | &#x1F850; | XML text of SVG document |



#### Description 

The SVG\_Export\_to\_XML command returns the XML text of the description of the SVG structure referenced by *svgObject*.

#### Example 

```4d
 svgRef:=SVG_New(500;200;“ Test component ”)
 ...
 MyText:=SVG_Export_to_XML(svgRef)
 
 SVG_CLEAR(svgRef)
```

#### See also 

[SVG\_Export\_to\_picture](SVG%5FExport%5Fto%5Fpicture.md)  
[SVG\_SAVE\_AS\_TEXT](SVG%5FSAVE%5FAS%5FTEXT.md)  