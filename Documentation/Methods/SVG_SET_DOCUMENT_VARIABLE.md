# SVG_SET_DOCUMENT_VARIABLE

>**SVG_SET_DOCUMENT_VARIABLE** ( *pointer* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| pointer | Pointer | &#8594; | Pointer to variable to set |



#### Description 

The **SVG\_SET\_DOCUMENT\_VARIABLE** method sets a pointer to the variable of the host database that is updated after each call to *SVG\_SAVE\_AS\_PICTURE* or *SVG\_SAVE\_AS\_TEXT*. You must call this method only once per session (in an initialization method, for instance).

In the *pointer* parameter, you pass a pointer to the variable whose value you want to follow (usually the **Document** system variable).

You can pass a Nil pointer in the *pointer* parameter to remove the link.

#### See also 

[SVG\_SAVE\_AS\_PICTURE](SVG%5FSAVE%5FAS%5FPICTURE.md)  
[SVG\_SAVE\_AS\_TEXT](SVG%5FSAVE%5FAS%5FTEXT.md)  