<!-- rootReference := SVG_Open_file ( path ; validate )
 -> path (Text)
 -> validate (Boolean)
 <- rootReference (Text)-->
# SVG_Open_file

> SVG_Open_file ( path ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| path |     | String |     | ➡️ |     | Pathname of SVG document to open |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Document reference |     |

## Description

The SVG_Open_file command parses (and validates with the DTD) the SVG document found at the location designated by the [path](# "Pathname of SVG document to open") parameter and returns an SVG reference (32-character string) for this document.

**Important:** Once you no longer need it, do not forget to call the [SVG_CLEAR](SVG_CLEAR.md)  command with this reference in order to free up the memory.

## See also

[SVG_CLEAR](SVG_CLEAR.md)  
[SVG_Copy](SVG_Copy.md)  
[SVG_New](SVG_New.md)
