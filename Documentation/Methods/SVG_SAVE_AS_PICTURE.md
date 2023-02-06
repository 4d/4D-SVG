<!-- SVG_SAVE_AS_PICTURE ( svgObject ; pathname ; codec )
 -> svgObject (Text)
 -> pathname (Text)
 -> codec (Text)-->
# SVG_SAVE_AS_PICTURE

> SVG_SAVE_AS_PICTURE ( svgObject ; document {; codec} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | SVG object reference |     |
| document |     | String |     | ➡️ |     | Document name or Full pathname of document |     |
| codec |     | String |     | ➡️ |     | Picture codec ID |     |

## Description

The **SVG_SAVE_AS_PICTURE** command writes the contents of the SVG object specified by [svgObject](# "SVG object reference") into the picture file specified by [document](# "Document name or Full pathname of document"). If [svgObject](# "SVG object reference") is not an SVG document, an error is generated.

In [document](# "Document name or Full pathname of document"), you can pass the full pathname of the file, or only the file name – in which case the file will be created next to the database structure file. If you pass an empty string ("") in [document](# "Document name or Full pathname of document"), the standard Save file dialog box appears so that the user can specify the name, location and format of the file to be created.

The optional [codec](# "Picture codec ID") parameter can be used to specify the format in which to save the picture. If this parameter is omitted, the picture is saved in png format.

The **SVG_SAVE_AS_PICTURE** modifies the value of the variable (if any) designated by the [SVG_SET_DOCUMENT_VARIABLE](SVG_SET_DOCUMENT_VARIABLE.md) command.

### Example  


```4d
 svgRef:=SVG_New (500;200;"Sales statistics")  
 ...  
 SVG_SAVE_AS_PICTURE (svgRef;"test.png") 
```

Save  
```4d
 SVG_SAVE_AS_PICTURE (svgRef;"test.gif";".gif")  
 SVG_CLEAR (svgRef)

```


## See also 

[SVG_Export_to_picture](SVG_Export_to_picture.md)  
[SVG_SET_DOCUMENT_VARIABLE](SVG_SET_DOCUMENT_VARIABLE.md)
