<!-- SVG_SAVE_AS_TEXT ( svgObject ; pathname )
 -> svgObject (Text)
 -> pathname (Text)-->
# SVG_SAVE_AS_TEXT

> SVG_SAVE_AS_TEXT ( svgObject {; document} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | SVG object reference |     |
| document |     | String |     | ➡️ |     | Document name or Full pathname of document |     |

## Description

The **SVG_SAVE_AS_TEXT** command writes the content of the SVG object specified by [svgObject](## "SVG object reference") into the disk file specified by [document](## "Document name or Full pathname of document"). If [svgObject](## "SVG object reference") is not an SVG document, an error is generated.

In [document](## "Document name or Full pathname of document"), you can pass the full pathname of the file, or only the file name – in which case the file will be created next to the database structure file. If you pass an empty string ("") in document or omit this parameter, the standard Save file dialog box appears so that the user can specify the name, location and format of the file to be created.

The **SVG_SAVE_AS_TEXT** modifies the value of the variable (if any) designated by the [SVG_SET_DOCUMENT_VARIABLE](SVG_SET_DOCUMENT_VARIABLE.md) command.

### Example  

```4d
 svgRef:=SVG_New (500;200;"Sales statistics")  
 ...  
 SVG_SAVE_AS_TEXT (svgRef;"test.svg") // The document is saved next to the structure  
 SVG_CLEAR (svgRef)
```

## See also

[SVG_Export_to_XML](SVG_Export_to_XML.md)  
[SVG_SET_DOCUMENT_VARIABLE](SVG_SET_DOCUMENT_VARIABLE.md)
