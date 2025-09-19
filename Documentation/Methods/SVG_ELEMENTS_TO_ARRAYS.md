# SVG_ELEMENTS_TO_ARRAYS

>**SVG_ELEMENTS_TO_ARRAYS** ( *svgObject* ; *refsArrayPointer* {; *typesArrayPointer* {; *namesArrayPointer*}} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | Alpha | &#8594; | SVG reference |
| refsArrayPointer | Pointer | &#8594; | String array of object references |
| typesArrayPointer | Pointer | &#8594; | String array of object types |
| namesArrayPointer | Pointer | &#8594; | String array of object IDs |



#### Description 

The SVG\_ELEMENTS\_TO\_ARRAYS command fills the array pointed to by *refsArrayPointer* with the references of the graphic objects of the first level for the SVG reference passed in *svgObject*.

If the optional *typesArrayPointer* pointer is passed, the array will be filled with the object types.

If the optional *namesArrayPointer* pointer is passed, the array will be filled with object IDs.

A group counts as one object. To find out this information for the graphic objects in a group, passed its reference to the command.

If *svgObject* is not valid or if this attribute does not exist, an error is generated.

#### See also 

[SVG\_Count\_elements](SVG%5FCount%5Felements.md)  
[SVG\_New\_group](SVG%5FNew%5Fgroup.md)  