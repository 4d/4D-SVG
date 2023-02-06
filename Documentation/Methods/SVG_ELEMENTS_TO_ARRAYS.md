<!-- SVG_ELEMENTS_TO_ARRAYS ( svgObject ; arrayReferences ; arrayTypes ; arrayIDs )
 -> svgObject (Text)
 -> arrayReferences (Pointer)
 -> arrayTypes (Pointer)
 -> arrayIDs (Pointer)-->
# SVG_ELEMENTS_TO_ARRAYS

> SVG_ELEMENTS_TO_ARRAYS ( svgObject ; refsArrayPointer {; typesArrayPointer {; namesArrayPointer}} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | Alpha |     | ➡️ |     | SVG reference |     |
| refsArrayPointer |     | Pointer |     | ➡️ |     | String array of object references |     |
| typesArrayPointer |     | Pointer |     | ➡️ |     | String array of object types |     |
| namesArrayPointer |     | Pointer |     | ➡️ |     | String array of object IDs |     |

## Description

The SVG_ELEMENTS_TO_ARRAYS command fills the array pointed to by [refsArrayPointer](## "String array of object references") with the references of the graphic objects of the first level for the SVG reference passed in [svgObject](## "SVG reference").

If the optional [typesArrayPointer](## "String array of object types") pointer is passed, the array will be filled with the object types.

If the optional [namesArrayPointer](## "String array of object IDs") pointer is passed, the array will be filled with object IDs.

A group counts as one object. To find out this information for the graphic objects in a group, passed its reference to the command.

If [svgObject](## "SVG reference") is not valid or if this attribute does not exist, an error is generated.

## See also

[SVG_Count_elements](SVG_Count_elements.md)  
[SVG_New_group](SVG_New_group.md)
