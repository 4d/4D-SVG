# SVG_Open_file

>**SVG_Open_file** ( *path* ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| path | String | &#8594; | Pathname of SVG document to open |
| Function result | SVG_Ref | &#8592; | Document reference |



#### Description 

The SVG\_Open\_file command parses (and validates with the DTD) the SVG document found at the location designated by the *path* parameter and returns an SVG reference (32-character string) for this document.

**Important:** Once you no longer need it, do not forget to call the *SVG\_CLEAR* command with this reference in order to free up the memory.

#### See also 

[SVG\_CLEAR](SVG_CLEAR.md)  
[SVG\_Copy](SVG_Copy.md)  
[SVG\_New](SVG_New.md)  