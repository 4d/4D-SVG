<!-- Long Integer := SVG_References_array ( Param_1 )
 -> Param_1 (Pointer)-->
# SVG_References_array

> SVG_References_array ( refsArrayPointer ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| refsArrayPointer |     | Pointer |     | ➡️ |     | Alpha array of document references |     |
| Function result |     | Longint |     | ↩️ |     | Number of references |     |

## Description

The SVG_References_array command returns the list of current SVG document references in the array pointed to by [refsArrayPointer](# "Alpha array of document references"). As the result, the command returns the number of references found.

SVG_References_array is useful when debugging. Each time an SVG document is created with the [SVG_New](SVG_New.md), [SVG_Copy](SVG_Copy.md) or [SVG_Open_file](SVG_Open_file.md) component commands, the component adds the reference returned by the command to an internal array. When an SVG document is released using the [SVG_CLEAR](SVG_New](SVG_New.md), [SVG_Copy](SVG_Copy.md) or [SVG_Open_file](SVG_Open_file.md) component commands, the component adds the reference returned by the command to an internal array. When an SVG document is released using the [SVG_CLEAR.md)  command, the component removes its reference from the array.

## See also

[SVG_Is_reference_valid](SVG_Is_reference_valid.md)
