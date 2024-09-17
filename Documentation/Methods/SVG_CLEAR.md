<!-- SVG_CLEAR ( svgObject )
-> svgObject (Text)-->
# SVG_CLEAR

> SVG_CLEAR {( svgObject )}

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | SVG object reference |     |

## Description

The **SVG_CLEAR** command frees the memory taken up by the SVG object designated by [svgObject](## "SVG object reference").

[svgObject](## "SVG object reference") can be an SVG root object (created with the [SVG_New](SVG_New.md), [SVG_Copy](SVG_Copy.md) or [SVG_Open_file](SVG_New](SVG_New.md), [SVG_Copy](SVG_Copy.md) or [SVG_Open_file.md)  commands) or any valid SVG object.

If [svgObject](## "SVG object reference") is not passed, the command frees all the SVG objects created using [SVG_New](SVG_New.md), [SVG_Copy](SVG_Copy.md) or [SVG_Open_file](SVG_New](SVG_New.md), [SVG_Copy](SVG_Copy.md) or [SVG_Open_file.md)  commands.This syntax is useful during the development phase during which an SVG reference can be created but the memory was not released becauses of an error that prevents the execution of the method from completing. In a final development, any SVG reference that is no longer used must be freed using the SVG_CLEAR command.

## See also

[SVG_Copy](SVG_Copy.md)  
[SVG_New](SVG_New.md)  
[SVG_Open_file](SVG_Open_file.md)
