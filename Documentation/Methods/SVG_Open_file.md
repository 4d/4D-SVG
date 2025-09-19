# SVG_Open_file

>**SVG_Open_file** ( *path* ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| path | String | &#x1F852; | Pathname of SVG document to open |
| Function result | SVG_Ref | &#x1F850; | Document reference |



#### Description 

The SVG\_Open\_file command parses (and validates with the DTD) the SVG document found at the location designated by the *path* parameter and returns an SVG reference (32-character string) for this document.

**Important:** Once you no longer need it, do not forget to call the *SVG\_CLEAR* command with this reference in order to free up the memory.

#### See also 

[SVG\_CLEAR](SVG%5FCLEAR.md)  
[SVG\_Copy](SVG%5FCopy.md)  
[SVG\_New](SVG%5FNew.md)  