# SVG_SET_TEXTAREA_TEXT

>**SVG_SET_TEXTAREA_TEXT** ( *svgObject* ; *theText* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | Reference of text element |
| theText | Text | &#8594; | Text to set |



#### Description 

The SVG\_SET\_TEXTAREA\_TEXT command can be used to set/replace the textual content of the text object designated by *svgObject*. If *svgObject* is not a "textArea" object, an error is generated. 

The line return characters are automatically replaced by "<tbreak/>" elements. 

#### See also 

[SVG\_APPEND\_TEXT\_TO\_TEXTAREA](SVG_APPEND_TEXT_TO_TEXTAREA.md)  
[SVG\_New\_textArea](SVG_New_textArea.md)  