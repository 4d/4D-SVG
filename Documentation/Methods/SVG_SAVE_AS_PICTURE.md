# SVG_SAVE_AS_PICTURE

>**SVG_SAVE_AS_PICTURE** ( *svgObject* ; *document* {; *codec*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | SVG object reference |
| document | String | &#8594; | Document name or Full pathname of document |
| codec | String | &#8594; | Picture codec ID |



#### Description 

The **SVG\_SAVE\_AS\_PICTURE** command writes the contents of the SVG object specified by *svgObject* into the picture file specified by *document*. If *svgObject* is not an SVG document, an error is generated.

In *document*, you can pass the full pathname of the file, or only the file name – in which case the file will be created next to the database structure file. If you pass an empty string ("") in *document*, the standard Save file dialog box appears so that the user can specify the name, location and format of the file to be created.

The optional *codec* parameter can be used to specify the format in which to save the picture. If this parameter is omitted, the picture is saved in png format.

The **SVG\_SAVE\_AS\_PICTURE** modifies the value of the variable (if any) designated by the *SVG\_SET\_DOCUMENT\_VARIABLE* command.

#### Example 

```4d
 svgRef:=SVG_New(500;200;"Sales statistics")
 ...
 SVG_SAVE_AS_PICTURE(svgRef;"test.png") //Save
 SVG_SAVE_AS_PICTURE(svgRef;"test.gif";".gif")
 SVG_CLEAR(svgRef)
```

#### See also 

[SVG\_Export\_to\_picture](SVG_Export_to_picture.md)  
[SVG\_SET\_DOCUMENT\_VARIABLE](SVG_SET_DOCUMENT_VARIABLE.md)  