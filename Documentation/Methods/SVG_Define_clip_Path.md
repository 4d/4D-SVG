<!-- Text := SVG_Define_clip_Path ( svgObject ; ID )
 -> svgObject (Text)
 -> ID (Text)-->
# SVG_Define_clip_path

> SVG_Define_clip_path ( parentSVGObject ; clipPathID ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| clipPathID |     | Text |     | ➡️ |     | Name of clip path |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of clip path |     |

## Description

The SVG_Define_clip_path command specifies a new clip path in the SVG container designated by [parentSVGObject](# "Reference of parent element") and returns its reference. If [parentSVGObject](# "Reference of parent element") is not (or does not belong to) an SVG document, an error is generated.

The [clipPathID](# "Name of clip path") parameter designates the name of the clip path. This name will be used to associate a clip path with an object. If an element with the same name already exists in the document, an error is generated.

**See Also:** [www.w3.org/TR/2001/REC-SVG-20010904/masking.html#EstablishingANewClippingPath](www.w3.org/TR/2001/REC-SVG-20010904/masking.html#EstablishingANewClippingPath)

### Example  

Refer to the example of the [SVG_SET_CLIP_PATH](SVG_SET_CLIP_PATH.md)  command.

## See also

[SVG_SET_CLIP_PATH](SVG_SET_CLIP_PATH.md)
