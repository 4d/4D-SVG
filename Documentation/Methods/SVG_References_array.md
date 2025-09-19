# SVG_References_array

>**SVG_References_array** ( *refsArrayPointer* ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| refsArrayPointer | Pointer | &#8594; | Alpha array of document references |
| Function result | Longint | &#8592; | Number of references |



#### Description 

The SVG\_References\_array command returns the list of current SVG document references in the array pointed to by *refsArrayPointer*. As the result, the command returns the number of references found.

SVG\_References\_array is useful when debugging. Each time an SVG document is created with the *SVG\_New*, *SVG\_Copy* or *SVG\_Open\_file* component commands, the component adds the reference returned by the command to an internal array. When an SVG document is released using the *SVG\_CLEAR* command, the component removes its reference from the array.

#### See also 

[SVG\_Is\_reference\_valid](SVG%5FIs%5Freference%5Fvalid.md)  