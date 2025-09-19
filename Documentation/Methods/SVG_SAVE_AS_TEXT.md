# SVG_SAVE_AS_TEXT

>**SVG_SAVE_AS_TEXT** ( *svgObject* {; *document*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#x1F852; | SVG object reference |
| document | String | &#x1F852; | Document name or Full pathname of document |



#### Description 

The **SVG\_SAVE\_AS\_TEXT** command writes the content of the SVG object specified by *svgObject* into the disk file specified by *document*. If *svgObject* is not an SVG document, an error is generated.

In *document*, you can pass the full pathname of the file, or only the file name – in which case the file will be created next to the database structure file. If you pass an empty string ("") in document or omit this parameter, the standard Save file dialog box appears so that the user can specify the name, location and format of the file to be created.

The **SVG\_SAVE\_AS\_TEXT** modifies the value of the variable (if any) designated by the *SVG\_SET\_DOCUMENT\_VARIABLE* command.

#### Example 

```4d
 svgRef:=SVG_New(500;200;"Sales statistics")
 ...
 SVG_SAVE_AS_TEXT(svgRef;"test.svg") //The document is saved next to the structure
 SVG_CLEAR(svgRef)
```

#### See also 

[SVG\_Export\_to\_XML](SVG%5FExport%5Fto%5FXML.md)  
[SVG\_SET\_DOCUMENT\_VARIABLE](SVG%5FSET%5FDOCUMENT%5FVARIABLE.md)  